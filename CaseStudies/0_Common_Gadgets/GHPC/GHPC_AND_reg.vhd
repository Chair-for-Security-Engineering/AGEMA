

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;

entity GHPC_AND_reg is
	Port(
		input1	: in  std_logic;
		input2	: in  std_logic;
		clk 	: in  std_logic;
		output	: out std_logic);
end GHPC_AND_reg;

architecture Behavioral of GHPC_AND_reg is 

	signal value		: std_logic;

begin
	
	value <= input1 AND input2;
        
        reg_gen: PROCESS(clk, value)
	BEGIN
	    IF RISING_EDGE(clk) THEN
	        output <= value;
	    END IF;
   	END PROCESS;

end Behavioral;
