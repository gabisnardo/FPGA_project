library ieee;
use ieee.std_logic_1164.all;

--This block rearrenges the two 28 bits inputs into a single 48 bits output.
--The bit reduction is achieved by eliminating 8 bits randomly.
entity KP_2 is

	port (	Ci: in std_logic_vector(27	downto 0);
			Di: in std_logic_vector(27	downto 0);
			outkey: out std_logic_vector(47	downto 0));
end KP_2;
				
	architecture beh of KP_2 is
	
	begin
	
		outkey(0)<= Ci(13);
		outkey(1)<= Ci(16);
		outkey(2)<= Ci(10);
		outkey(3)<= Ci(23);
		outkey(4)<= Ci(0);
		outkey(5)<= Ci(4);
		outkey(6)<= Ci(2);
		outkey(7)<= Ci(27);
		outkey(8)<= Ci(14);
		outkey(9)<= Ci(5);
		outkey(10)<= Ci(20);
		outkey(11)<= Ci(9);
		outkey(12)<= Ci(22);
		outkey(13)<= Ci(18);
		outkey(14)<= Ci(11);
		outkey(15)<= Ci(3);
		outkey(16)<= Ci(25);
		outkey(17)<= Ci(7);
		outkey(18)<= Ci(15);
		outkey(19)<= Ci(6);
		outkey(20)<= Ci(26);
		outkey(21)<= Ci(19);
		outkey(22)<= Ci(12);
		outkey(23)<= Ci(1);
		outkey(24)<= Di(12);
		outkey(25)<= Di(23);
		outkey(26)<= Di(2);
		outkey(27)<= Di(8);
		outkey(28)<= Di(18);
		outkey(29)<= Di(26);
		outkey(30)<= Di(1);
		outkey(31)<= Di(11);
		outkey(32)<= Di(22);
		outkey(33)<= Di(16);
		outkey(34)<= Di(4);
		outkey(35)<= Di(19);
		outkey(36)<= Di(15);
		outkey(37)<= Di(20);
		outkey(38)<= Di(10);
		outkey(39)<= Di(27);
		outkey(40)<= Di(5);
		outkey(41)<= Di(24);
		outkey(42)<= Di(17);
		outkey(43)<= Di(14);
		outkey(44)<= Di(21);
		outkey(45)<= Di(7);
		outkey(46)<= Di(0);
		outkey(47)<= Di(3);

	
	end beh;