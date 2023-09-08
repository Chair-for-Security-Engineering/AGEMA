library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX3 is
	generic (size: integer);
	port(
		S0	: in  std_logic;
		S1	: in  std_logic;
		D0	: in  std_logic_vector(size - 1 downto 0);
		D1	: in  std_logic_vector(size - 1 downto 0);
		D2	: in  std_logic_vector(size - 1 downto 0);
		Q	: out std_logic_vector(size - 1 downto 0)
		);

end entity MUX3;


architecture dfl of MUX3 is
begin

	gen_mux:
	FOR i in 0 to size-1 GENERATE
	mux_inst: entity work.MUX3_1bit
	port map(
		S0  => S0,
		S1  => S1,
		D0 => D0(i),
		D1 => D1(i),
		D2 => D2(i),
		Q  => Q(i));
	END GENERATE;

end architecture;
