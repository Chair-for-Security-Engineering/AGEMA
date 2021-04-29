
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity not_masked is
	generic (
		low_latency    : integer := 1; -- dummy
		security_order : integer := 1; -- d
		pipeline       : integer := 1); -- 0/1
	port (
		a 		: in  std_logic_vector(security_order downto 0);
		b 		: out std_logic_vector(security_order downto 0));
end not_masked;

architecture Behavioral of not_masked is
begin 

	b(0) 								<= not a(0);
	b(security_order downto 1) <= a(security_order downto 1);

end Behavioral;
