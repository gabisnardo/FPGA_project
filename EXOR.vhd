library ieee;
use ieee.std_logic_1164.all;

--This block expands its 32 input bits into 48 bits, repeating some of them.
--Afterwards it makes the XOR operation between the expanded data and the 48 bits encryption key.

entity EXOR is

	port (	key: in std_logic_vector(47 downto 0);
				R: in std_logic_vector(31 downto 0);
				ex_out: out std_logic_vector(47 downto 0));
end EXOR;
				
	architecture beh of EXOR is
	
		signal sig: std_logic_vector(47 downto 0):="000000000000000000000000000000000000000000000000";	
		begin
		
		sig(0)<=		R(31);
		sig(1)<=		R(0);
		sig(2)<=		R(1);
		sig(3)<=		R(2);
		sig(4)<=		R(3);
		sig(5)<=		R(4);
		sig(6)<=		R(3);
		sig(7)<=		R(4);
		sig(8)<=		R(5);
		sig(9)<=		R(6);
		sig(10)<=	R(7);
		sig(11)<=	R(8);
		sig(12)<=	R(7);
		sig(13)<=	R(8);
		sig(14)<=	R(9);
		sig(15)<=	R(10);
		sig(16)<=	R(11);
		sig(17)<=	R(12);
		sig(18)<=	R(11);
		sig(19)<=	R(12);
		sig(20)<=	R(13);
		sig(21)<=	R(14);
		sig(22)<=	R(15);
		sig(23)<=	R(16);
		sig(24)<=	R(15);
		sig(25)<=	R(16);
		sig(26)<=	R(17);
		sig(27)<=	R(18);
		sig(28)<=	R(19);
		sig(29)<=	R(20);
		sig(30)<=	R(19);
		sig(31)<=	R(20);
		sig(32)<=	R(21);
		sig(33)<=	R(22);
		sig(34)<=	R(23);
		sig(35)<=	R(24);
		sig(36)<=	R(23);
		sig(37)<=	R(24);
		sig(38)<=	R(25);
		sig(39)<=	R(26);
		sig(40)<=	R(27);
		sig(41)<=	R(28);
		sig(42)<=	R(27);
		sig(43)<=	R(28);
		sig(44)<=	R(29);
		sig(45)<=	R(30);
		sig(46)<=	R(31);
		sig(47)<=	R(0);
		
		process (sig, key)
			begin
				for i in key'range loop
					ex_out(i)<= sig(i) xor key(i);
				end loop;
		end process;
	
	end beh;

		
		