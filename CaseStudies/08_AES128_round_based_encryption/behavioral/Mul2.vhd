
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mul2 is
    Port ( input  : in  STD_LOGIC_VECTOR (7 downto 0);
           output	: out STD_LOGIC_VECTOR (7 downto 0));
end Mul2;

architecture Behavioral of Mul2 is

	signal Shifted	: STD_LOGIC_VECTOR (7 downto 0);
	signal Mask    : STD_LOGIC_VECTOR (7 downto 0);
	
begin

	Shifted 	<= input(6 downto 0) & '0';
	Mask		<= x"1B" WHEN input(7) = '1' ELSE x"00";
	
	output 	<= Shifted XOR Mask;
		
end Behavioral;

