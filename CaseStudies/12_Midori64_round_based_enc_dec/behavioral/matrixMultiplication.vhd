
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY matrixMultiplication IS
	PORT ( state : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			 result : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0));
END matrixMultiplication;

ARCHITECTURE behavioral OF matrixMultiplication IS	
	BEGIN

	MC1: entity work.MC
	PORT MAP ( state(63 downto 48),
				  result(63 downto 48));

	MC2: entity work.MC
	PORT MAP ( state(47 downto 32),
				  result(47 downto 32));

	MC3: entity work.MC
	PORT MAP ( state(31 downto 16),
				  result(31 downto 16));

	MC4: entity work.MC
	PORT MAP ( state(15 downto 0),
				  result(15 downto 0));


END behavioral;

