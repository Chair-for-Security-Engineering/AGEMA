
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY sBox IS
	PORT ( input: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			 output: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END sBox;

ARCHITECTURE behavioral OF sBox IS
	BEGIN

		WITH input SELECT
			output <= x"c" WHEN x"0",
						 x"a" WHEN x"1",
						 x"d" WHEN x"2",
						 x"3" WHEN x"3",
						 x"e" WHEN x"4",
						 x"b" WHEN x"5",
						 x"f" WHEN x"6",
						 x"7" WHEN x"7",
						 x"8" WHEN x"8",
						 x"9" WHEN x"9",
						 x"1" WHEN x"A",
						 x"5" WHEN x"B",
						 x"0" WHEN x"C",
						 x"2" WHEN x"D",
						 x"4" WHEN x"E",
						 x"6" WHEN OTHERS;
			
END behavioral;

