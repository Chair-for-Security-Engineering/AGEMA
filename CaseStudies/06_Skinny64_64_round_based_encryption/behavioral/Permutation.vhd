
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Permutation is

GENERIC ( size  : POSITIVE);
Port (
       input_key 			   : in  STD_LOGIC_VECTOR (16*size-1 downto 0);
		 permuted_key 	      : out STD_LOGIC_VECTOR (16*size-1 downto 0));

end Permutation;

architecture Behavioral of Permutation is

begin

   -- ROW 1 ----------------------------------------------------------------------
	permuted_key((16 * size - 1) DOWNTO (15 * size)) <= input_key(( 7 * size - 1) DOWNTO ( 6 * size));
	permuted_key((15 * size - 1) DOWNTO (14 * size)) <= input_key(( 1 * size - 1) DOWNTO ( 0 * size));
	permuted_key((14 * size - 1) DOWNTO (13 * size)) <= input_key(( 8 * size - 1) DOWNTO ( 7 * size));
	permuted_key((13 * size - 1) DOWNTO (12 * size)) <= input_key(( 3 * size - 1) DOWNTO ( 2 * size));
	

	-- ROW 2 ----------------------------------------------------------------------	
	permuted_key((12 * size - 1) DOWNTO (11 * size)) <= input_key(( 6 * size - 1) DOWNTO ( 5 * size));
	permuted_key((11 * size - 1) DOWNTO (10 * size)) <= input_key(( 2 * size - 1) DOWNTO ( 1 * size));
	permuted_key((10 * size - 1) DOWNTO ( 9 * size)) <= input_key(( 4 * size - 1) DOWNTO ( 3 * size));
	permuted_key(( 9 * size - 1) DOWNTO ( 8 * size)) <= input_key(( 5 * size - 1) DOWNTO ( 4 * size));
	

	-- ROW 3 ----------------------------------------------------------------------	
	permuted_key(( 8 * size - 1) DOWNTO ( 7 * size)) <= input_key((16 * size - 1) DOWNTO (15 * size));
	permuted_key(( 7 * size - 1) DOWNTO ( 6 * size)) <= input_key((15 * size - 1) DOWNTO (14 * size));
	permuted_key(( 6 * size - 1) DOWNTO ( 5 * size)) <= input_key((14 * size - 1) DOWNTO (13 * size));
	permuted_key(( 5 * size - 1) DOWNTO ( 4 * size)) <= input_key((13 * size - 1) DOWNTO (12 * size));
	

	-- ROW 4 ----------------------------------------------------------------------	
	permuted_key(( 4 * size - 1) DOWNTO ( 3 * size)) <= input_key((12 * size - 1) DOWNTO (11 * size));
	permuted_key(( 3 * size - 1) DOWNTO ( 2 * size)) <= input_key((11 * size - 1) DOWNTO (10 * size));
	permuted_key(( 2 * size - 1) DOWNTO ( 1 * size)) <= input_key((10 * size - 1) DOWNTO ( 9 * size));
	permuted_key(( 1 * size - 1) DOWNTO ( 0 * size)) <= input_key(( 9 * size - 1) DOWNTO ( 8 * size));
	
	
end Behavioral;

