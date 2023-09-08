library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX_1bit is
	port(
		S	: in  std_logic;
		D0	: in  std_logic;
		D1	: in  std_logic;
		Q	: out std_logic);

end entity MUX_1bit;


architecture dfl of MUX_1bit is
begin

	Q <= D0 WHEN S = '0' ELSE D1;

end architecture;
