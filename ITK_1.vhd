library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--This block is used to rotate both its inputs one bit to the left. It is used in the K_Block
entity ITK_1 is

	port (	Ci: in std_logic_vector(27	downto 0);
			Di: in std_logic_vector(27	downto 0);
			Co: out std_logic_vector(27 downto 0);
			Do: out std_logic_vector(27 downto 0));
end ITK_1;
				
	architecture beh of ITK_1 is
	
	-- These signals are initianlized just for simulation purposes according to a combinational system. 
	signal C_rol: unsigned(27 downto 0):=(others=> '0');		--used only as intermediate signal
	signal D_rol: unsigned(27 downto 0):=(others=> '0');		--used only as intermediate signal
	
	begin

		process (Ci, Di)
			begin
				C_rol<=(unsigned (Ci)) rol 1;
				D_rol<=(unsigned (Di)) rol 1;
		end process;
	
		Co <= std_logic_vector(C_rol);
		Do <= std_logic_vector(D_rol);
		
	end beh;