library ieee;
use ieee.std_logic_1164.all;

entity S7 is

	port (	din: in std_logic_vector(5 downto 0);		--6 input bits. Bits 0 and 5 choose a row of a fixed sustitution table, bits 1 to 3 choose a column.
			dout: out std_logic_vector(3 downto 0));	--4 output bits obtained as the binary representation of a decimal number (between 0 and 15).
end S7;
				
	architecture beh of S7 is
	begin
		
		with din select
				dout<=	"0100" when "000000",
						"1011" when "000010",
						"0010" when "000100",
						"1110" when "000110",
						"1111" when "001000",
						"0000" when "001010",
						"1000" when "001100",
						"1101" when "001110",
						"0011" when "010000",
						"1100" when "010010",
						"1001" when "010100",
						"0111" when "010110",
						"0101" when "011000",
						"1010" when "011010",
						"0110" when "011100",
						"0001" when "011110",
						"1101" when "000001",
						"0000" when "000011",
						"1011" when "000101",
						"0111" when "000111",
						"0100" when "001001",
						"1001" when "001011",
						"0001" when "001101",
						"1010" when "001111",
						"1110" when "010001",
						"0011" when "010011",
						"0101" when "010101",
						"1100" when "010111",
						"0010" when "011001",
						"1111" when "011011",
						"1000" when "011101",
						"0110" when "011111",
						"0001" when "100000",
						"0100" when "100010",
						"1011" when "100100",
						"1101" when "100110",
						"1100" when "101000",
						"0011" when "101010",
						"0111" when "101100",
						"1110" when "101110",
						"1010" when "110000",
						"1111" when "110010",
						"0110" when "110100",
						"1000" when "110110",
						"0000" when "111000",
						"0101" when "111010",
						"1001" when "111100",
						"0010" when "111110",
						"0110" when "100001",
						"1011" when "100011",
						"1101" when "100101",
						"1000" when "100111",
						"0001" when "101001",
						"0100" when "101011",
						"1010" when "101101",
						"0111" when "101111",
						"1001" when "110001",
						"0101" when "110011",
						"0000" when "110101",
						"1111" when "110111",
						"1110" when "111001",
						"0010" when "111011",
						"0011" when "111101",
						"1100" when "111111",
						"----" when others;
	
	end beh;
