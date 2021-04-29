
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg_SDE IS
	GENERIC ( size: POSITIVE := 128);
	PORT ( clk  : IN  STD_LOGIC;
			 D0   : IN  STD_LOGIC_VECTOR ((size-1) DOWNTO 0);
			 D1   : IN  STD_LOGIC_VECTOR ((size-1) DOWNTO 0);
			 sel  : IN  STD_LOGIC;
			 Q    : OUT STD_LOGIC_VECTOR ((size-1) DOWNTO 0));
END reg_SDE;

ARCHITECTURE behavioral OF reg_SDE IS
	
	COMPONENT ff_SDE
	PORT ( clk : IN  STD_LOGIC;
			 D0  : IN  STD_LOGIC;
			 D1  : IN  STD_LOGIC;
			 sel : IN  STD_LOGIC;
			 Q   : OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN

	gen_Reg_SDE:
	FOR i IN 0 TO size-1 GENERATE
		Inst_ff_SDE: ff_SDE
		PORT MAP (
			clk => clk,
			D0  => D0(i),
			D1  => D1(i),
			sel => sel,
			Q   => Q(i));
	END GENERATE gen_Reg_SDE;
			
END;

