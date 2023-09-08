-- D-Flip-Flop lightweight
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MC is
        port(
                input       : in std_logic_vector(31 downto 0);
                output      : out std_logic_vector(31 downto 0)
                );

end entity MC;

architecture dfl of MC is


component MC1Col is
        port(
                input       : in std_logic_vector(31 downto 0);
                output      : out std_logic_vector(7 downto 0)
                );

end component MC1Col;


   signal S0,S1,S2,S3 : std_logic_vector(7 downto 0);
   signal newS0,newS1,newS2,newS3 : std_logic_vector(7 downto 0);
   signal inLine0,inLine1,inLine2,inLine3 : std_logic_vector(31 downto 0);

begin

---------------------------------------------------------------------
-- | S0 | S1 | S2 | S3 |
---------------------------------------------------------------------
S0 <= input(31 downto 24);
S1 <= input(23 downto 16);
S2 <= input(15 downto 8);
S3 <= input(7 downto 0);

inLine0 <= S0&S1&S2&S3;
inLine1 <= S1&S2&S3&S0;
inLine2 <= S2&S3&S0&S1;
inLine3 <= S3&S0&S1&S2;

line0: MC1Col
port map(
	input => inLine0,
	output => newS0
	);
	
line1: MC1Col
port map(
	input => inLine1,
	output => newS1
	);
	
line2: MC1Col
port map(
	input => inLine2,
	output => newS2
	);
	
line3: MC1Col
port map(
	input => inLine3,
	output => newS3
	);


output <= newS0&newS1&newS2&newS3; 


end architecture dfl;