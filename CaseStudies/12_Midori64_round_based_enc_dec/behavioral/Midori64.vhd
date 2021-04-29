
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Midori64 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (63 DOWNTO 0);
           output : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0);
			  key : in  STD_LOGIC_VECTOR (127 DOWNTO 0);
			  enc_dec : in  STD_LOGIC;
			  done : OUT STD_LOGIC);
end Midori64;

architecture Behavioral of Midori64 is
	COMPONENT key_Derivation IS
		PORT ( key : IN STD_LOGIC_VECTOR (127 DOWNTO 0);
				 wk, k_0, k_1: OUT STD_LOGIC_VECTOR (63 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT Midori64_Controller IS
		PORT ( clk : IN  STD_LOGIC;
				 reset : IN  STD_LOGIC;
				 round : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
				 roundStart_Select : OUT STD_LOGIC;
				 done : OUT STD_LOGIC);
	end COMPONENT;
	
	COMPONENT Midori64_RoundBased IS
		PORT ( input: IN STD_LOGIC_VECTOR (63 DOWNTO 0);
				 wk : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
				 k_0 : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
				 k_1 : IN STD_LOGIC_VECTOR (63 DOWNTO 0);
				 output : OUT STD_LOGIC_VECTOR (63 DOWNTO 0);
				 round : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
				 enc_dec : IN STD_LOGIC;
				 roundStart_Select : IN STD_LOGIC;
				 clk : IN STD_LOGIC);
	END COMPONENT;
	
	SIGNAL wk, k_0, k_1, output_Midori64 : STD_LOGIC_VECTOR (63 DOWNTO 0);
	SIGNAL round_Signal : STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL roundStart_Select_Signal, done_Controller, RegEnable : STD_LOGIC;

begin
		-- PORT MAPPING
		keys: key_Derivation
			PORT MAP ( key => key,
						  wk  => wk,
						  k_0 => k_0,
						  k_1 => k_1);
						  
		controller: Midori64_Controller
		PORT MAP ( clk => clk,
				  reset => reset,
				  round => round_Signal,
				  roundStart_Select => roundStart_Select_Signal,
				  done => done_Controller);
						  
		Midori: Midori64_RoundBased
			PORT MAP ( input => input,
						  wk  => wk,
						  k_0 => k_0,
						  k_1 => k_1,
						  output => output_Midori64,
						  round => round_Signal,
						  enc_dec => enc_dec,
						  roundStart_Select => roundStart_Select_Signal,
						  clk => clk);
						  
	output <= output_Midori64;
	done   <= done_Controller;

end Behavioral;

