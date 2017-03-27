library ieee;
use ieee.std_logic_1164.all;

-- This component reaccomodates and splits the 64 input bits into two LEFT (MSB or HIGH ) and RIGHT (LSB or LOW) 32 bits outputs. 
entity IP is
	port(	Data: in std_logic_vector (63 downto 0);
			L: out std_logic_vector (31 downto 0);
			R: out std_logic_vector (31 downto 0));
end IP;

	architecture beh of IP is
	begin
		R(0) <= Data(57);
		R(1) <= Data(49);
		R(2) <= Data(41);
		R(3) <= Data(33);
		R(4) <= Data(25);
		R(5) <= Data(17);
		R(6) <= Data(9);
		R(7) <= Data(1);
		R(8) <= Data(59);
		R(9) <= Data(51);
		R(10) <= Data(43);
		R(11) <= Data(35);
		R(12) <= Data(27);
		R(13) <= Data(19);
		R(14) <= Data(11);
		R(15) <= Data(3);
		R(16) <= Data(61);
		R(17) <= Data(53);
		R(18) <= Data(45);
		R(19) <= Data(37);
		R(20) <= Data(29);
		R(21) <= Data(21);
		R(22) <= Data(13);
		R(23) <= Data(5);
		R(24) <= Data(63);
		R(25) <= Data(55);
		R(26) <= Data(47);
		R(27) <= Data(39);
		R(28) <= Data(31);
		R(29) <= Data(23);
		R(30) <= Data(15);
		R(31) <= Data(7);
		L(0) <= Data(56);
		L(1) <= Data(48);
		L(2) <= Data(40);
		L(3) <= Data(32);
		L(4) <= Data(24);
		L(5) <= Data(16);
		L(6) <= Data(8);
		L(7) <= Data(0);
		L(8) <= Data(58);
		L(9) <= Data(50);
		L(10) <= Data(42);
		L(11) <= Data(34);
		L(12) <= Data(26);
		L(13) <= Data(18);
		L(14) <= Data(10);
		L(15) <= Data(2);
		L(16) <= Data(60);
		L(17) <= Data(52);
		L(18) <= Data(44);
		L(19) <= Data(36);
		L(20) <= Data(28);
		L(21) <= Data(20);
		L(22) <= Data(12);
		L(23) <= Data(4);
		L(24) <= Data(62);
		L(25) <= Data(54);
		L(26) <= Data(46);
		L(27) <= Data(38);
		L(28) <= Data(30);
		L(29) <= Data(22);
		L(30) <= Data(14);
		L(31) <= Data(6);

	end beh;
