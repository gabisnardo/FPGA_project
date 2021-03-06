library ieee;
use ieee.std_logic_1164.all;

entity S5 is

	port (	din: in std_logic_vector(5 downto 0);		--6 input bits. Bits 0 and 5 choose a row of a fixed sustitution table, bits 1 to 3 choose a column.
			dout: out std_logic_vector(3 downto 0));	--4 output bits obtained as the binary representation of a decimal number (between 0 and 15).
end S5;
				
	architecture beh of S5 is
	begin
		
		with din select
				dout<=	"0010" when "000000",
						"1100" when "000010",
						"0100" when "000100",
						"0001" when "000110",
						"0111" when "001000",
						"1010" when "001010",
						"1011" when "001100",
						"0110" when "001110",
						"1000" when "010000",
						"0101" when "010010",
						"0011" when "010100",
						"1111" when "010110",
						"1101" when "011000",
						"0000" when "011010",
						"1110" when "011100",
						"1001" when "011110",
						"1110" when "000001",
						"1011" when "000011",
						"0010" when "000101",
						"1100" when "000111",
						"0100" when "001001",
						"0111" when "001011",
						"1101" when "001101",
						"0001" when "001111",
						"0101" when "010001",
						"0000" when "010011",
						"1111" when "010101",
						"1010" when "010111",
						"0011" when "011001",
						"1001" when "011011",
						"1000" when "011101",
						"0110" when "011111",
						"0100" when "100000",
						"0010" when "100010",
						"0001" when "100100",
						"1011" when "100110",
						"1010" when "101000",
						"1101" when "101010",
						"0111" when "101100",
						"1000" when "101110",
						"1111" when "110000",
						"1001" when "110010",
						"1100" when "110100",
						"0101" when "110110",
						"0110" when "111000",
						"0011" when "111010",
						"0000" when "111100",
						"1110" when "111110",
						"1011" when "100001",
						"1000" when "100011",
						"1100" when "100101",
						"0111" when "100111",
						"0001" when "101001",
						"1110" when "101011",
						"0010" when "101101",
						"1101" when "101111",
						"0110" when "110001",
						"1111" when "110011",
						"0000" when "110101",
						"1001" when "110111",
						"1010" when "111001",
						"0100" when "111011",
						"0101" when "111101",
						"0011" when "111111",
						"----" when others;
	
	end beh;
