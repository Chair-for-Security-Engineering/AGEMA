
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Midori64_RoundBased IS
	PORT ( input: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			 wk  : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			 k_0 : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			 k_1 : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
			 output : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
			 round : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			 enc_dec : IN STD_LOGIC;
			 roundStart_Select : IN STD_LOGIC;
			 clk : IN STD_LOGIC);
END Midori64_RoundBased;

ARCHITECTURE behavioral OF Midori64_RoundBased IS
	
	COMPONENT Midori64_Round IS
		 PORT ( input : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
				  k_0 : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
				  k_1 : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
				  result : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0);
				  
				  -- CONTROLLER PORTS
				  enc_dec           : IN STD_LOGIC;
				  clk               : IN STD_LOGIC;
				  round_number      : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				  roundStart_Select : IN STD_LOGIC);
	END COMPONENT;
												  
	
	SIGNAL add_Result_Start, rounds_Output : STD_LOGIC_VECTOR (63 DOWNTO 0);
	
	BEGIN
		-- PORT MAPPING						  
		
		add_Result_Start <= input XOR wk;

		rounds : Midori64_Round
			PORT MAP ( input => add_Result_Start,
						  k_0 => k_0,
						  k_1 => k_1,
						  result => rounds_Output,
						  
						  -- CONTROLLER SIGNALS
						  enc_dec => enc_dec,
						  clk => clk,
						  round_number => round,
						  roundStart_Select => roundStart_Select);
						  
		output <= rounds_Output XOR wk;

END behavioral;

