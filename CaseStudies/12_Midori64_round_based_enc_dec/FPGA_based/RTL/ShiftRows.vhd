
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ShiftRows IS
	PORT ( state : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			 result : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0));
END ShiftRows;

ARCHITECTURE behavioral OF ShiftRows IS
	BEGIN
		result <= state(63 downto 60) & state(23 downto 20) & state(43 downto 40) & state(3 downto  0) & state(7 downto  4) & state(47 downto 44) & state(19 downto 16) & state(59 downto 56) & state(27 downto 24) & state(51 downto 48) & state(15 downto 12) & state(39 downto 36) & state(35 downto 32) & state(11 downto  8) & state(55 downto 52) & state(31 downto 28);
END behavioral;

