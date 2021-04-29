-- D-Flip-Flop lightweight
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity times3 is
        port(
                input       : in std_logic_vector(7 downto 0);
                output      : out std_logic_vector(7 downto 0)
                );

end entity times3;

architecture dfl of times3 is

component times2 is
        port(
                input       : in std_logic_vector(7 downto 0);
                output      : out std_logic_vector(7 downto 0)
                );

end component times2;


        signal input2 : std_logic_vector(7 downto 0);

begin

timesTWO: times2
port map(
	input => input,
	output => input2
	);

output <= input XOR input2; 


end architecture dfl;