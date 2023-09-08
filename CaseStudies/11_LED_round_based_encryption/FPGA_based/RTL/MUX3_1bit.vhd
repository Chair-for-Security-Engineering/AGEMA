library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

entity MUX3_1bit is
	port(
		S0	: in  std_logic;
		S1	: in  std_logic;
		D0	: in  std_logic;
		D1	: in  std_logic;
		D2	: in  std_logic;
		Q	: out std_logic);

end entity MUX3_1bit;


architecture dfl of MUX3_1bit is
begin

	LUTINST : LUT5 generic map (INIT => X"F0F0CCAA")
	port map (
		I0 => D0,
		I1 => D1,
		I2 => D2,
		I3 => S0,
		I4 => S1,
		O  => Q);

end architecture;
