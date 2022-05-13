

-- IMPORTS
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- ENTITY
----------------------------------------------------------------------------------
ENTITY ScanFFEN IS
	PORT ( 
	  CLK	: IN  STD_LOGIC;
          EN    : IN  STD_LOGIC;
          SE 	: IN  STD_LOGIC;
          D  	: IN  STD_LOGIC;
          DS	: IN  STD_LOGIC;
          Q 	: OUT STD_LOGIC);
END ScanFFEN;

-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Structural OF ScanFFEN IS	

	signal QD : STD_LOGIC;
	
-- STRUCTURAL
----------------------------------------------------------------------------------
BEGIN
	
	MUXInst: entity work.MUX_1bit
	Port Map (
		S  => SE,
		D0 => D,
		D1 => DS,
		Q  => QD);
	
	-------------------------------------------------------------------------------
	PROCESS(CLK) BEGIN
		IF RISING_EDGE(CLK) THEN
			IF (EN = '1') THEN
				Q <= QD;
			END IF;
		END IF;
	END PROCESS;
	-------------------------------------------------------------------------------

END Structural;


