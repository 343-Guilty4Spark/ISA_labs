library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity RCA is
    generic
    (
        N : integer
    );
    port 
    (
        A  : in  unsigned(N-1 downto 0);
        B  : in  unsigned(N-1 downto 0);
        Ci : in  std_logic;
        O  : out unsigned(N-1 downto 0);
        Co : out std_logic
    );
end entity;

architecture behavioral of RCA is
    signal S : unsigned(N downto 0);

begin 
    S <= ('0' & A) + ('0' & B) + Ci;
    Co <= S(N);
    O <= S(N-1 downto 0);

end architecture;