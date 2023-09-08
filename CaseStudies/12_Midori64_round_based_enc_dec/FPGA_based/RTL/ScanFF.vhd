


-- IMPORTS
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ScanFF IS
	GENERIC (SIZE : integer);
	PORT ( CLK	: IN 	STD_LOGIC;
			 SE   : IN 	STD_LOGIC;
          D  	: IN 	STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0);
          DS	: IN 	STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0);
          Q 	: OUT STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0));
          --QS 	: OUT STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0));
END ScanFF;

ARCHITECTURE Behavioral of ScanFF is

component ScanSingleFFE is
	port(
                clk  : in  std_logic;
					 sel	: in  std_logic;
                D0   : in  std_logic;
                D1 	: in  std_logic;
                Q    : out std_logic);
end component;

BEGIN
	
	GEN : FOR I IN 0 TO (SIZE-1) GENERATE	
		SFF : ScanSingleFFE
		PORT MAP (
			clk	=> CLK,
			sel	=> SE,
			D0	=> D(I),
			D1	=> DS(I),
			Q	=> Q(I));
	END GENERATE;
		
END Behavioral;


