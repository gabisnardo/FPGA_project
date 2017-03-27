library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------
---------------- Entity Mux --------------
------ variable size of input and --------
--- output according to generic value ----
------------------------------------------

entity Mux_Nin is
	generic(width_in: integer:= 4 );
	
	port(
			X1:	in  std_logic_vector(width_in-1 downto 0);
			X2:	in  std_logic_vector(width_in-1 downto 0);
			sel:in  std_logic;
			q: 	out std_logic_vector(width_in-1 downto 0));

end Mux_Nin;

---------- ARCHITECTURE ------------

architecture Beh of Mux_Nin is 
--This component selects wich of two possible inputs will go to the output according to the 'sel'
--value, wich will correspond to a switch key in this project.
begin

Multiplex: process (sel, X1, X2)
	begin
	
	if(sel='0') then
		q <= X1;
	else
		q <= X2;
	end if;	
end process Multiplex;
end architecture Beh;