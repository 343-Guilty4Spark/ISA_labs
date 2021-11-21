library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity IIRfilter_LA is
    port
    (
        DIN: in signed(Nbit-1 downto 0);
        H0, H1, H2, H3: signed(Nbit-1 downto 0);  --H1=a1, H2=b0, H3=b1, H4=b0*a1
        H4: signed(2*Nbit-1 downto 0);
        VIN, RST_n, CLK: in std_logic;
        DOUT: out signed(Nbit-1 downto 0);
        VOUT: out std_logic
    );
end entity;

architecture Behavioral of IIRfilter_LA is

    constant tco : time := 1 ns;
    constant t_add : time := 1 ns;
    constant t_mul : time := 1 ns;

    signal ff_sh, fb_sh, w_add, DIN1_reg_out, DOUT_reg_in: signed(Nbit-1 downto 0);
    signal w, w1_reg_out, w2_reg_out: signed(Nbit downto 0);
    signal din_b0: signed(2*Nbit-1 downto 0);
    signal fb, ff: signed(2*Nbit downto 0);
    signal w_a1b0: signed(3*Nbit downto 0);
    
    begin

        w <= (DIN1_reg_out(Nbit-1) & DIN1_reg_out) - (fb_sh(Nbit-1) & fb_sh) after t_add;
        fb_sh <= fb(2*(Nbit-1) downto Nbit-1);
        ff_sh <= ff(2*(Nbit-1) downto Nbit-1);
        
        w_add <= din_b0(2*Nbit-2 downto Nbit-1) - w_a1b0(3*Nbit-1 downto 2*Nbit) after t_add;
        DOUT_reg_in <= w_add + ff_sh after t_add;

        din_b0 <= DIN * H2 after t_mul;
        w_a1b0 <= w * H4 after t_mul;
        fb <= w2_reg_out * H1 after t_mul;
        ff <= w * H3 after t_mul;

        process (CLK, RST_n, VIN)
        begin
            if RST_n = '0' then                 -- asynchronous reset
                w1_reg_out <= (others => '0');
                w2_reg_out <= (others => '0');
                DIN1_reg_out <= (others => '0');
                DOUT <= (others => '0');
                VOUT <= '0';
            elsif VIN = '1' then
                if CLK'event and CLK = '1' then  -- rising clock edge
                    w1_reg_out <= w;
                    w2_reg_out <= w1_reg_out;
                    DIN1_reg_out <= DIN;
                    DOUT <= DOUT_reg_in;
                    VOUT <= VIN;
                end if;
            end if;
  end process;

end architecture;