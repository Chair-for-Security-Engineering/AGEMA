
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY reg IS
	PORT ( clk 	: IN  STD_LOGIC;
			 D 	: IN  STD_LOGIC;
			 Q 	: OUT  STD_LOGIC);
END reg;

ARCHITECTURE behavioral OF reg IS
	SIGNAL s_current_state, s_next_state : STD_LOGIC:= '0';
	
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
