
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY matrixMultiplicationXOR IS
	PORT ( state : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
		    XORIn : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			 result0 : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0);
			 result1 : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0));
END matrixMultiplicationXOR;

ARCHITECTURE behavioral OF matrixMultiplicationXOR IS	
	BEGIN

	MC1: entity work.MCXOR
	PORT MAP ( state(63 downto 48),
	           XORIn(63 downto 48),
				  result0(63 downto 48),
				  result1(63 downto 48));

	MC2: entity work.MCXOR
	PORT MAP ( state(47 downto 32),
				  XORIn(47 downto 32),
				  result0(47 downto 32),
				  result1(47 downto 32));

	MC3: entity work.MCXOR
	PORT MAP ( state(31 downto 16),
				  XORIn(31 downto 16),
				  result0(31 downto 16),
				  result1(31 downto 16));

	MC4: entity work.MCXOR
	PORT MAP ( state(15 downto 0),
				  XORIn(15 downto 0),
				  result0(15 downto 0),
				  result1(15 downto 0));


END behavioral;

