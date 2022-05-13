LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY LookUp IS
	GENERIC  ( 
		size : POSITIVE;  
		Table  : STD_LOGIC_VECTOR); -- ((2**size)-1 DOWNTO 0)
	PORT ( 
		input : IN  STD_LOGIC_VECTOR (size-1 DOWNTO 0);
		output: OUT STD_LOGIC);
END LookUp;

ARCHITECTURE behavioral OF LookUp IS

	constant TableDownto : STD_LOGIC_VECTOR ((2**size)-1 DOWNTO 0) := Table;

BEGIN

	tableprocess: Process (input)
	begin
		output <= TableDownto((2**size)-1-to_integer(unsigned(input)));
	end process;	
			
END behavioral;

