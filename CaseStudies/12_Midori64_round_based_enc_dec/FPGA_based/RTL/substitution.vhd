
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY substitution IS
	PORT ( state : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			 result : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0));
END substitution;

ARCHITECTURE behavioral OF substitution IS
	COMPONENT sbox IS
		PORT ( X : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		       Y:  OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT sBox_Inverse IS
		PORT ( input : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				 output: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
	END COMPONENT;
	
	BEGIN
		substition_PRINCE:
			FOR i IN 0 TO 15 GENERATE
				sBox_PRINCE: sbox
					PORT MAP ( X => state(((i+1) * 4 - 1)  DOWNTO i*4),
						   Y => result(((i+1) * 4 - 1) DOWNTO i*4));
			END GENERATE;
END behavioral;

