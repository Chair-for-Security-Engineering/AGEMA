
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY buf_clk IS
	PORT ( C : IN  STD_LOGIC;
	       D : IN  STD_LOGIC;
	       Q : OUT STD_LOGIC);
END buf_clk;

ARCHITECTURE behavioral OF buf_clk IS
	SIGNAL s_current_state, s_next_state : STD_LOGIC:= '0';
	
BEGIN

	s_next_state <= D;

	reg_gen: PROCESS(C, s_next_state)
	BEGIN
		IF RISING_EDGE(C) THEN
			s_current_state <= s_next_state;
		END IF;
	END PROCESS;		

	Q 		<= s_current_state;
	
END;
