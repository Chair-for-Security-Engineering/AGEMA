
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity ScanSingleFFE3 is
    Port ( clk : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           D0 : in  STD_LOGIC;
           D1 : in  STD_LOGIC;
           D2 : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end ScanSingleFFE3;

architecture Behavioral of ScanSingleFFE3 is
 
 signal DQ : STD_LOGIC;

begin
	
	LUTINST : LUT5 generic map (INIT => X"F0F0CCAA")
	port map (
		I0 => D0,
		I1 => D1,
		I2 => D2,
		I3 => s0,
		I4 => s1,
		O  => DQ);

	process(clk, DQ) 
	begin
		if rising_edge(clk) then
			Q <= DQ;
		end if;
	end process; 

end Behavioral;

