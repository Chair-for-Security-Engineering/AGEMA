

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY TweakPermutation IS
	GENERIC ( size: POSITIVE);
	PORT ( state  : IN  STD_LOGIC_VECTOR (size*16-1 DOWNTO 0);
			 result : OUT STD_LOGIC_VECTOR (size*16-1 DOWNTO 0));
END TweakPermutation;

ARCHITECTURE behavioral OF TweakPermutation IS

	signal s0, s1, s2, s3     : STD_LOGIC_VECTOR (size-1 DOWNTO 0);
	signal s4, s5, s6, s7     : STD_LOGIC_VECTOR (size-1 DOWNTO 0);
	signal s8, s9, s10, s11   : STD_LOGIC_VECTOR (size-1 DOWNTO 0);
	signal s12, s13, s14, s15 : STD_LOGIC_VECTOR (size-1 DOWNTO 0);

BEGIN

	s0	 <= state(size*16-1  downto  size*15);
	s1	 <= state(size*15-1  downto  size*14);
	s2	 <= state(size*14-1  downto  size*13);
	s3	 <= state(size*13-1  downto  size*12);
	s4	 <= state(size*12-1  downto  size*11);
	s5	 <= state(size*11-1  downto  size*10);
	s6	 <= state(size*10-1  downto  size*9);
	s7	 <= state(size*9-1   downto  size*8);
	s8	 <= state(size*8-1   downto  size*7);
	s9	 <= state(size*7-1   downto  size*6);
	s10 <= state(size*6-1   downto  size*5);
	s11 <= state(size*5-1   downto  size*4);
	s12 <= state(size*4-1   downto  size*3);
	s13 <= state(size*3-1   downto  size*2);
	s14 <= state(size*2-1   downto  size*1);
	s15 <= state(size*1-1   downto  size*0);

	result <= s12 & s10 & s15 & s5 & s14 & s8 & s9 & s2 & s11 & s3 & s7 & s4 & s6 & s0 & s1 & s13;
	
END behavioral;

