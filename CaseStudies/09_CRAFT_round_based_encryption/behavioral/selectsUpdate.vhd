

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity selectsUpdate is
	Port ( selects   		: in  STD_LOGIC_VECTOR (1 downto 0);
			 EncDec	  		: in  STD_LOGIC;
          selectsNext 	: out STD_LOGIC_VECTOR (1 downto 0));
end selectsUpdate;

architecture Behavioral of selectsUpdate is
begin

	selectsNext(0)		<= NOT selects(0);
	
	selectsNext(1)		<= selects(1) XOR selects(0) XOR EncDec;

end Behavioral;

