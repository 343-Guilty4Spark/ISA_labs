library ieee;
use ieee.std_logic_1164.all;

entity FA is
    port 
    (
        A  : in  std_logic;
        B  : in  std_logic;
        Ci : in  std_logic;
        O  : out std_logic;
        Co : out std_logic
    );
end entity;

architecture structural of FA is

    begin

        O  <= A xor B xor Ci;
        Co <= (A and B) or (B and Ci) or (A and Ci);
  
end architecture;