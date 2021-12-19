library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity MBE is
    port
    (
        A, B: in unsigned(31 downto 0);  --are these stable or not ?????????  in the case add a register for A!!!!
        O: out unsigned(63 downto 0);                                           --check B loaad signal...
        RST_n, CLK: in std_logic
    );
end entity;

architecture Behavioral of MBE is

    constant nbit : integer := 32;
    constant n_row : integer := nbit / 2 + 1;

    signal ext_B : std_logic_vector(34 downto 0);

    type pp_map is array (integer range 0 to n_row-1) of std_logic_vector(nbit downto 0);
    signal P : pp_map;

    signal S : std_logic_vector(n_row-1 downto 0);

    signal O1, O2 : std_logic_vector(2*nbit-1 downto 0);
    signal rca_IN1, rca_IN2 : unsigned(2*nbit-1 downto 0);

    component DaddaTree is  ---Cambiare in out con unsigned convertendo nel componente ??????????????
        generic
        (
            nbit : integer := 32
        );
        port
        (
            P0, P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16 : in std_logic_vector(nbit downto 0);
            S : in std_logic_vector(nbit/2-1 downto 0);
            O1, O2: out std_logic_vector(2*nbit-1 downto 0)
        );
    end component;

    component RCA is
        generic
        (
            N : integer := 64
        );
        port 
        (
            A  : in  unsigned(N-1 downto 0);
            B  : in  unsigned(N-1 downto 0);
            Ci : in  std_logic;
            O  : out unsigned(N-1 downto 0);
            Co : out std_logic
        );
    end component;

    begin

        ext_B(0) <= '0';
        ext_B(32 downto 1) <= std_logic_vector(B);
        ext_B(34 downto 33) <= "00";

        process (A, ext_B)
            variable part_b : std_logic_vector(2 downto 0);
            begin
                for i in 0 to n_row-1 loop
                    part_b := (ext_B((2*i)+2) & ext_B((2*i)+1) & ext_B(2*i));
                    case part_b is
                        when "000" =>
                            P(i) <= (others => '0');
                            S(i) <= '0';
                        when "001" =>
                            P(i) <= '0' & std_logic_vector(A);
                            S(i) <= '0';
                        when "010" =>
                            P(i) <= '0' & std_logic_vector(A);
                            S(i) <= '0';
                        when "011" =>
                            P(i) <= std_logic_vector(A) & '0';
                            S(i) <= '0';
                        when "100" =>
                            P(i) <= not(std_logic_vector(A) & '0');
                            S(i) <= '1';
                        when "101" =>
                            P(i) <= not('0' & std_logic_vector(A));
                            S(i) <= '1';
                        when "110" =>
                            P(i) <= not('0' & std_logic_vector(A));
                            S(i) <= '1';
                        when others =>
                            P(i) <= (others => '1');
                            S(i) <= '1';
                    end case;
                end loop;
        end process;

        Tree: DaddaTree port map (
            P(0), P(1), P(2), P(3), P(4), P(5), P(6), P(7), P(8), P(9),
            P(10), P(11), P(12), P(13), P(14), P(15), P(16), S(n_row-2 downto 0), O1, O2
        );

        process (CLK, RST_n)
            begin
                if RST_n = '0' then
                    rca_IN1 <= (others => '0');
                    rca_IN2 <= (others => '0');
                else
                    if CLK'event and CLK = '1' then
                        rca_IN1 <= unsigned(O1);
                        rca_IN2 <= unsigned(O2);
                    end if;
                end if;
        end process;

        f_add : RCA port map(rca_IN1, rca_IN2, '0', O);

end architecture;