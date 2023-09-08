


-- IMPORTS
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ScanFF3 IS
	GENERIC (SIZE : integer);
	PORT ( CLK	: IN 	STD_LOGIC;
			 S0   : IN 	STD_LOGIC;
			 S1   : IN 	STD_LOGIC;
          D0 	: IN 	STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0);
          D1	: IN 	STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0);
          D2	: IN 	STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0);
          Q 	: OUT STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0));
          --QS 	: OUT STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0));
END ScanFF3;

ARCHITECTURE Behavioral of ScanFF3 is

component ScanSingleFFE3 is
	port(
                clk  : in  std_logic;
					 s0	: in  std_logic;
					 s1	: in  std_logic;
                D0   : in  std_logic;
                D1 	: in  std_logic;
                D2 	: in  std_logic;
                Q    : out std_logic);
end component;

BEGIN
	
	GEN : FOR I IN 0 TO (SIZE-1) GENERATE	
		SFF : ScanSingleFFE3
		PORT MAP (
			clk	=> CLK,
			s0	=> S0,
			s1	=> S1,
			D0	=> D0(I),
			D1	=> D1(I),
			D2	=> D2(I),
			Q	=> Q(I));
	END GENERATE;
		
END Behavioral;


