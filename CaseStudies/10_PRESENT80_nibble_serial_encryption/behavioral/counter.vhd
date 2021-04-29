
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
	generic(NBITS: integer);
	port(
		clk	: in std_logic;
		n_reset	: in std_logic;
		en    : in std_logic;
		q	: out std_logic_vector(NBITS - 1 downto 0)
		);

end entity counter;

architecture dfl of counter  is

	signal count_reg : unsigned(NBITS - 1 downto 0);
begin

process(clk, n_reset, en)
begin
	if(clk'event and clk = '1') then
	   if (n_reset = '0') then
		   count_reg <= (others => '0'); -- initialisation
	   elsif(en = '1') then
			count_reg <= count_reg + 1;
		end if;
	end if;
end process;

q <= std_logic_vector(count_reg);

end architecture dfl;
