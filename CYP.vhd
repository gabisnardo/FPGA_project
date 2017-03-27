library ieee;
use ieee.std_logic_1164.all;

entity CYP is
	port( data: in std_logic_vector(63 downto 0);      -- Data input, will be Encrypted 
              key:	in std_logic_vector(63 downto 0);  -- Key, To encrypt Data
              cyp_data: out std_logic_vector(63 downto 0));-- Data Output, Encrypted Data  
end CYP;
				
architecture beh of CYP is

	component KBlock is  -- This block uses the 64 bits key to generate
                             -- sixteen 48-bit keys used in every iteration of
                             -- the encryption process
		port (Key: in std_logic_vector (63 downto 0);
                      K0,K1,K2,K3,K4,K5,K6,K7,K8,K9,K10,K11,K12,K13,K14,K15 : out std_logic_vector (47 downto 0));
	end component;
	
	component IP is -- Initial Permutation of data input
		port(	Data: in std_logic_vector (63 downto 0);
			L: out std_logic_vector (31 downto 0); -- Low 32-bit Data Permutated
			R: out std_logic_vector (31 downto 0));-- High 32-bit Data Permutated
	end component;
	
	component SBB is -- Standard Building Block
                         -- it uses the left and right part of the Data and a 48-bit
                         -- key to generate the left and right part of the
                         -- encrypted data, after 16 iterations.
		port (R: in std_logic_vector(31 downto 0);
                      L: in std_logic_vector(31 downto 0);
                      key: in std_logic_vector(47 downto 0);
                      R_1: out std_logic_vector(31 downto 0);
                      L_1: out std_logic_vector(31 downto 0));
	end component;
	
	component IP_1 is -- Final permutation
                          -- It is the reverse Initial permutation
                          -- is used in the final step of the encryption process to generate
                          -- the Final encrypted Data.
		port (L: in std_logic_vector(31 downto 0);
                      R: in std_logic_vector(31 downto 0);
                      C_data: out std_logic_vector(63 downto 0));
	end component;

        -- These signals are used to conect the SBB blocks in every iteration
        -- of the encryption process. Each one is numerated in order to
        -- identify it with the correct iteration.
	signal s_L: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L1: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R1: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L2: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R2: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L3: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R3: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L4: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R4: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L5: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R5: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L6: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R6: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L7: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R7: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L8: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R8: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L9: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R9: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L10: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R10: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L11: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R11: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L12: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R12: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L13: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R13: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L14: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R14: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L15: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R15: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_L16: std_logic_vector(31 downto 0):=(others=>'0');
	signal s_R16: std_logic_vector(31 downto 0):=(others=>'0');


        -- These signals are used to conect every 48-bit key generated for the
        -- Key block component with the correct SBB block in every iteration.
	signal s_K0: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K1: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K2: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K3: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K4: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K5: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K6: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K7: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K8: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K9: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K10: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K11: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K12: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K13: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K14: std_logic_vector(47 downto 0):=(others=>'0');
	signal s_K15: std_logic_vector(47 downto 0):=(others=>'0');
	
	begin
	
	key_generator: KBlock port map ( Key => key,
					 K0  => s_K0,
					 K1  => s_K1,
					 K2  => s_K2,
					 K3  => s_K3,
					 K4  => s_K4,
					 K5  => s_K5,
					 K6  => s_K6,
					 K7  => s_K7,
					 K8  => s_K8,
					 K9  => s_K9,
					 K10 => s_K10,
					 K11 => s_K11,
					 K12 => s_K12,
					 K13 => s_K13,
					 K14 => s_K14,
					 K15 => s_K15);
								
	initial_p: IP port map (Data =>	data,
							L => s_L,
							R => s_R);
									
	last_p: IP_1 port map (	L => s_L16,
							R => s_R16,
                            C_data => cyp_data);
	
	sbb_block0: SBB port map (  R => s_R,
                                L => s_L,
                                key	=> s_K0,
                                R_1	=> s_R1,
                                L_1	=> s_L1);

	sbb_block1: SBB port map (  R => s_R1,
                                L => s_L1,
                                key	=> s_K1,
                                R_1	=> s_R2,
                                L_1	=> s_L2);

	sbb_block2: SBB port map (  R => s_R2,
                                L => s_L2,
                                key	=> s_K2,
                                R_1	=> s_R3,
                                L_1	=> s_L3);
									  
	sbb_block3: SBB port map (  R => s_R3,
                                L => s_L3,
                                key	=> s_K3,
                                R_1	=> s_R4,
                                L_1	=> s_L4);
									  
	sbb_block4: SBB port map (  R => s_R4,
                                L => s_L4,
                                key	=> s_K4,
                                R_1	=> s_R5,
                                L_1	=> s_L5);
							  
	sbb_block5: SBB port map (  R => s_R5,
                                L => s_L5,
                                key	=> s_K5,
                                R_1	=> s_R6,
                                L_1	=> s_L6);
									  
	sbb_block6: SBB port map (  R => s_R6,
                                L => s_L6,
                                key	=> s_K6,
                                R_1	=> s_R7,
                                L_1	=> s_L7);
									  
	sbb_block7: SBB port map (  R => s_R7,
                                L => s_L7,
                                key	=> s_K7,
                                R_1	=> s_R8,
                                L_1	=> s_L8);
									  
	sbb_block8: SBB port map (  R => s_R8,
                                L => s_L8,
                                key	=> s_K8,
                                R_1	=> s_R9,
                                L_1	=> s_L9);
									  
									  
	sbb_block9: SBB port map (  R => s_R9,
                                L => s_L9,
                                key	=> s_K9,
                                R_1	=> s_R10,
                                L_1	=> s_L10);
									  
									  
	sbb_block10: SBB port map ( R => s_R10,
                                L => s_L10,
                                key	=> s_K10,
                                R_1	=> s_R11,
                                L_1	=> s_L11);
									  
									  
	sbb_block11: SBB port map ( R => s_R11,
                                L => s_L11,
                                key	=> s_K11,
                                R_1	=> s_R12,
                                L_1	=> s_L12);
									  
									  
	sbb_block12: SBB port map ( R => s_R12,
                                L => s_L12,
                                key	=> s_K12,
                                R_1	=> s_R13,
                                L_1	=> s_L13);
									  
									  
	sbb_block13: SBB port map ( R => s_R13,
                                L => s_L13,
                                key	=> s_K13,
                                R_1	=> s_R14,
                                L_1	=> s_L14);
									  
									  
	sbb_block14: SBB port map ( R => s_R14,
                                L => s_L14,
                                key	=> s_K14,
                                R_1	=> s_R15,
                                L_1	=> s_L15);
									  
	sbb_block15: SBB port map (	R => s_R15,
                                L => s_L15,
                                key	=> s_K15,
                                R_1	=> s_R16,
                                L_1	=> s_L16);
									  
end beh;
