library ieee;
use ieee.std_logic_1164.all;

entity DCYP is
	port(E_data: in std_logic_vector (63 downto 0);		-- Encrypted Data input, will be Decrypted.
        key: in std_logic_vector (63 downto 0);        	-- Key, Used to decrypt the Data input.
        D_data: out std_logic_vector (63 downto 0));   	-- Decrypted Data output.
end DCYP;
				
architecture beh of DCYP is

	component KBlock is  -- This block uses the 64 bits key to generate
                             -- sixteen 48-bit keys used in every iteration of
                             -- the encryption process
		port (Key: in std_logic_vector (63 downto 0);
              K0,K1,K2,K3,K4,K5,K6,K7,K8,K9,K10,K11,K12,K13,K14,K15 : out std_logic_vector (47 downto 0));
	end component;
	
	component IP is -- Initial permutation, the first permutation made in
                        -- the encryption process, here is used as the
                        -- first permutation of the decrytion process
                        -- because it is the inverse of the final
                        -- permutation used in the encryption process.
		port(Data: in std_logic_vector (63 downto 0);
			 L: out std_logic_vector (31 downto 0);
			 R: out std_logic_vector (31 downto 0));
	end component;
	
	component SBB is -- Standard Building Block, here is used changing
                         -- its inputs in order to obtain inversly the inputs
						 -- from the outputs.
						 -- It's used 16 times.
		port (	R: in std_logic_vector(31 downto 0);
				L: in std_logic_vector(31 downto 0);
				key: in std_logic_vector(47 downto 0);
				R_1: out std_logic_vector(31 downto 0);
				L_1: out std_logic_vector(31 downto 0));
	end component;
	
	component IP_1 is -- Final permutation, the same block used as the last permutation	
						 -- in the encryption process, works here as the inverse process
						 -- of the initial permutation
		port (	L: in std_logic_vector(31 downto 0);
                R: in std_logic_vector(31 downto 0);
                C_data: out std_logic_vector(63 downto 0));
	end component;


        -- These signals are used to conect every SBB block in every iteration
        -- of the decryptation process.
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


        -- These signals are used to conect every SBB block with the correct
        -- 48-bit key in order to make de decryptation process successful.
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
	
	key_generator: KBlock port map (Key => key,
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
	

	Initial_P: IP port map (Data	=>	E_data,
							L	=>	s_L16,
							R	=>	s_R16);
	
	SBB_Block15: SBB port map (	R => s_L16,
								L => s_R16,
                                key => s_K15,
                                R_1 => s_L15,
                                L_1 => s_R15);
  
	SBB_Block14: SBB port map (	R => s_L15,
								L => s_R15,
                                key => s_K14,
                                R_1 => s_L14,
                                L_1 => s_R14);
  
	SBB_Block13: SBB port map (	R => s_L14,
                                L => s_R14,
                                key => s_K13,
                                R_1 => s_L13,
                                L_1 => s_R13);
  
	SBB_Block12: SBB port map (	R => s_L13,
                                L => s_R13,
                                key => s_K12,
                                R_1 => s_L12,
                                L_1 => s_R12);
  
	SBB_Block11: SBB port map (	R => s_L12,
                                L => s_R12,
                                key => s_K11,
                                R_1 => s_L11,
                                L_1 => s_R11);
  
	SBB_Block10: SBB port map (	R => s_L11,
                                L => s_R11,
                                key => s_K10,
                                R_1 => s_L10,
                                L_1 => s_R10);
  
	SBB_Block9: SBB port map (	R => s_L10,
                                L => s_R10,
                                key => s_K9,
                                R_1 => s_L9,
                                L_1 => s_R9);
  
	SBB_Block8: SBB port map (	R => s_L9,
                                L => s_R9,
                                key => s_K8,
                                R_1 => s_L8,
                                L_1 => s_R8);
  
	SBB_Block7: SBB port map (	R => s_L8,
                                L => s_R8,
                                key => s_K7,
                                R_1 => s_L7,
                                L_1 => s_R7);
  
	SBB_Block6: SBB port map (	R => s_L7,
                                L => s_R7,
                                key => s_K6,
                                R_1 => s_L6,
                                L_1 => s_R6);
  
	SBB_Block5: SBB port map (	R => s_L6,
                                L => s_R6,
                                key => s_K5,
                                R_1 => s_L5,
                                L_1 => s_R5);
  
	SBB_Block4: SBB port map (	R => s_L5,
                                L => s_R5,
                                key => s_K4,
								R_1 => s_L4,
                                L_1 => s_R4);
  
	SBB_Block3: SBB port map (	R => s_L4,
                                L => s_R4,
                                key => s_K3,
                                R_1 => s_L3,
                                L_1 => s_R3);
  
	SBB_Block2: SBB port map (	R => s_L3,
                                L => s_R3,
                                key => s_K2,
                                R_1 => s_L2,
                                L_1 => s_R2);
  
	SBB_Block1: SBB port map (	R => s_L2,
                                L => s_R2,
                                key => s_K1,
                                R_1 => s_L1,
                                L_1 => s_R1);
  
	SBB_Block0: SBB port map (	R => s_L1,
                                L => s_R1,
                                key => s_K0,
                                R_1 => s_L,
                                L_1 => s_R);
										 
	Final_p: IP_1 port map(	L		=>	s_L,
							R		=>	s_R,
							C_data  =>	D_data);
									  
end beh;
  
