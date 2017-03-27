library ieee;
use ieee.std_logic_1164.all;

--This component makes the inverse operation of the initial permutation (IP component).
--Starting with two 32 bits inputs obtains a single 64 bits output.
entity IP_1 is

	port (	L: in std_logic_vector(31 downto 0);
			R: in std_logic_vector(31 downto 0);
			C_data: out std_logic_vector(63 downto 0));
end IP_1;
				
	architecture beh of IP_1 is
	begin
	
	C_data(0)<=		L(7);
	C_data(1)<=		R(7);
	C_data(2)<=		L(15);
	C_data(3)<=		R(15);
	C_data(4)<=		L(23);
	C_data(5)<=		R(23);
	C_data(6)<=		L(31);
	C_data(7)<=		R(31);
	C_data(8)<=		L(6);
	C_data(9)<=		R(6);
	C_data(10)<=	L(14);
	C_data(11)<=	R(14);
	C_data(12)<=	L(22);
	C_data(13)<=	R(22);
	C_data(14)<=	L(30);
	C_data(15)<=	R(30);
	C_data(16)<=	L(5);
	C_data(17)<=	R(5);
	C_data(18)<=	L(13);
	C_data(19)<=	R(13);
	C_data(20)<=	L(21);
	C_data(21)<=	R(21);
	C_data(22)<=	L(29);
	C_data(23)<=	R(29);
	C_data(24)<=	L(4);
	C_data(25)<=	R(4);
	C_data(26)<=	L(12);
	C_data(27)<=	R(12);
	C_data(28)<=	L(20);
	C_data(29)<=	R(20);
	C_data(30)<=	L(28);
	C_data(31)<=	R(28);
	C_data(32)<=	L(3);
	C_data(33)<=	R(3);
	C_data(34)<=	L(11);
	C_data(35)<=	R(11);
	C_data(36)<=	L(19);
	C_data(37)<=	R(19);
	C_data(38)<=	L(27);
	C_data(39)<=	R(27);
	C_data(40)<=	L(2);
	C_data(41)<=	R(2);
	C_data(42)<=	L(10);
	C_data(43)<=	R(10);
	C_data(44)<=	L(18);
	C_data(45)<=	R(18);
	C_data(46)<=	L(26);
	C_data(47)<=	R(26);
	C_data(48)<=	L(1);
	C_data(49)<=	R(1);
	C_data(50)<=	L(9);
	C_data(51)<=	R(9);
	C_data(52)<=	L(17);
	C_data(53)<=	R(17);
	C_data(54)<=	L(25);
	C_data(55)<=	R(25);
	C_data(56)<=	L(0);
	C_data(57)<=	R(0);
	C_data(58)<=	L(8);
	C_data(59)<=	R(8);
	C_data(60)<=	L(16);
	C_data(61)<=	R(16);
	C_data(62)<=	L(24);
	C_data(63)<=	R(24);
	
	end beh;

	
	