#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define nbit 32
#define n_col 64
#define n_row 17

int main()
{
    int P = 2;
    int n_steps = 0;
    int a = 4;
    int thr = nbit;

    //entity generation
    printf("library ieee;\nuse ieee.std_logic_unsigned.all;\nuse ieee.std_logic_arith.all;\nuse ieee.std_logic_1164.all;\n\n");

    printf("entity DaddaTree is\n");
    printf("\tgeneric\n\t(\n\t\tnbit : integer := %d\n\t);\n", nbit);
    printf("\tport\n\t(\n\t\t");

    for (int i=0; i<n_row; ++i)
    {
        printf("P%d", i);
        if(i!=n_row-1)
            printf(", ");
    }
    printf(" : in std_logic_vector(nbit downto 0);\n\t\tS : in std_logic_vector(nbit/2-1 downto 0);\n\t\tO1, O2: out std_logic_vector(2*nbit-1 downto 0)\n\t);\nend entity;\n\n");

    //architecture gen
    printf("architecture Structural of DaddaTree is\n\n");

    //component declaration
    printf("\tcomponent HA is \n\t\tport\n\t\t(\n\t\t\tA, B: in std_logic;\n\t\t\tO, Co: out std_logic\n\t\t);\n\tend component;\n\n");
    printf("\tcomponent FA is \n\t\tport\n\t\t(\n\t\t\tA, B, Ci: in std_logic;\n\t\t\tO, Co: out std_logic\n\t\t);\n\tend component;\n\n");

    //tyes and internal signal
    while (P < n_row)
    {
        printf("\ttype st_type%d is array (integer range 0 to %d-1) of std_logic_vector(2*nbit downto 0);\n", n_steps, P);
        printf("\tsignal stage%d : st_type%d;\n", n_steps, n_steps);
        ++n_steps;
        P = floor(P * 3/2.);
    }
    printf("\ttype st_type%d is array (integer range 0 to %d-1) of std_logic_vector(2*nbit downto 0);\n", n_steps, n_row);
    printf("\tsignal stage%d : st_type%d;\n", n_steps, n_steps);

    P = ceil(P * 2/3.);

    //architecture begin
    printf("\n\tbegin\n\n");
    
    //internal signals initialization
    for (int i=0; i<n_row; ++i)
    {
        printf("\t\tstage%d(%d)(%d downto %d) <= P%d;\n", n_steps, i, (2*i)+nbit, (2*i), i);

        if (i == 0)
        {
            printf("\t\tstage%d(%d)(%d) <= not S(%d);\n", n_steps, i, (2*i)+nbit+a-1, i);
            printf("\t\tstage%d(%d)(%d downto %d) <= (others => S(%d));\n", n_steps, i, (2*i)+nbit+a-2, (2*i)+nbit+1, i);
            printf("\t\tstage%d(%d)(%d) <= S(%d);\n", n_steps, i+1, (2*i), i);
        }
        
        if (i > 0 && i < n_row-2)
        {
            printf("\t\tstage%d(%d)(%d downto %d) <= ('1' & not S(%d));\n", n_steps, i, (2*i)+nbit+2, (2*i)+nbit+1, i);
            printf("\t\tstage%d(%d)(%d) <= S(%d);\n", n_steps, i+1, (2*i), i);
        }

        if (i == n_row-2)
        {
            printf("\t\tstage%d(%d)(%d) <= not S(%d);\n", n_steps, i, (2*i)+nbit+1, i);
            printf("\t\tstage%d(%d)(%d) <= S(%d);\n", n_steps, i+1, (2*i), i);
        }
    }

    printf("\n");

    int f_step_chk = n_steps;

    //internal place and route of FA/HA
    while (n_steps > 0)
    {
        printf("\t--stage %d:\n\n", n_steps);
        int col = 0;
        int in_row = 0;
        int out_row = 0;
        int next_out_row = 0;
        int n_dot = 0;
        int n_HA = 0;
        int n_FA = 0;
        int next_thr;
        int next_a;
        int row_descend_fix = 0;

        //foreach column
        while (col < n_col)
        {
            //if it is the first step
            if (n_steps == f_step_chk)
            {
                //evaluation of the number of dots in a given column
                if (col < thr)
                {
                    if (col%2 == 0)
                        n_dot += 2;
                    else
                        n_dot -= 1;
                }
                else if (col == thr)
                {
                    if (col%2 == 0)
                        n_dot += 1;
                }
                else if (col == thr + a)
                {
                    n_dot -= 1;
                    ++row_descend_fix;
                    in_row = row_descend_fix;
                }
                else if (col > thr + a)
                {
                    if (col%2 != 0)
                    {
                        n_dot -= 1;
                        ++row_descend_fix;
                    }
                    
                    in_row = row_descend_fix;
                }
            }
            //otherwise
            else
            {
                //evaluation of the number of dots in a given column
                if (col <= thr)
                {
                    if (col%2 == 0)
                        n_dot += 2;
                    else
                        n_dot -= 1;
                }
                else if (col == thr + 1)
                {
                    if (col%2 == 0)
                        n_dot += 1;
                }
                else if (col > thr + a)
                {
                    if (col%2 != 0)
                        n_dot -= 1;
                }
            }

            //nbr of elements is dots plus previously added FA/HA
            int n_el = n_dot + n_FA + n_HA;

            printf("\t--n_col %d:\n", col);

            //if the elements exceed the maximum allowed (P)
            if (n_el > P)
            {
                if (n_FA == 0 && n_HA == 0)
                    next_thr = col - 1;
                n_FA = (n_el - P) / 2;
                n_HA = (n_el - P) - 2 * n_FA;
                next_a = col - next_thr;
                
                //place FA
                for(int i=0; i<n_FA; ++i)
                {
                    printf("\t\tFA_%d_%d_%d : FA port map (stage%d(%d)(%d), stage%d(%d)(%d), stage%d(%d)(%d), stage%d(%d)(%d), stage%d(%d)(%d));\n", n_steps, col, i, n_steps, in_row, col, n_steps, in_row+1, col, n_steps, in_row+2, col, n_steps-1, out_row, col, n_steps-1, next_out_row, col+1);

                    in_row += 3;
                    out_row += 1;
                    next_out_row +=1;
                }

                //place HA
                if (n_HA != 0)
                {
                    printf("\t\tHA_%d_%d : HA port map (stage%d(%d)(%d), stage%d(%d)(%d), stage%d(%d)(%d), stage%d(%d)(%d));\n", n_steps, col, n_steps, in_row, col, n_steps, in_row+1, col, n_steps-1, out_row, col, n_steps-1, next_out_row, col+1);

                    in_row += 2;
                    out_row += 1;
                    next_out_row +=1;
                }
            }

            //write the unused signals to the next step
            int ex_pt;

            if (out_row != 0)
                ex_pt = P;
            else
                ex_pt = n_dot;

            while (out_row < ex_pt)
            {
                printf("\t\tstage%d(%d)(%d) <= stage%d(%d)(%d);\n", n_steps-1, out_row, col, n_steps, in_row, col);
                ++out_row;
                ++in_row;
            }

            ++col;
            in_row = 0;
            out_row = next_out_row;
            next_out_row = 0;
        }

        --n_steps;
        P = ceil(P * 2/3.);
        thr = next_thr;
        a = next_a;
        printf("\n");
    }

    //output assignment
    printf("\t--output assignment:\n\t\tO1 <= stage0(0)(2*nbit-1 downto 0);\n\t\tO2 <= stage0(1)(2*nbit-1 downto 2) & '0' & stage0(1)(0); --assigned to zero, not used in the algorithm\n\n");

    printf("end architecture;");
}