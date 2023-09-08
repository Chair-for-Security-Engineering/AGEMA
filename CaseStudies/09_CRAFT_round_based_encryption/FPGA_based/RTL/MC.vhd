

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY MC IS
	GENERIC ( size: POSITIVE);
	PORT ( state  : IN  STD_LOGIC_VECTOR (size*16-1 DOWNTO 0);
			 result : OUT STD_LOGIC_VECTOR (size*16-1 DOWNTO 0));
END MC;

ARCHITECTURE behavioral OF MC IS	

	signal r0, r1, r2, r3 : STD_LOGIC_VECTOR (size*4-1 DOWNTO 0); -- input  rows
	signal o0, o1, o2, o3 : STD_LOGIC_VECTOR (size*4-1 DOWNTO 0); -- output rows

BEGIN

	r0	 <= state(size*16-1  downto  size*12);
	r1	 <= state(size*12-1  downto  size*8);
	r2	 <= state(size*8-1   downto  size*4);
	r3	 <= state(size*4-1   downto  size*0);

	------------------------------------------
	
	GEN :
	FOR i IN 0 TO size*4-1 GENERATE
		XOR_r0_Inst: ENTITY work.XOR_3
		PORT Map (r0(i), r2(i), r3(i), o0(i));
		
		XOR_r1_Inst: ENTITY work.XOR_2
		PORT Map (r1(i), r3(i), o1(i));

		o2(i) <= r2(i);
		o3(i) <= r3(i);
	END GENERATE;

	result <= o0 & o1 & o2 & o3;

END behavioral;

