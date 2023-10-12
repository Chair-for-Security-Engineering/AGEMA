
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SubBytes is
    Port ( input  : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0));
end SubBytes;

architecture Behavioral of SubBytes is

	COMPONENT Sbox IS
	PORT ( X     	: IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
	       Y	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
	END COMPONENT;

begin

	GenSubBytes:
	FOR i IN 0 TO 3 GENERATE
		Inst_Sbox: Sbox
		PORT MAP (
			X => input (((i+1)*8-1) downto i*8),
			Y => output(((i+1)*8-1) downto i*8));
	END GENERATE GenSubBytes;
	
end Behavioral;

