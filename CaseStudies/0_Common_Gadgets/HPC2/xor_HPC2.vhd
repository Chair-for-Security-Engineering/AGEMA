
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity xor_HPC2 is
	generic (
		security_order : integer := 2; -- d
		pipeline       : integer := 1); -- 0/1
	port (
		a 		: in  std_logic_vector(security_order downto 0);
		b 		: in  std_logic_vector(security_order downto 0);
		c 		: out std_logic_vector(security_order downto 0));
end xor_HPC2;

architecture Behavioral of xor_HPC2 is

	component xor_2 is
	PORT ( 
		a 	: IN  STD_LOGIC;
		b 	: IN  STD_LOGIC;
		c 	: OUT STD_LOGIC);
	end component;

begin 

	gen_o : for I in 0 to security_order generate
		Ins: xor_2 port map (a => a(I), b => b(I), c => c(I));
	end generate;

end Behavioral;
