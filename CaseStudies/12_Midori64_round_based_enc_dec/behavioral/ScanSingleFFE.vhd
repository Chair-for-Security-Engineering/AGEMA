
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ScanSingleFFE is
    Port ( clk : in  STD_LOGIC;
           sel : in  STD_LOGIC;
           D0 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end ScanSingleFFE;

architecture Behavioral of ScanSingleFFE is
 
 signal DQ : STD_LOGIC;

begin
	
	MUXInst: entity work.MUX_1bit
	Port Map (S => sel, D0 => D0, D1 => D1, Q => DQ);
		

	process(clk, sel, D0, D1) 
	begin
		if rising_edge(clk) then
			Q <= DQ;
		end if;
	end process; 

end Behavioral;

