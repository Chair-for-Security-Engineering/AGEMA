
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY MC IS
	GENERIC ( size: POSITIVE);
	PORT ( state  : IN  STD_LOGIC_VECTOR (size*16-1 DOWNTO 0);
			 result : OUT STD_LOGIC_VECTOR (size*16-1 DOWNTO 0));
END MC;

ARCHITECTURE behavioral OF MC IS	
	signal row0, row1, row2, row3 : STD_LOGIC_VECTOR (size*4-1 DOWNTO 0);
	signal r0, r1, r2, r3         : STD_LOGIC_VECTOR (size*4-1 DOWNTO 0);

BEGIN

	row0 <= state(size*16-1  downto  size*12);
	row1 <= state(size*12-1  downto  size*8);
	row2 <= state(size*8-1   downto  size*4);
	row3 <= state(size*4-1   downto  size*0);

	------------------------------------------
	
	MCR0: entity work.XOR_3n
	GENERIC Map ( size => size, count=> 4)
	PORT Map( row0, row2, row3, r0);

	--MCR1: 
	r1<= row0;

	MCR2: entity work.XOR_2n
	GENERIC Map ( size => size, count=> 4)
	PORT Map( row1, row2, r2);

	MCR3: entity work.XOR_2n
	GENERIC Map ( size => size, count=> 4)
	PORT Map( row0, row2, r3);

	------------------------------------------
	
	result <= r0 & r1 & r2 & r3;

END behavioral;

