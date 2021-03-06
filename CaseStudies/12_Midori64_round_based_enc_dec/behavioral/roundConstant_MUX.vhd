
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY roundConstant_MUX IS
	PORT ( round : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
			 enc_dec: IN STD_LOGIC;
			 roundConstant : OUT  STD_LOGIC_VECTOR (15 DOWNTO 0));
END roundConstant_MUX;

ARCHITECTURE behavioral OF roundConstant_MUX IS

	signal roundenc : std_logic_vector(4 downto 0);

BEGIN

	roundenc <= enc_dec & round;

	WITH roundenc SELECT
		roundConstant <= "0001010110110011" WHEN "00000",
							  "0111100011000000" WHEN "00001",
							  "1010010000110101" WHEN "00010",
							  "0110001000010011" WHEN "00011",
							  "0001000001001111" WHEN "00100",
							  "1101000101110000" WHEN "00101",
							  "0000001001100110" WHEN "00110",
							  "0000101111001100" WHEN "00111",
							  "1001010010000001" WHEN "01000",
							  "0100000010111000" WHEN "01001",
							  "0111000110010111" WHEN "01010",
							  "0010001010001110" WHEN "01011",
							  "0101000100110000" WHEN "01100",
							  "1111100011001010" WHEN "01101",
							  "1101111110010000" WHEN "01110",
							  
							  "0001010110110011" WHEN "11110",
							  "0111100011000000" WHEN "11101",
							  "1010010000110101" WHEN "11100",
							  "0110001000010011" WHEN "11011",
							  "0001000001001111" WHEN "11010",
							  "1101000101110000" WHEN "11001",
							  "0000001001100110" WHEN "11000",
							  "0000101111001100" WHEN "10111",
							  "1001010010000001" WHEN "10110",
							  "0100000010111000" WHEN "10101",
							  "0111000110010111" WHEN "10100",
							  "0010001010001110" WHEN "10011",
							  "0101000100110000" WHEN "10010",
							  "1111100011001010" WHEN "10001",
							  "1101111110010000" WHEN "10000",
							  "0000000000000000" WHEN OTHERS;

END behavioral;

