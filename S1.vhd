library ieee;
use ieee.std_logic_1164.all;

entity S1 is

	port (	din: in std_logic_vector(5 downto 0);		--6 input bits. Bits 0 and 5 choose a row of a fixed sustitution table, bits 1 to 3 choose a column.
			dout: out std_logic_vector(3 downto 0));	--4 output bits obtained as the binary representation of a decimal number (between 0 and 15).
end S1;
				
	architecture beh of S1 is
	begin
		
		with din select
				dout<=	"1110" when "000000",
						"0100" when "000010",
						"1101" when "000100",
						"0001" when "000110",
						"0010" when "001000",
						"1111" when "001010",
						"1011" when "001100",
						"1000" when "001110",
						"0011" when "010000",
						"1010" when "010010",
						"0110" when "010100",
						"1100" when "010110",
						"0101" when "011000",
						"1001" when "011010",
						"0000" when "011100",
						"0111" when "011110",
						"0000" when "000001",
						"1111" when "000011",
						"0111" when "000101",
						"0100" when "000111",
						"1110" when "001001",
						"0010" when "001011",
						"1101" when "001101",
						"0001" when "001111",
						"1010" when "010001",
						"0110" when "010011",
						"1100" when "010101",
						"1011" when "010111",
						"1001" when "011001",
						"0101" when "011011",
						"0011" when "011101",
						"1000" when "011111",
						"0100" when "100000",
						"0001" when "100010",
						"1110" when "100100",
						"1000" when "100110",
						"1101" when "101000",
						"0110" when "101010",
						"0010" when "101100",
						"1011" when "101110",
						"1111" when "110000",
						"1100" when "110010",
						"1001" when "110100",
						"0111" when "110110",
						"0011" when "111000",
						"1010" when "111010",
						"0101" when "111100",
						"0000" when "111110",
						"1111" when "100001",
						"1100" when "100011",
						"1000" when "100101",
						"0010" when "100111",
						"0100" when "101001",
						"1001" when "101011",
						"0001" when "101101",
						"0111" when "101111",
						"0101" when "110001",
						"1011" when "110011",
						"0011" when "110101",
						"1110" when "110111",
						"1010" when "111001",
						"0000" when "111011",
						"0110" when "111101",
						"1101" when "111111",
						"----" when others;
	
	end beh;

	
	