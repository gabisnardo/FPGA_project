library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------
------------- Entity Mux_4_32 ------------
-------- four 32 bits inputs and ---------
----------- one 32 bits output ----------- 
------------------------------------------

entity Mux_4_32 is
	port(
		X1:	in  std_logic_vector(31 downto 0);
		X2:	in  std_logic_vector(31 downto 0);
        X3:	in  std_logic_vector(31 downto 0);
        X4:	in  std_logic_vector(31 downto 0);
		sel:in  std_logic_vector(1 downto 0);
		q :	out std_logic_vector(31 downto 0));

end Mux_4_32;

---------- ARCHITECTURE ------------

architecture Beh of Mux_4_32 is 
--This component selects wich of four possible inputs will go to the output according to the 'sel'
--value, wich will be ported to two switch keys in the console.
	begin
	
		Multiplex: process (sel, X1, X2,X3,X4)
			begin
			
			if(sel="00") then
				q <= X1;
			elsif(sel="01") then
				q <= X2;
			elsif(sel="10") then
				q <= X3;
			else
				q <= X4;
			end if;	
			
		end process Multiplex;
end architecture Beh;
