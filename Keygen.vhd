library ieee;
use ieee.std_logic_1164.all;

--This component allows to choose between two fixed 64 bits encryption keys, acording to a selection key wich will be ported to the console.

entity Keygen is

port (	s: in  std_logic;
		y: out std_logic_vector(63 downto 0));
		
end Keygen;

architecture beh of Keygen is

begin
  
  process(s)
    begin
        if (s='0')then
          y <= (0=>'1',1=>'1',2=>'1',3=>'1', others=>'0'); --"0000000000000000000000000000000000000000000000000000000000001111";
        else
          y <= (0=>'1', others=>'0'); --"0000000000000000000000000000000000000000000000000000000000000001";
        end if;
        end process;
        
end beh;
