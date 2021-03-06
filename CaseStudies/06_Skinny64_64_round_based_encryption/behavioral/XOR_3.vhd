
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY XOR_3 IS
	PORT ( in0 	 : IN  STD_LOGIC;
			 in1 	 : IN  STD_LOGIC;
			 in2 	 : IN  STD_LOGIC;
			 Q 	 : OUT STD_LOGIC;
			 const : IN  STD_LOGIC := '0');
END XOR_3;

ARCHITECTURE behavioral OF XOR_3 IS
BEGIN

	Q	<= in0 XOR in1 XOR in2 XOR const;
	
END;

