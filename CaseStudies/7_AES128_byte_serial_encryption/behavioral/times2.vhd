-- D-Flip-Flop lightweight
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity times2 is
        port(
                input       : in std_logic_vector(7 downto 0);
                output      : out std_logic_vector(7 downto 0)
                );

end entity times2;

architecture dfl of times2 is

        signal MSB : std_logic;

begin
MSB <= input(7);

output <= input(6 downto 4)&(input(3) XOR MSB)&(input(2) XOR MSB)&input(1)&(input(0) XOR MSB)&MSB; 


end architecture dfl;