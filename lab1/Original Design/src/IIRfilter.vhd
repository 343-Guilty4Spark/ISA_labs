library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity IIRfilter is
    port
    (
        DIN: in signed(Nbit-1 downto 0);
        H1, H2, H3: signed(Nbit-1 downto 0);
        VIN, RST_n, CLK: in std_logic;
        DOUT: out signed(Nbit-1 downto 0);
        VOUT: out std_logic
    );
end entity;

architecture Behavioral of IIRfilter is

    constant tco : time := 1 ns;
    constant t_add : time := 1 ns;
    constant t_mul : time := 1 ns;

    signal ff_sh, fb_sh, DOUT_reg_in: signed(Nbit-1 downto 0);
    signal w, w_reg_out: signed(Nbit downto 0);
    signal fb, ff, b0_w: signed(2*Nbit downto 0);

    begin
        w <= (DIN(Nbit-1) & DIN) - (fb_sh(Nbit-1) & fb_sh) after t_add;
        fb_sh <= fb(2*(Nbit-1) downto Nbit-1);
        ff_sh <= ff(2*(Nbit-1) downto Nbit-1);
        b0_w <= w * H2 after t_mul;
        DOUT_reg_in <= b0_w(2*(Nbit-1) downto Nbit-1) + ff_sh after t_add;
        fb <= w_reg_out * H1 after t_mul;
        ff <= w_reg_out * H3 after t_mul;

        process (CLK, RST_n, VIN)
        begin
            if RST_n = '0' then                 -- asynchronous reset
                w_reg_out <= (others => '0');
                DOUT <= (others => '0');
                VOUT <= '0';
            elsif VIN = '1' then
                if CLK'event and CLK = '1' then  -- rising clock edge
                    w_reg_out <= w;
                    DOUT <= DOUT_reg_in;
                    VOUT <= VIN;
                end if;
            end if;
  end process;

end architecture;