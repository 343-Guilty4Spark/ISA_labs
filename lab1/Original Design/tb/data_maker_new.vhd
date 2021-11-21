library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use work.constants.all;

library std;
use std.textio.all;

entity data_maker is  
  port (
    CLK     : in  std_logic;
    RST_n   : in  std_logic;
    VOUT    : out std_logic;
    DOUT    : out std_logic_vector(Nbit-1 downto 0);
    H0      : out std_logic_vector(Nbit-1 downto 0);
    H1      : out std_logic_vector(Nbit-1 downto 0);
    H2      : out std_logic_vector(Nbit-1 downto 0);
    H3      : out std_logic_vector(Nbit-1 downto 0);
    END_SIM : out std_logic);
end data_maker;

architecture beh of data_maker is

  constant tco : time := 1 ns;

  signal sEndSim : std_logic;
  signal END_SIM_i : std_logic_vector(0 to 10);

  signal stp : std_logic;  --signal to simulate a pause in DIN to the filter within the same execution.

begin  -- beh

  H0 <= conv_std_logic_vector(1,Nbit);
  H1 <= conv_std_logic_vector(-11,Nbit);
  H2 <= conv_std_logic_vector(26, Nbit);
  H3 <= conv_std_logic_vector(26, Nbit);

  --CONSIDERARE 
  process (CLK, RST_n)
    file fp_in : text open READ_MODE is "./samples.txt";
    variable line_in : line;
    variable x : integer;
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      DOUT <= (others => '0') after tco;
      VOUT <= '0' after tco;
      sEndSim <= '0' after tco;
    elsif CLK'event and CLK = '1' then -- rising clock edge
      --if stp = '0' then         -- REMOVE TO AVOID STOP
        if not endfile(fp_in) then
          readline(fp_in, line_in);
          read(line_in, x);
          DOUT <= conv_std_logic_vector(x, Nbit) after tco;
          VOUT <= '1' after tco;
          sEndSim <= '0' after tco;
        else
          VOUT <= '0' after tco;
          sEndSim <= '1' after tco;
        end if;
      --else                      -- REMOVE TO AVOID STOP
       -- VOUT <= '0' after tco;  -- REMOVE TO AVOID STOP
     -- end if;                   -- REMOVE TO AVOID STOP
    end if;
  end process;

  process (CLK, RST_n)
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      END_SIM_i <= (others => '0') after tco;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      END_SIM_i(0) <= sEndSim after tco;
      END_SIM_i(1 to 10) <= END_SIM_i(0 to 9) after tco;
    end if;
  end process;

  END_SIM <= END_SIM_i(10);

  stp <= '0', '1' after 40 ns, '0' after 50 ns;

end beh;
