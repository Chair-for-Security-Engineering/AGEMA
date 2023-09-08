
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY Midori64_Controller IS
    PORT ( clk : IN  STD_LOGIC;
			  reset : IN  STD_LOGIC;
			  round : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
			  roundStart_Select : OUT STD_LOGIC;
			  done : OUT STD_LOGIC);
end Midori64_Controller;

ARCHITECTURE behavioral OF Midori64_Controller IS	

	COMPONENT counter4Bit IS
		PORT ( clk     : IN STD_LOGIC;
				 reset   : IN STD_LOGIC;
				 q       : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
	END COMPONENT;
	
	SIGNAL counter_round : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN
	-- PORT MAPPING
	roundCounter: counter4Bit
		PORT MAP ( clk       => clk,
					  reset 	   => reset,
					  q         => counter_round);
					  
	round <= counter_round;
	
	roundStart_Select <= reset;
	
	done <= '1' when (counter_round = "1111") else '0';

END behavioral;

