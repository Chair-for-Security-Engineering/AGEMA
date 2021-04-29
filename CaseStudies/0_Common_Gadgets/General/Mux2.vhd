
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux2 is
	Port ( 
		sel0	: in  STD_LOGIC;
		D0		: in  STD_LOGIC;
		D1		: in  STD_LOGIC;
		Q  	: out STD_LOGIC);
end Mux2;

architecture Behavioral of Mux2 is
begin

	Q <= D0 when sel0 = '0' else D1;

end Behavioral;

------------------------------------------------------

