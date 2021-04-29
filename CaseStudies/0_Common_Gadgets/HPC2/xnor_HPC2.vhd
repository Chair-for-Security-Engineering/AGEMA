
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity xnor_HPC2 is
	generic (
		security_order : integer := 2; -- d
		pipeline       : integer := 1); -- 0/1
	port (
		a 		: in  std_logic_vector(security_order downto 0);
		b 		: in  std_logic_vector(security_order downto 0);
		c 		: out std_logic_vector(security_order downto 0));
end xnor_HPC2;

architecture Behavioral of xnor_HPC2 is

	component xnor_2 is
	PORT ( 
		a 	: IN  STD_LOGIC;
		b 	: IN  STD_LOGIC;
		c 	: OUT STD_LOGIC);
	end component;

	component xor_2 is
	PORT ( 
		a 	: IN  STD_LOGIC;
		b 	: IN  STD_LOGIC;
		c 	: OUT STD_LOGIC);
	end component;

begin 

	Ins0: xnor_2 port map (a => a(0), b => b(0), c => c(0));

	gen_o : for I in 1 to security_order generate
		Ins: xor_2 port map (a => a(I), b => b(I), c => c(I));
	end generate;

end Behavioral;
