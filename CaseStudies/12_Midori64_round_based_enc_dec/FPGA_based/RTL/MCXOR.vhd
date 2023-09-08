
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;


ENTITY MCXOR IS
	PORT ( state : IN  STD_LOGIC_VECTOR (63 DOWNTO 48);
			 XORin : IN  STD_LOGIC_VECTOR (15 DOWNTO 0);
			 result0 : OUT  STD_LOGIC_VECTOR (15 DOWNTO 0);
			 result1 : OUT  STD_LOGIC_VECTOR (15 DOWNTO 0));
END MCXOR;

ARCHITECTURE behavioral OF MCXOR IS	
BEGIN

	LoopGen: FOR i IN 0 TO 3 GENERATE

		INST0 : LUT6_2 generic map (INIT => X"0000699600009696")
		port map (
			I0 => state(48+i),
			I1 => state(52+i),
			I2 => state(56+i),
			I3 => XORin(12+i),
			I4 => '0',
			I5 => '1',
			O5 => result0(12+i),
			O6 => result1(12+i));

		INST1 : LUT6_2 generic map (INIT => X"0000699600009696")
		port map (
			I0 => state(48+i),
			I1 => state(52+i),
			I2 => state(60+i),
			I3 => XORin(8+i),
			I4 => '0',
			I5 => '1',
			O5 => result0(8+i),
			O6 => result1(8+i));

		INST2 : LUT6_2 generic map (INIT => X"0000699600009696")
		port map (
			I0 => state(48+i),
			I1 => state(56+i),
			I2 => state(60+i),
			I3 => XORin(4+i),
			I4 => '0',
			I5 => '1',
			O5 => result0(4+i),
			O6 => result1(4+i));

		INST3 : LUT6_2 generic map (INIT => X"0000699600009696")
		port map (
			I0 => state(52+i),
			I1 => state(56+i),
			I2 => state(60+i),
			I3 => XORin(0+i),
			I4 => '0',
			I5 => '1',
			O5 => result0(0+i),
			O6 => result1(0+i));
			
	END GENERATE;
	
--	result(15 downto 12) <= state(59 downto 56) xor state(55 downto 52) xor state(51 downto 48);
--	result(11 downto  8) <= state(63 downto 60) xor state(55 downto 52) xor state(51 downto 48);
--	result( 7 downto  4) <= state(63 downto 60) xor state(59 downto 56) xor state(51 downto 48);
--	result( 3 downto  0) <= state(63 downto 60) xor state(59 downto 56) xor state(55 downto 52);

END behavioral;

