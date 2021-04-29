
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity buf_masked is
	generic (
		low_latency    : integer := 1; -- dummy
		security_order : integer := 1; -- d
		pipeline       : integer := 1); -- 0/1
	port (
		a 		: in  std_logic_vector(security_order downto 0);
		b 		: out std_logic_vector(security_order downto 0));
end buf_masked;

architecture Behavioral of buf_masked is
begin 

	b(security_order downto 0) <= a(security_order downto 0);

end Behavioral;
