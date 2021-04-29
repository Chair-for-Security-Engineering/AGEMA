
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY xnor_2 IS
	PORT ( a	: IN  STD_LOGIC;
			 b	: IN  STD_LOGIC;
			 c	: OUT STD_LOGIC);
END xnor_2;

ARCHITECTURE behavioral OF xnor_2 IS
BEGIN

	c <= a xnor b;
		
END;
