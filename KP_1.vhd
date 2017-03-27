library ieee;
use ieee.std_logic_1164.all;

--This block rearrenges the 64 bits input encryption key into two 28 bits outputs.
--The bit reduction is achieved by eliminating the parity bits (located in positions 7,15,23,31,39,47,55 and 63).
entity KP_1 is

	port (	inkey: in std_logic_vector(63 downto 0);
			Co: out std_logic_vector(27 downto 0);
			Do: out std_logic_vector(27 downto 0));
end KP_1;
				
	architecture beh of KP_1 is
	
	signal outkey: std_logic_vector(55 downto 0);
	begin
	
		Co(0)<= inkey(56);
		Co(1)<= inkey(48);
		Co(2)<= inkey(40);
		Co(3)<= inkey(32);
		Co(4)<= inkey(24);
		Co(5)<= inkey(16);
		Co(6)<= inkey(8);
		Co(7)<= inkey(0);
		Co(8)<= inkey(57);
		Co(9)<= inkey(49);
		Co(10)<= inkey(41);
		Co(11)<= inkey(33);
		Co(12)<= inkey(25);
		Co(13)<= inkey(17);
		Co(14)<= inkey(9);
		Co(15)<= inkey(1);
		Co(16)<= inkey(58);
		Co(17)<= inkey(50);
		Co(18)<= inkey(42);
		Co(19)<= inkey(34);
		Co(20)<= inkey(26);
		Co(21)<= inkey(18);
		Co(22)<= inkey(10);
		Co(23)<= inkey(2);
		Co(24)<= inkey(59);
		Co(25)<= inkey(51);
		Co(26)<= inkey(43);
		Co(27)<= inkey(35);
		Do(0)<= inkey(62);
		Do(1)<= inkey(54);
		Do(2)<= inkey(46);
		Do(3)<= inkey(38);
		Do(4)<= inkey(30);
		Do(5)<= inkey(22);
		Do(6)<= inkey(14);
		Do(7)<= inkey(6);
		Do(8)<= inkey(61);
		Do(9)<= inkey(53);
		Do(10)<= inkey(45);
		Do(11)<= inkey(37);
		Do(12)<= inkey(29);
		Do(13)<= inkey(21);
		Do(14)<= inkey(13);
		Do(15)<= inkey(5);
		Do(16)<= inkey(60);
		Do(17)<= inkey(52);
		Do(18)<= inkey(44);
		Do(19)<= inkey(36);
		Do(20)<= inkey(28);
		Do(21)<= inkey(20);
		Do(22)<= inkey(12);
		Do(23)<= inkey(4);
		Do(24)<= inkey(27);
		Do(25)<= inkey(19);
		Do(26)<= inkey(11);
		Do(27)<= inkey(3);
	
	end beh;