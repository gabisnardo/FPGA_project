library ieee;
use ieee.std_logic_1164.all;

-- This blocks output is the XOR opperation between its two inputs.
entity OREX is

	port (	X_in: in std_logic_vector(31 downto 0);		--this input corresponds to the output of the permutation block
			L: in std_logic_vector(31 downto 0);		--this input corresponds to the unmodified left input of each SBB
			X_out: out std_logic_vector(31 downto 0));
end OREX;
				
architecture beh of OREX is
begin
  X_out <= X_in xor L;
end beh;
