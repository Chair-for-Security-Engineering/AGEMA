
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY xor_2 IS
	PORT ( a	: IN  STD_LOGIC;
			 b	: IN  STD_LOGIC;
			 c	: OUT STD_LOGIC);
END xor_2;

ARCHITECTURE behavioral OF xor_2 IS
BEGIN

	c <= a xor b;
		
END;
