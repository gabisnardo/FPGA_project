library ieee;
use ieee.std_logic_1164.all;

--This block shuffles the input bits to generate a diferent output
entity P is

	port (	px_in: in std_logic_vector(31 downto 0);
			px_out: out std_logic_vector(31 downto 0));
end P;
				
	architecture beh of P is
		
		begin
		
		px_out(0)<=		px_in(15);
		px_out(1)<=		px_in(6);
		px_out(2)<=		px_in(19);
		px_out(3)<=		px_in(20);
		px_out(4)<=		px_in(28);
		px_out(5)<=		px_in(11);
		px_out(6)<=		px_in(27);
		px_out(7)<=		px_in(16);
		px_out(8)<=		px_in(0);
		px_out(9)<=		px_in(14);
		px_out(10)<=	px_in(22);
		px_out(11)<=	px_in(25);
		px_out(12)<=	px_in(4);
		px_out(13)<=	px_in(17);
		px_out(14)<=	px_in(30);
		px_out(15)<=	px_in(9);
		px_out(16)<=	px_in(1);
		px_out(17)<=	px_in(7);
		px_out(18)<=	px_in(23);
		px_out(19)<=	px_in(13);
		px_out(20)<=	px_in(31);
		px_out(21)<=	px_in(26);
		px_out(22)<=	px_in(2);
		px_out(23)<=	px_in(8);
		px_out(24)<=	px_in(18);
		px_out(25)<=	px_in(12);
		px_out(26)<=	px_in(29);
		px_out(27)<=	px_in(5);
		px_out(28)<=	px_in(21);
		px_out(29)<=	px_in(10);
		px_out(30)<=	px_in(3);
		px_out(31)<=	px_in(24);
		
	
	end beh;

		
		
