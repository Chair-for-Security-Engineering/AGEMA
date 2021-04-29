
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity reg_masked is
	generic (
		low_latency   : integer := 1;  -- dummy
		security_order: integer := 1;  -- dummy
		pipeline      : integer := 1); -- dummy
	port (
		clk	: in  std_logic;
		D 	: in  std_logic_vector(security_order downto 0);
		Q 	: out std_logic_vector(security_order downto 0));
end reg_masked;

architecture Behavioral of reg_masked is

	component reg is
	PORT ( 
		clk 	: IN  STD_LOGIC;
		D 	: IN  STD_LOGIC;
		Q 	: OUT STD_LOGIC);
	end component;

begin 

	gen_o : for I in 0 to security_order generate
		s_reg: reg port map (clk => clk, D => D(I), Q => Q(I));
	end generate gen_o;

end Behavioral;
