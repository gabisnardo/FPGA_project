library ieee;
use ieee.std_logic_1164.all;

--This component processes its 48 input bits as 8 6 bits blocks, wich are ported to its correspondent Si block to obtain a final 32 bits output.
--Each of the Si blocks replaces its 6 bits entry with a 4 bit output, according to fixed tables. 
--This tables are used as follows: for every 6 bits block, the most and less significant bit represent a row number (0 to 3),
--the four middle bits represent a column number (0 to 15); in the intersection it's found a decimal number, wich represented
--as a four bit binary is the correspondent output.

entity S_Box is

	port (	data: in std_logic_vector(47 downto 0);
			s_data: out std_logic_vector(31 downto 0));
end S_Box;
				
	architecture beh of S_Box is
	
		--Each of these components have a diferent sustitution table.
		component S1 is

			port (	din: in std_logic_vector(5 downto 0);
					dout: out std_logic_vector(3 downto 0));
		end component;	
		
		component S2 is

			port (	din: in std_logic_vector(5 downto 0);
					dout: out std_logic_vector(3 downto 0));
		end component;	
		
		component S3 is

			port (	din: in std_logic_vector(5 downto 0);
					dout: out std_logic_vector(3 downto 0));
		end component;	
		
		component S4 is

			port (	din: in std_logic_vector(5 downto 0);
					dout: out std_logic_vector(3 downto 0));
		end component;	
		
		component S5 is

			port (	din: in std_logic_vector(5 downto 0);
					dout: out std_logic_vector(3 downto 0));
		end component;	
		
		component S6 is

			port (	din: in std_logic_vector(5 downto 0);
					dout: out std_logic_vector(3 downto 0));
		end component;	
		
		component S7 is

			port (	din: in std_logic_vector(5 downto 0);
					dout: out std_logic_vector(3 downto 0));
		end component;	
		
		component S8 is

			port (	din: in std_logic_vector(5 downto 0);
					dout: out std_logic_vector(3 downto 0));
		end component;
		
		
		begin
		
		--In this block, bits 0 to 5 are processed to obtain the 0 to 3 output bits
			block_1: S1 port map (	din(0) => data(0),
									din(1) => data(1),
									din(2) => data(2),
									din(3) => data(3),
									din(4) => data(4),
									din(5) => data(5),
									dout(0)=> s_data(0),
									dout(1)=> s_data(1),
									dout(2)=> s_data(2),
									dout(3)=> s_data(3));
											
		--In this block, bits 6 to 11 are processed to obtain the 4 to 7 output bits
			block_2: S2 port map (	din(0) => data(6),
									din(1) => data(7),
									din(2) => data(8),
									din(3) => data(9),
									din(4) => data(10),
									din(5) => data(11),
									dout(0)=> s_data(4),
									dout(1)=> s_data(5),
									dout(2)=> s_data(6),
									dout(3)=> s_data(7));
		
		--In this block, bits 12 to 17 are processed to obtain the 7 to 11 output bits		
			block_3: S3 port map (	din(0) => data(12),
									din(1) => data(13),
									din(2) => data(14),
									din(3) => data(15),
									din(4) => data(16),
									din(5) => data(17),
									dout(0)=> s_data(8),
									dout(1)=> s_data(9),
									dout(2)=> s_data(10),
									dout(3)=> s_data(11));
		
		--In this block, bits 18 to 23 are processed to obtain the 12 to 15 output bits
			block_4: S4 port map (	din(0) => data(18),
									din(1) => data(19),
									din(2) => data(20),
									din(3) => data(21),
									din(4) => data(22),
									din(5) => data(23),
									dout(0)=> s_data(12),
									dout(1)=> s_data(13),
									dout(2)=> s_data(14),
									dout(3)=> s_data(15));
						
		--In this block, bits 24 to 29 are processed to obtain the 16 to 19 output bits					
			block_5: S5 port map (	din(0) => data(24),
									din(1) => data(25),
									din(2) => data(26),
									din(3) => data(27),
									din(4) => data(28),
									din(5) => data(29),
									dout(0)=> s_data(16),
									dout(1)=> s_data(17),
									dout(2)=> s_data(18),
									dout(3)=> s_data(19));
		
		--In this block, bits 30 to 35 are processed to obtain the 20 to 23 output bits		
			block_6: S6 port map (	din(0) => data(30),
									din(1) => data(31),
									din(2) => data(32),
									din(3) => data(33),
									din(4) => data(34),
									din(5) => data(35),
									dout(0)=> s_data(20),
									dout(1)=> s_data(21),
									dout(2)=> s_data(22),
									dout(3)=> s_data(23));
			
		--In this block, bits 36 to 41 are processed to obtain the 24 to 27 output bits			
			block_7: S7 port map (	din(0) => data(36),
									din(1) => data(37),
									din(2) => data(38),
									din(3) => data(39),
									din(4) => data(40),
									din(5) => data(41),
									dout(0)=> s_data(24),
									dout(1)=> s_data(25),
									dout(2)=> s_data(26),
									dout(3)=> s_data(27));

		--In this block, bits 42 to 47 are processed to obtain the 28 to 31 output bits
			block_8: S8 port map (	din(0) => data(42),
									din(1) => data(43),
									din(2) => data(44),
									din(3) => data(45),
									din(4) => data(46),
									din(5) => data(47),
									dout(0)=> s_data(28),
									dout(1)=> s_data(29),
									dout(2)=> s_data(30),
									dout(3)=> s_data(31));
											
		end beh;