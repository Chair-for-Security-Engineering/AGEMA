-- D-Flip-Flop lightweight
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MC1Col is
        port(
                input       : in std_logic_vector(31 downto 0);
                output      : out std_logic_vector(7 downto 0)
                );

end entity MC1Col;

architecture dfl of MC1Col is

component times2 is
        port(
                input       : in std_logic_vector(7 downto 0);
                output      : out std_logic_vector(7 downto 0)
                );

end component times2;

component times3 is
        port(
                input       : in std_logic_vector(7 downto 0);
                output      : out std_logic_vector(7 downto 0)
                );

end component times3;


   signal S0,S1,S2,S3, S02, S13 : std_logic_vector(7 downto 0);

begin

---------------------------------------------------------------------
-- | S0 | S1 | S2 | S3 |
---------------------------------------------------------------------
S0 <= input(31 downto 24);
S1 <= input(23 downto 16);
S2 <= input(15 downto 8);
S3 <= input(7 downto 0);

timesTWO: times2
port map(
	input => S0,
	output => S02
	);

timesTHREE: times3
port map(
	input => S1,
	output => S13
	);

output <= S02 XOR S13 XOR S2 XOR S3; 


end architecture dfl;