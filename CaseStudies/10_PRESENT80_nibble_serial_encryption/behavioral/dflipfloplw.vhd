-- D-Flip-Flop lightweight
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dflipfloplw is
	generic (NBITS: integer);
	port(
		clk	: in std_logic;
		n_reset	: in std_logic;
		D	: in std_logic_vector(NBITS-1 downto 0);
		D_rst	: in std_logic_vector(NBITS-1 downto 0);
		Q	: out std_logic_vector(NBITS-1 downto 0)
		);

end entity dflipfloplw;

architecture dfl of dflipfloplw is

	signal s_current_state, s_next_state	: std_logic_vector(NBITS-1 downto 0);

begin

  	MUX_inst1: entity work.MUX
  	Generic Map (size => NBITS)
  	Port Map (S => n_reset, D0 => D_rst, D1 => D, Q => s_next_state);

	FLIP_FLOP:	Process(clk, s_next_state)
	begin
		
		if (clk'event AND clk = '1') then
			s_current_state <= s_next_state;
		end if;
	end process;

	Q <= s_current_state;

end architecture dfl;
