
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- IF s = 1: c <= a, else b
entity mux2_masked is
	generic (
		low_latency    : integer := 1; -- dummy
		security_order : integer := 1; -- d
		pipeline       : integer := 1); -- 0/1
	port (
		s		: in  std_logic;
		a 		: in  std_logic_vector(security_order downto 0);
		b 		: in  std_logic_vector(security_order downto 0);
		c 		: out std_logic_vector(security_order downto 0));
end mux2_masked;

architecture Behavioral of mux2_masked is

	component Mux2 is
	PORT ( 
		sel0 	: IN  STD_LOGIC;
		D0 	: IN  STD_LOGIC;
		D1 	: IN  STD_LOGIC;
		Q 	: OUT STD_LOGIC);
	end component;

begin 

	gen_o : for I in 0 to security_order generate
		Ins: Mux2 port map (sel0 => s, D1 => a(I), D0 => b(I), Q => c(I));
	end generate;

end Behavioral;
