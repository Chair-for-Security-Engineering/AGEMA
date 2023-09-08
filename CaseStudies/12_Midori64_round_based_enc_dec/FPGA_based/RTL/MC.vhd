
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY MC IS
	PORT ( state : IN  STD_LOGIC_VECTOR (63 DOWNTO 48);
			 result : OUT  STD_LOGIC_VECTOR (15 DOWNTO 0));
END MC;

ARCHITECTURE behavioral OF MC IS	
	BEGIN

	result(15 downto 12) <= state(59 downto 56) xor state(55 downto 52) xor state(51 downto 48);
	result(11 downto  8) <= state(63 downto 60) xor state(55 downto 52) xor state(51 downto 48);
	result( 7 downto  4) <= state(63 downto 60) xor state(59 downto 56) xor state(51 downto 48);
	result( 3 downto  0) <= state(63 downto 60) xor state(59 downto 56) xor state(55 downto 52);

END behavioral;

