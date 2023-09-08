LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ShiftRows IS
	GENERIC ( size: POSITIVE);
	PORT ( state  : IN  STD_LOGIC_VECTOR (size*16-1 DOWNTO 0);
			 result : OUT STD_LOGIC_VECTOR (size*16-1 DOWNTO 0));
END ShiftRows;

ARCHITECTURE behavioral OF ShiftRows IS

BEGIN


   -- ROW 1 ----------------------------------------------------------------------
	result((16 * size - 1) DOWNTO (12 * size)) <= state((16 * size - 1) DOWNTO (12 * size));
	
	-- ROW 2 ----------------------------------------------------------------------
	result((12 * size - 1) DOWNTO ( 8 * size)) <= state(( 9 * size - 1) DOWNTO ( 8 * size)) & state((12 * size - 1) DOWNTO ( 9 * size));
	
	-- ROW 3 ----------------------------------------------------------------------	
	result(( 8 * size - 1) DOWNTO ( 4 * size)) <= state(( 6 * size - 1) DOWNTO ( 4 * size)) & state(( 8 * size - 1) DOWNTO ( 6 * size));

	-- ROW 4 ----------------------------------------------------------------------
	result(( 4 * size - 1) DOWNTO ( 0 * size)) <= state(( 3 * size - 1) DOWNTO ( 0 * size)) & state(( 4 * size - 1) DOWNTO ( 3 * size));
	


END behavioral;

