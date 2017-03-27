library ieee;
use IEEE.std_logic_1164.all;

--This component generates the 16 encryption keys used in each SBB block during the entire encryption (and also decryption) process.
--Its 64 bit input is permuted, obtaining two 28 bits outputs wich will be rotated, and permuted again to obtain a 48 bit putput key.

entity KBlock is

	port (Key: in std_logic_vector(63 downto 0);
			K0,K1,K2,K3,K4,K5,K6,K7,K8,K9,K10,K11,K12,K13,K14,K15:out std_logic_vector(47 downto 0));
end KBlock;

	architecture beh of KBlock is
	
		component KP_1 is			--First permutation suffered by the key
			port (inkey: in std_logic_vector(63 downto 0);
					Co: out std_logic_vector(27 downto 0);
					Do: out std_logic_vector(27 downto 0));
		end component;
		
		component ITK_1 is			--Rotates input one bit to the left according to the number of iteration in progress
			port (Ci: in std_logic_vector(27	downto 0);
					Di: in std_logic_vector(27	downto 0);
					Co: out std_logic_vector(27 downto 0);
					Do: out std_logic_vector(27 downto 0));
		end component;
		
		component ITK_2 is			--Rotates input two bits to the left according to the number of iteration in progress
			port (Ci: in std_logic_vector(27	downto 0);
					Di: in std_logic_vector(27	downto 0);
					Co: out std_logic_vector(27 downto 0);
					Do: out std_logic_vector(27 downto 0));
		end component;
	
		component KP_2 is			--Second permutation suffered by the key

			port (Ci: in std_logic_vector(27	downto 0);
					Di: in std_logic_vector(27	downto 0);
					outkey: out std_logic_vector(47	downto 0));
		end component;
		
        -- These signals are used to conect the ITK_1 or ITK_2 and KP_2 blocks in every iteration
        -- of the encryption process. Each one is numerated in order to identify it with the correct
		--iteration. They are initianlized just for simulation purposes according to a combinational system. 
		signal S_Co0: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do0: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co1: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do1: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co2: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do2: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co3: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do3: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co4: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do4: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co5: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do5: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co6: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do6: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co7: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do7: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co8: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do8: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co9: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do9: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co10: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do10: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co11: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do11: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co12: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do12: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co13: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do13: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co14: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do14: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co15: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do15: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Co16: std_logic_vector(27 downto 0):=(others=>'0');
		signal S_Do16: std_logic_vector(27 downto 0):=(others=>'0');

		
		begin
			first_p: KP_1 port map (inkey => key,
									Co => s_Co0,
									Do => s_Do0);

			ite_01: ITK_1 port map (Ci => s_Co0,
									Di => s_Do0,
									Co => s_Co1,
									Do => s_Do1);
			
			second_p01: KP_2 port map (	Ci => s_Co1,
										Di => s_Do1,
										outkey => K0);	

			ite_02: ITK_1 port map (Ci => s_Co1,
									Di => s_Do1,
									Co => s_Co2,
									Do => s_Do2);
			
			second_p02: KP_2 port map (	Ci => s_Co2,
										Di => s_Do2,
										outkey => K1);

			ite_03: ITK_2 port map (Ci => s_Co2,
									Di => s_Do2,
									Co => s_Co3,
									Do => s_Do3);
			
			second_p03: KP_2 port map ( Ci => s_Co3,
										Di => s_Do3,
										outkey => K2);

			ite_04: ITK_2 port map (Ci => s_Co3,
									Di => s_Do3,
									Co => s_Co4,
									Do => s_Do4);
			
			second_p04: KP_2 port map (	Ci => s_Co4,
										Di => s_Do4,
										outkey => K3);

			ite_05: ITK_2 port map (Ci => s_Co4,
									Di => s_Do4,
									Co => s_Co5,
									Do => s_Do5);
			
			second_p05: KP_2 port map (	Ci => s_Co5,
										Di => s_Do5,
										outkey => K4);

			ite_06: ITK_2 port map (Ci => s_Co5,
									Di => s_Do5,
									Co => s_Co6,
									Do => s_Do6);
			
			second_p06: KP_2 port map ( Ci => s_Co6,
										Di => s_Do6,
										outkey => K5);

			ite_07: ITK_2 port map (Ci => s_Co6,
									Di => s_Do6,
									Co => s_Co7,
									Do => s_Do7);
			
			second_p07: KP_2 port map (	Ci => s_Co7,
										Di => s_Do7,
										outkey => K6);

			ite_08: ITK_2 port map (Ci => s_Co7,
									Di => s_Do7,
									Co => s_Co8,
									Do => s_Do8);
			
			second_p08: KP_2 port map (	Ci => s_Co8,
										Di =>	s_Do8,
										outkey => K7);

			ite_09: ITK_1 port map (Ci => s_Co8,
									Di => s_Do8,
									Co => s_Co9,
									Do => s_Do9);
			
			second_p09: KP_2 port map (	Ci => s_Co9,
										Di => s_Do9,
										outkey=> K8);
												
			ite_10: ITK_2 port map (Ci => s_Co9,
									Di => s_Do9,
									Co => s_Co10,
									Do => s_Do10);
			
			second_p10: KP_2 port map (	Ci => s_Co10,
										Di => s_Do10,
										outkey => K9);

			ite_11: ITK_2 port map (Ci => s_Co10,
									Di => s_Do10,
									Co => s_Co11,
									Do => s_Do11);
			
			second_p11: KP_2 port map (	Ci => s_Co11,
										Di => s_Do11,
										outkey => K10);

			ite_12: ITK_2 port map (Ci => s_Co11,
									Di => s_Do11,
									Co => s_Co12,
									Do => s_Do12);
			
			second_p12: KP_2 port map (	Ci => s_Co12,
										Di => s_Do12,
										outkey => K11);

			ite_13: ITK_2 port map (Ci => s_Co12,
									Di => s_Do12,
									Co => s_Co13,
									Do => s_Do13);
			
			second_p13: KP_2 port map (	Ci => s_Co13,
										Di => s_Do13,
										outkey => K12);

			ite_14: ITK_2 port map (Ci => s_Co13,
									Di => s_Do13,
									Co => s_Co14,
									Do => s_Do14);
			
			second_p14: KP_2 port map (	Ci => s_Co14,
										Di => s_Do14,
										outkey => K13);
	
			ite_15: ITK_2 port map (Ci => s_Co14,
									Di => s_Do14,
									Co => s_Co15,
									Do => s_Do15);

			second_p15: KP_2 port map (	Ci => s_Co15,
										Di => s_Do15,
										outkey => K14);
										
			ite_16: ITK_2 port map (Ci => s_Co15,
									Di => s_Do15,
									Co => s_Co16,
									Do => s_Do16);
			
			second_p16: KP_2 port map (	Ci => s_Co16,
										Di => s_Do16,
										outkey => K15);

		end beh;