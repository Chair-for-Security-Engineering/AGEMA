library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX is
	generic (size: integer);
	port(
		S	: in  std_logic;
		D0	: in  std_logic_vector(size - 1 downto 0);
		D1	: in  std_logic_vector(size - 1 downto 0);
		Q	: out std_logic_vector(size - 1 downto 0)
		);

end entity MUX;


architecture dfl of MUX is
begin

	gen_mux:
	FOR i in 0 to size-1 GENERATE
	mux_inst: entity work.MUX_1bit
	port map(
		S  => S,
		D0 => D0(i),
		D1 => D1(i),
		Q  => Q(i));
	END GENERATE;

end architecture;
