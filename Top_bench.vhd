library ieee;
use ieee.std_logic_1164.all;

entity TOP_bench is
end TOP_bench;

architecture bench of TOP_bench is

component Top is

  port (	S1 : in  std_logic;  -- Select between Data High and Data Low
			S2 : in  std_logic;  -- Select between Encrypt data and Decrypt data
			S3 : in  std_logic;  -- Select between Data and Decrypt data
			i0 : in  std_logic;
			i1 : in  std_logic;
			i2 : in  std_logic;
			i3 : in  std_logic;
			i4 : in  std_logic;
			i5 : in  std_logic;
			i6 : in  std_logic;
			i7 : in  std_logic;
			i8 : in  std_logic;
			i9 : in  std_logic;
			i10: in  std_logic;
			i11: in  std_logic;
			k0:  in  std_logic;
			D0 : out std_logic_vector (6 downto 0);  -- Display 0
			D1 : out std_logic_vector (6 downto 0);  -- Display 1
			D2 : out std_logic_vector (6 downto 0);  -- Display 2
			D3 : out std_logic_vector (6 downto 0);  -- Display 3
			D4 : out std_logic_vector (6 downto 0);  -- Display 4
			D5 : out std_logic_vector (6 downto 0);  -- Display 5
			D6 : out std_logic_vector (6 downto 0);  -- Display 6
			D7 : out std_logic_vector (6 downto 0));  -- Display 7
  
end component;

	signal s_S1:std_logic:='0';
	signal s_S2:std_logic:='0';
	signal s_S3:std_logic:='0';
	signal s_i0 :std_logic:='0';
	signal s_i1 :std_logic:='0';
	signal s_i2 :std_logic:='0';
	signal s_i3 :std_logic:='0';
	signal s_i4 :std_logic:='0';
	signal s_i5 :std_logic:='0';
	signal s_i6 :std_logic:='0';
	signal s_i7 :std_logic:='0';
	signal s_i8 :std_logic:='0';
	signal s_i9 :std_logic:='0';
	signal s_i10:std_logic:='0';
	signal s_i11:std_logic:='0';
	--signal s_k0:std_logic:='0';
	signal s_D0: std_logic_vector(6 downto 0):= (others=>'0');
	signal s_D1: std_logic_vector(6 downto 0):= (others=>'0');
	signal s_D2: std_logic_vector(6 downto 0):= (others=>'0');
	signal s_D3: std_logic_vector(6 downto 0):= (others=>'0');
	signal s_D4: std_logic_vector(6 downto 0):= (others=>'0');
	signal s_D5: std_logic_vector(6 downto 0):= (others=>'0');
	signal s_D6: std_logic_vector(6 downto 0):= (others=>'0');
	signal s_D7: std_logic_vector(6 downto 0):= (others=>'0');


begin

toplevel: Top port map(	S1	=>s_S1,
								S2	=>s_S2,
								S3	=>s_S3,
								i0 =>s_i0,
								i1 =>s_i1,
								i2 =>s_i2,
								i3 =>s_i3,
								i4 =>s_i4,
								i5 =>s_i5,
								i6 =>s_i6,
								i7 =>s_i7,
								i8 =>s_i8,
								i9 =>s_i9,
								i10 =>s_i10,
								i11 =>s_i11,
								--k0 =>s_k0,
								D0	=>s_D0,
								D1	=>s_D1,
								D2	=>s_D2,
								D3	=>s_D3,
								D4	=>s_D4,
								D5	=>s_D5,
								D6	=>s_D6,
								D7	=>s_D7);
									
	test: process

		begin
			wait for 10 us;
			s_i1<='1';
			s_i2<='1';
			wait for 10 us;--display low part of data input
			s_S2<='1';		--display high part of data input
			wait for 10 us;
			s_S3<='1';
			s_S2<='0';
			s_S1<='0';		--display low part of encrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of encrypted data
			wait for 10 us;
			s_S2<='1';
			s_S1<='0';		--display low part of decrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of decrypted data
			wait for 10 us;
			s_S3<='0';
			s_S2<='0';
			s_S1<='0';
			s_i3<='1';
			s_i4<='1';
			wait for 10 us;--display low part of data input
			s_S2<='1';		--display high part of data input
			wait for 10 us;
			s_S3<='1';
			s_S2<='0';
			s_S1<='0';		--display low part of encrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of encrypted data
			wait for 10 us;
			s_S2<='1';
			s_S1<='0';		--display low part of decrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of decrypted data
			--wait for 10 us;
			--s_k0<='1';		--change encryption key, without modifying the data input
			wait for 10 us;--display low part of data input
			s_S2<='1';		--display high part of data input
			wait for 10 us;
			s_S3<='1';
			s_S2<='0';
			s_S1<='0';		--display low part of encrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of encrypted data
			wait for 10 us;
			s_S2<='1';
			s_S1<='0';		--display low part of decrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of decrypted data
			wait for 10 us;
			s_S3<='0';
			s_S2<='0';
			s_S1<='0';
			s_i5<='1';
			s_i8<='1';
			wait for 10 us;--display low part of data input
			s_S2<='1';		--display high part of data input
			wait for 10 us;
			s_S3<='1';
			s_S2<='0';
			s_S1<='0';		--display low part of encrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of encrypted data
			wait for 10 us;
			s_S2<='1';
			s_S1<='0';		--display low part of decrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of decrypted data
			wait for 10 us;
			s_S3<='0';
			s_S2<='0';
			s_S1<='0';
			s_i8<='1';
			s_i9<='1';
			wait for 10 us;--display low part of data input
			s_S2<='1';		--display high part of data input
			wait for 10 us;
			s_S3<='1';
			s_S2<='0';
			s_S1<='0';		--display low part of encrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of encrypted data
			wait for 10 us;
			s_S2<='1';
			s_S1<='0';		--display low part of decrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of decrypted data
			wait for 10 us;
			s_S3<='0';
			s_S2<='0';
			s_S1<='0';
			s_i10<='1';
			s_i11<='1';
			wait for 10 us;--display low part of data input
			s_S2<='1';		--display high part of data input
			wait for 10 us;
			s_S3<='1';
			s_S2<='0';
			s_S1<='0';		--display low part of encrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of encrypted data
			wait for 10 us;
			s_S2<='1';
			s_S1<='0';		--display low part of decrypted data
			wait for 10 us;
			s_S1<='1';		--display high part of decrypted data
			Wait;

	end process test;
	
end bench;
