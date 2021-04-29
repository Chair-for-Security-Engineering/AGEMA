
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity xor_GHPC is
	generic (
		low_latency    : integer := 1;  -- dummy
		pipeline       : integer := 1); -- dummy
	port (
		a 		: in  std_logic_vector(1 downto 0);
		b 		: in  std_logic_vector(1 downto 0);
		c 		: out std_logic_vector(1 downto 0));
end xor_GHPC;

architecture Behavioral of xor_GHPC is

	component xor_2 is
	PORT ( 
		a 	: IN  STD_LOGIC;
		b 	: IN  STD_LOGIC;
		c 	: OUT STD_LOGIC);
	end component;

begin 

	gen_o : for I in 0 to 1 generate
		Ins: xor_2 port map (a => a(I), b => b(I), c => c(I));
	end generate;

end Behavioral;
