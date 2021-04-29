
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ClockGatingController is
	generic (
		NumberOfStages : integer := 5);
	port (
		clk      : in  std_logic;
		rst      : in  std_logic;
		GatedClk : out std_logic;
		Synch    : out std_logic);
end ClockGatingController;

architecture Behavioral of ClockGatingController is
	
	signal ShiftRegister : std_logic_vector(1 to NumberOfStages);
	signal EnableClk     : std_logic;
	signal LatchedEnable : std_logic := '0';

begin 

	reg_gen: PROCESS(clk, rst)
	BEGIN
		IF RISING_EDGE(clk) THEN
			IF (rst = '1') THEN
				ShiftRegister(1)                   <= '1';
				ShiftRegister(2 to NumberOfStages) <= (others => '0');
			ELSE
				ShiftRegister <= ShiftRegister(NumberOfStages) & ShiftRegister(1 to NumberOfStages-1);
			END IF;
		END IF;
	END PROCESS;		

	EnableClk <= ShiftRegister(NumberOfStages) OR rst;
	
	PROCESS (clk, EnableClk)
	BEGIN
		IF (clk = '0') THEN
			LatchedEnable <= EnableClk;
		END IF;
	END PROCESS;		

	GatedClk <= clk AND LatchedEnable;
	
	Synch <= (not rst) AND ShiftRegister(1);

end Behavioral;
