library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb_MBE is
end entity;

architecture test of tb_MBE is
    
    constant tck : time := 10 ns;

    component MBE is
        port
        (
            A, B: in unsigned(31 downto 0);
            O: out unsigned(63 downto 0);
            RST_n, CLK: in std_logic
        );
    end component;

    signal A        :   unsigned(31 downto 0)   :=(others=>'0');
    signal B        :   unsigned(31 downto 0)   :=(others=>'0');
    signal O        :   unsigned(63 downto 0)   :=(others=>'0');
    signal RST_n    :   std_logic               :='0';
    signal CLK      :   std_logic               :='0';

    begin

        dut: MBE port map (A, B, O, RST_n, CLK);

        process (CLK)
            begin
                CLK <= not CLK after tck;
        end process;
        
        RST_n <= '1' after 2 ns;

        A <= x"009E377A" after 20 ns, x"00A00002" after 40 ns, x"00CF1BBD" after 60 ns, x"00C00003" after 80 ns, x"00800000" after 100 ns, x"00E00002" after 120 ns, x"00CF1BBD" after 160 ns;
        B <= x"009E377A" after 20 ns, x"00A00002" after 40 ns, x"00CF1BBD" after 60 ns, x"00C00003" after 80 ns, x"00800000" after 100 ns, x"00E00002" after 120 ns, x"00CF1BBD" after 160 ns;

end architecture;