

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY reg IS
	GENERIC ( size: POSITIVE);
	PORT ( clk 	: IN  STD_LOGIC;
			 D 	: IN  STD_LOGIC_VECTOR ((size-1) DOWNTO 0);
			 Q 	: OUT  STD_LOGIC_VECTOR ((size-1) DOWNTO 0));
END reg;

ARCHITECTURE behavioral OF reg IS
	
	SIGNAL s_current_state, s_next_state : STD_LOGIC_VECTOR ((size-1) DOWNTO 0) := (others => '0');
	
BEGIN

	s_next_state <= D;

	reg_gen: PROCESS(clk, s_next_state)
	BEGIN
		IF RISING_EDGE(clk) THEN
			s_current_state <= s_next_state;
		END IF;
	END PROCESS;		

	Q 		<= s_current_state;
	
END;

