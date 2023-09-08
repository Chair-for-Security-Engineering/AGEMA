
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY regER IS
	GENERIC ( size: POSITIVE);
	PORT ( clk 	: IN  STD_LOGIC;
			 rst	: IN  STD_LOGIC;
			 EN   : IN  STD_LOGIC;
			 D 	: IN  STD_LOGIC_VECTOR ((size-1) DOWNTO 0);
			 Q 	: OUT  STD_LOGIC_VECTOR ((size-1) DOWNTO 0) := (others => '0'));
END regER;

ARCHITECTURE behavioral OF regER IS
BEGIN

	reg_gen: PROCESS(clk, D)
	BEGIN
		IF RISING_EDGE(clk) THEN
			IF (rst = '1') THEN
				Q	<= (others => '0');
			ELSIF (EN = '1') THEN
				Q	<= D;
			END IF;
		END IF;
	END PROCESS;		
	
END;

