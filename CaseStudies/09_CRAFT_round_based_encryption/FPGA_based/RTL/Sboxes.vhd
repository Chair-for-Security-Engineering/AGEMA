

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Sboxes IS
	GENERIC ( count : POSITIVE); 
	PORT ( input:  IN  STD_LOGIC_VECTOR (4*count-1 DOWNTO 0);
			 output: OUT STD_LOGIC_VECTOR (4*count-1 DOWNTO 0));
END Sboxes;

ARCHITECTURE behavioral OF Sboxes IS
BEGIN

	GEN :
	FOR i IN 0 TO count-1 GENERATE
		SboxInst: ENTITY work.sbox
		Port Map (
			X	=> input ((i+1)*4-1 downto i*4),
			Y	=> output((i+1)*4-1 downto i*4));
			
	END GENERATE;
			
END behavioral;

