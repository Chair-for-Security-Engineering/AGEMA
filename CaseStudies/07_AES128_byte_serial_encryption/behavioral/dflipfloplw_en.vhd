-- D-Flip-Flop lightweight
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dflipfloplw_en is
        generic (NBITS: integer);
        port(
                clk     : in std_logic;
                en		: in std_logic;
					 n_reset : in std_logic;
                D       : in std_logic_vector(NBITS-1 downto 0);
                D_rst   : in std_logic_vector(NBITS-1 downto 0);
                Q       : out std_logic_vector(NBITS-1 downto 0)
                );

end entity dflipfloplw_en;

architecture dfl of dflipfloplw_en is

begin

	GEN : FOR I IN 0 TO (NBITS - 1) GENERATE	
	SFF : ENTITY work.ScanFFEN
		PORT MAP (
			CLK	=> CLK,
			EN    => en,
			SE 	=> n_reset,
			D		=> D_rst(I),
			DS		=> D(I),
			Q		=> Q(I));
	END GENERATE;

end architecture dfl;
