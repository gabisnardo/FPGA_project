library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Top is
	port (S1 : in  std_logic;  -- Select between Data High and Data Low
			S2 : in  std_logic;     -- Select between Encrypt data and Decrypt data
			S3 : in  std_logic;     -- Select between Data and Decrypt data
			i0 : in  std_logic;     -- Data input bit 0
			i1 : in  std_logic;     -- Data input bit 1
			i2 : in  std_logic;     -- Data input bit 2
			i3 : in  std_logic;     -- Data input bit 3
			i4 : in  std_logic;     -- Data input bit 4
			i5 : in  std_logic;     -- Data input bit 5
			i6 : in  std_logic;     -- Data input bit 6
			i7 : in  std_logic;     -- Data input bit 7
			i8 : in  std_logic;     -- Data input bit 8
			i9 : in  std_logic;     -- Data input bit 9
			i10: in  std_logic;     -- Data input bit 10
			i11: in  std_logic;     -- Data input bit 11
                                                -- Those inputs are used to set
                                                -- the 12 less significant bits
                                                -- of a 64 bits data, to be encrypted
                      
			D0 : out std_logic_vector (6 downto 0);  -- Display 0
			D1 : out std_logic_vector (6 downto 0);  -- Display 1
			D2 : out std_logic_vector (6 downto 0);  -- Display 2
			D3 : out std_logic_vector (6 downto 0);  -- Display 3
			D4 : out std_logic_vector (6 downto 0);  -- Display 4
			D5 : out std_logic_vector (6 downto 0);  -- Display 5
			D6 : out std_logic_vector (6 downto 0);  -- Display 6
			D7 : out std_logic_vector (6 downto 0)); -- Display 7
															-- Those outputs control an
															-- array of 7-segment displays
															-- wich are used to show
															-- input, encrypted and decrypted data 
															-- in two parts (low and high) in HEX.
	end entity Top;

architecture beh of Top is

	component CYP is        -- Encryption component declaration
		port(	data     : in  std_logic_vector(63 downto 0);                                                                          -- 
				key      : in  std_logic_vector(63 downto 0);
				cyp_data : out std_logic_vector(63 downto 0));
	end component CYP;

	component DCYP is  -- Decryption component declaration
		port (	E_data : in  std_logic_vector(63 downto 0);
				key    : in  std_logic_vector(63 downto 0);
				D_data : out std_logic_vector(63 downto 0));
	end component DCYP;

	component Deco is  -- Decodifier component declaration, from HEX to 7-segments
		port (	x : in  std_logic_vector(3 downto 0);
				y : out std_logic_vector(6 downto 0));
	end component Deco;
	
	component Mux_Nin is -- 2 input Multiplexer component declaration
		generic (width_in : integer := 4);
		port (	X1  : in  std_logic_vector(width_in-1 downto 0);
				X2  : in  std_logic_vector(width_in-1 downto 0);
				sel : in  std_logic;
				q   : out std_logic_vector(width_in-1 downto 0));
	end component Mux_Nin;
	
	component Mux_4_32 is  -- 4 Input Multiplexer component declaration
		port (	X1  : in std_logic_vector(31 downto 0);
				X2  : in std_logic_vector(31 downto 0);
				X3  : in std_logic_vector(31 downto 0);
				X4  : in std_logic_vector(31 downto 0);
				sel : in std_logic_vector(1 downto 0);
				q   : out std_logic_vector(31 downto 0));
	end component Mux_4_32;
	
	component Keygen is  -- Key generator component declaration.
                             -- This component generates a 64 bits output which is
                             -- used as a key for the encryption process.
		port (	s: in std_logic;
				y: out std_logic_vector(63 downto 0));
	end component Keygen;
  
-- These signals are initianlized just for simulation purposes according to a combinational system. 
  signal s_cyp_data : std_logic_vector(63 downto 0):=(others=>'0');
  signal s_dcyp_data: std_logic_vector(63 downto 0):=(others=>'0');
  signal s_q_mux1: std_logic_vector(31 downto 0):=(others=>'0');
  signal s_q_mux2: std_logic_vector(31 downto 0):=(others=>'0');
  signal s_q_mux3: std_logic_vector(31 downto 0):=(others=>'0');
  signal s_data_L: std_logic_vector(31 downto 0):=(others=>'0');
  signal s_data_H: std_logic_vector(31 downto 0):=(others=>'0');
  signal s_data: std_logic_vector(63 downto 0):=(others=>'0');
  signal s_key: std_logic_vector(63 downto 0):=(others=>'0');


  constant ancho_32: integer:= 32;
  
  
begin  -- architecture beh

	s_data(0)<=i0;
	s_data(1)<=i1;
	s_data(2)<=i2;
	s_data(3)<=i3;
	s_data(4)<=i4;
	s_data(5)<=i5;
	s_data(6)<=i6;
	s_data(7)<=i7;
	s_data(8)<=i8;
	s_data(9)<=i9;
	s_data(10)<=i10;
	s_data(11)<=i11;
        -- those signals are used to assign the 12 less signifficant bits to
        -- fisical pins, so we can set up for implementation purposes.

  Encrypt: component CYP
    port map (	data => s_data, -- 64 bits data input to be encrypted.
				key => s_key, -- 64 bits key used to encrypt the input data. 
				cyp_data => s_cyp_data); -- 64 bits data encrypted.

  Decrypt: component DCYP
    port map (	E_data => s_cyp_data, -- 64 bits input, data to be decrypted.
				Key => s_key, -- 64 bits key used to decrypt the input data.
				D_data => s_dcyp_data); -- 64 bits data recovered from the input encrypted data.

  Keygenerator: component Keygen 
    port map (	s => '0', -- this input is used to select between two fixed different 64 bits keys
				y => s_key); -- 64 bits key.

  Mux1: component Mux_Nin -- Multiplexer. This component allows to choose between 32 High bits
                          -- and 32 Low bits of the encrypted data to be showed
                          -- by the displays.
    generic map (ancho_32)
    port map (
      X1(0) => s_cyp_data(0),
      X1(1) => s_cyp_data(1),
      X1(2) => s_cyp_data(2),
      X1(3) => s_cyp_data(3),
      X1(4) => s_cyp_data(4),
      X1(5) => s_cyp_data(5),
      X1(6) => s_cyp_data(6),
      X1(7) => s_cyp_data(7),
      X1(8) => s_cyp_data(8),
      X1(9) => s_cyp_data(9),
      X1(10) => s_cyp_data(10),
      X1(11) => s_cyp_data(11),
      X1(12) => s_cyp_data(12),
      X1(13) => s_cyp_data(13),
      X1(14) => s_cyp_data(14),
      X1(15) => s_cyp_data(15),
      X1(16) => s_cyp_data(16),
      X1(17) => s_cyp_data(17),
      X1(18) => s_cyp_data(18),
      X1(19) => s_cyp_data(19),
      X1(20) => s_cyp_data(20),
      X1(21) => s_cyp_data(21),
      X1(22) => s_cyp_data(22),
      X1(23) => s_cyp_data(23),
      X1(24) => s_cyp_data(24),
      X1(25) => s_cyp_data(25),
      X1(26) => s_cyp_data(26),
      X1(27) => s_cyp_data(27),
      X1(28) => s_cyp_data(28),
      X1(29) => s_cyp_data(29),
      X1(30) => s_cyp_data(30),
      X1(31) => s_cyp_data(31),
      X2(0) => s_cyp_data(32),
      X2(1) => s_cyp_data(33),
      X2(2) => s_cyp_data(34),
      X2(3) => s_cyp_data(35),
      X2(4) => s_cyp_data(36),
      X2(5) => s_cyp_data(37),
      X2(6) => s_cyp_data(38),
      X2(7) => s_cyp_data(39),
      X2(8) => s_cyp_data(40),
      X2(9) => s_cyp_data(41),
      X2(10) => s_cyp_data(42),
      X2(11) => s_cyp_data(43),
      X2(12) => s_cyp_data(44),
      X2(13) => s_cyp_data(45),
      X2(14) => s_cyp_data(46),
      X2(15) => s_cyp_data(47),
      X2(16) => s_cyp_data(48),
      X2(17) => s_cyp_data(49),
      X2(18) => s_cyp_data(50),
      X2(19) => s_cyp_data(51),
      X2(20) => s_cyp_data(52),
      X2(21) => s_cyp_data(53),
      X2(22) => s_cyp_data(54),
      X2(23) => s_cyp_data(55),
      X2(24) => s_cyp_data(56),
      X2(25) => s_cyp_data(57),
      X2(26) => s_cyp_data(58),
      X2(27) => s_cyp_data(59),
      X2(28) => s_cyp_data(60),
      X2(29) => s_cyp_data(61),
      X2(30) => s_cyp_data(62),
      X2(31) => s_cyp_data(63),
      sel => S1,
      q => s_q_mux1);

    Mux2: component Mux_Nin -- Multiplexer. This component allows to choose between 32 High bits
                            -- and 32 Low bits of the decrypted data to be showed
                            -- by the displays.
    generic map (ancho_32)
    port map (
      X1(0) => s_dcyp_data(0),
      X1(1) => s_dcyp_data(1),
      X1(2) => s_dcyp_data(2),
      X1(3) => s_dcyp_data(3),
      X1(4) => s_dcyp_data(4),
      X1(5) => s_dcyp_data(5),
      X1(6) => s_dcyp_data(6),
      X1(7) => s_dcyp_data(7),
      X1(8) => s_dcyp_data(8),
      X1(9) => s_dcyp_data(9),
      X1(10) => s_dcyp_data(10),
      X1(11) => s_dcyp_data(11),
      X1(12) => s_dcyp_data(12),
      X1(13) => s_dcyp_data(13),
      X1(14) => s_dcyp_data(14),
      X1(15) => s_dcyp_data(15),
      X1(16) => s_dcyp_data(16),
      X1(17) => s_dcyp_data(17),
      X1(18) => s_dcyp_data(18),
      X1(19) => s_dcyp_data(19),
      X1(20) => s_dcyp_data(20),
      X1(21) => s_dcyp_data(21),
      X1(22) => s_dcyp_data(22),
      X1(23) => s_dcyp_data(23),
      X1(24) => s_dcyp_data(24),
      X1(25) => s_dcyp_data(25),
      X1(26) => s_dcyp_data(26),
      X1(27) => s_dcyp_data(27),
      X1(28) => s_dcyp_data(28),
      X1(29) => s_dcyp_data(29),
      X1(30) => s_dcyp_data(30),
      X1(31) => s_dcyp_data(31),
      X2(0) => s_dcyp_data(32),
      X2(1) => s_dcyp_data(33),
      X2(2) => s_dcyp_data(34),
      X2(3) => s_dcyp_data(35),
      X2(4) => s_dcyp_data(36),
      X2(5) => s_dcyp_data(37),
      X2(6) => s_dcyp_data(38),
      X2(7) => s_dcyp_data(39),
      X2(8) => s_dcyp_data(40),
      X2(9) => s_dcyp_data(41),
      X2(10) => s_dcyp_data(42),
      X2(11) => s_dcyp_data(43),
      X2(12) => s_dcyp_data(44),
      X2(13) => s_dcyp_data(45),
      X2(14) => s_dcyp_data(46),
      X2(15) => s_dcyp_data(47),
      X2(16) => s_dcyp_data(48),
      X2(17) => s_dcyp_data(49),
      X2(18) => s_dcyp_data(50),
      X2(19) => s_dcyp_data(51),
      X2(20) => s_dcyp_data(52),
      X2(21) => s_dcyp_data(53),
      X2(22) => s_dcyp_data(54),
      X2(23) => s_dcyp_data(55),
      X2(24) => s_dcyp_data(56),
      X2(25) => s_dcyp_data(57),
      X2(26) => s_dcyp_data(58),
      X2(27) => s_dcyp_data(59),
      X2(28) => s_dcyp_data(60),
      X2(29) => s_dcyp_data(61),
      X2(30) => s_dcyp_data(62),
      X2(31) => s_dcyp_data(63),
      sel => S1,
      q => s_q_mux2);

  Mux3: component Mux_4_32 -- 4 inputs 32 bits Multiplexer. This component allows
                           -- to choose the data to be showed.
                           -- if (sel = "00") then q = input Data (31 downto 0)
                           -- if (sel = "01") then q = input Data (63 downto 32)
                           -- if (sel = "10") then q = Encrypted Data(Low/High)
                           -- if (sel = "11") then q = Decrypted Data(Low/High) 
    port map (
      X1(0) => s_data(0),
      X1(1) => s_data(1),
      X1(2) => s_data(2),
      X1(3) => s_data(3),
      X1(4) => s_data(4),
      X1(5) => s_data(5),
      X1(6) => s_data(6),
      X1(7) => s_data(7),
      X1(8) => s_data(8),
      X1(9) => s_data(9),
      X1(10) => s_data(10),
      X1(11) => s_data(11),
      X1(12) => s_data(12),
      X1(13) => s_data(13),
      X1(14) => s_data(14),
      X1(15) => s_data(15),
      X1(16) => s_data(16),
      X1(17) => s_data(17),
      X1(18) => s_data(18),
      X1(19) => s_data(19),
      X1(20) => s_data(20),
      X1(21) => s_data(21),
      X1(22) => s_data(22),
      X1(23) => s_data(23),
      X1(24) => s_data(24),
      X1(25) => s_data(25),
      X1(26) => s_data(26),
      X1(27) => s_data(27),
      X1(28) => s_data(28),
      X1(29) => s_data(29),
      X1(30) => s_data(30),
      X1(31) => s_data(31),
      X2(0) => s_data(32),
      X2(1) => s_data(33),
      X2(2) => s_data(34),
      X2(3) => s_data(35),
      X2(4) => s_data(36),
      X2(5) => s_data(37),
      X2(6) => s_data(38),
      X2(7) => s_data(39),
      X2(8) => s_data(40),
      X2(9) => s_data(41),
      X2(10) => s_data(42),
      X2(11) => s_data(43),
      X2(12) => s_data(44),
      X2(13) => s_data(45),
      X2(14) => s_data(46),
      X2(15) => s_data(47),
      X2(16) => s_data(48),
      X2(17) => s_data(49),
      X2(18) => s_data(50),
      X2(19) => s_data(51),
      X2(20) => s_data(52),
      X2(21) => s_data(53),
      X2(22) => s_data(54),
      X2(23) => s_data(55),
      X2(24) => s_data(56),
      X2(25) => s_data(57),
      X2(26) => s_data(58),
      X2(27) => s_data(59),
      X2(28) => s_data(60),
      X2(29) => s_data(61),
      X2(30) => s_data(62),
      X2(31) => s_data(63),
      X3     => s_q_mux1,
      X4     => s_q_mux2,
      sel(0) => S2,
      sel(1) => S3,
      q      => s_q_mux3);


  --         Displays Block
  -- Every "Deco" Instanciation is a decoder from HEX to 7-Segments, and
  -- controls one 7-Segment Display. These Displays are used to show different
  -- types of Data around the encryption and decryption process
        
        
  Disp0: component Deco
    port map (
      x(0) => s_q_mux3(0),
      x(1) => s_q_mux3(1),
      x(2) => s_q_mux3(2),
      x(3) => s_q_mux3(3),
      y => D0);

  Disp1: component Deco
    port map (
      x(0) => s_q_mux3(4),
      x(1) => s_q_mux3(5),
      x(2) => s_q_mux3(6),
      x(3) => s_q_mux3(7),
      y => D1);

  Disp2: component Deco
    port map (
      x(0) => s_q_mux3(8),
      x(1) => s_q_mux3(9),
      x(2) => s_q_mux3(10),
      x(3) => s_q_mux3(11),
      y => D2);

  Disp3: component Deco
    port map (
      x(0) => s_q_mux3(12),
      x(1) => s_q_mux3(13),
      x(2) => s_q_mux3(14),
      x(3) => s_q_mux3(15),
      y => D3);

  Disp4: component Deco
    port map (
      x(0) => s_q_mux3(16),
      x(1) => s_q_mux3(17),
      x(2) => s_q_mux3(18),
      x(3) => s_q_mux3(19),
      y => D4);

  Disp5: component Deco
    port map (
      x(0) => s_q_mux3(20),
      x(1) => s_q_mux3(21),
      x(2) => s_q_mux3(22),
      x(3) => s_q_mux3(23),
      y => D5);

  Disp6: component Deco
    port map (
      x(0) => s_q_mux3(24),
      x(1) => s_q_mux3(25),
      x(2) => s_q_mux3(26),
      x(3) => s_q_mux3(27),
      y => D6);

  Disp7: component Deco
    port map (
      x(0) => s_q_mux3(28),
      x(1) => s_q_mux3(29),
      x(2) => s_q_mux3(30),
      x(3) => s_q_mux3(31),
      y => D7);
  
      
end architecture beh;
