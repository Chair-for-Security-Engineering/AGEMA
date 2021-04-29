-- RCon computation with output gating
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RCon is
        port(
                clk       : in std_logic;
                nReset    : in std_logic;
                en        : in std_logic;
                enOut     : in std_logic;
                notFirst  : out std_logic;
					 final     : out std_logic;
                rconst    : out std_logic_vector(7 downto 0)
                );

end entity RCon;

architecture dfl of RCon is

	signal s_current_state, s_next_state, en8    : std_logic_vector(7 downto 0);
	signal MSB    : std_logic;

begin

	MSB <= s_current_state(7);
	s_next_state  <= s_current_state when en = '0' else
	s_current_state(6 downto 4)&(MSB XOR s_current_state(3))&(MSB XOR s_current_state(2))&s_current_state(1)&(MSB XOR s_current_state(0))&MSB;

	en8 <= enOut&enOut&enOut&enOut&enOut&enOut&enOut&enOut;
	rconst <= s_current_state AND en8;

	final <= (s_current_state(5) AND s_current_state(4) AND s_current_state(2) AND s_current_state(1));

	notFirst <= '0' when s_current_state = "10001101" else '1';

	FLIP_FLOP: Process(clk)
	begin
		if (clk'event AND clk = '1') then
				if (nReset = '0') then
						  s_current_state <= "10001101";
				else
						  s_current_state <= s_next_state;
				end if;
		end if;
	end process;

end architecture dfl;