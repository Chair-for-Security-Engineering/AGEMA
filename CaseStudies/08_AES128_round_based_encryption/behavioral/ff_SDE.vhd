
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE IEEE.NUMERIC_STD.ALL;

ENTITY ff_SDE IS
	PORT ( clk : IN  STD_LOGIC;
			 D0  : IN  STD_LOGIC;
			 D1  : IN  STD_LOGIC;
			 sel : IN  STD_LOGIC;
			 Q   : OUT STD_LOGIC);
END ff_SDE;

ARCHITECTURE behavioral OF ff_SDE IS
	
	SIGNAL current_state, next_state : STD_LOGIC;
	
BEGIN
	
	MUX_inst: ENTITY work.MUX_1bit
	Port Map (S => sel, D0 => D0, D1 => D1, Q => next_state);

	FLIP_FLOP: PROCESS(clk)
	BEGIN
		IF RISING_EDGE(clk) THEN
			current_state <= next_state;
		END IF;
	END PROCESS;
		
	Q <= current_state;
	
END;

