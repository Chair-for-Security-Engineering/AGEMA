
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY key_Derivation IS
	PORT ( key : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
			 wk, k_0, k_1: OUT STD_LOGIC_VECTOR (63 DOWNTO 0));
END key_Derivation;

ARCHITECTURE behavioral OF key_Derivation IS	
BEGIN

	wk  <= key (127 DOWNTO 64) XOR key (63 DOWNTO 0);
	k_0 <= key (127 DOWNTO 64);
	k_1 <= key (63 DOWNTO 0);
		
END ARCHITECTURE behavioral;

