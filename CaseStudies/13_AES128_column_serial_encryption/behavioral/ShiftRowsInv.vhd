
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRowsInv is
    Port ( input  : in  STD_LOGIC_VECTOR (127 downto 0);
           output : out STD_LOGIC_VECTOR (127 downto 0));
end ShiftRowsInv;

architecture Behavioral of ShiftRowsInv is

	type WordType is array(0 to 15) of std_logic_vector(7 downto 0);
	
	signal	InWords	: WordType;
	signal	OutWords : WordType;

begin
	
	GenInWords:
	for i in 0 to 15 generate
			InWords(i) <= input (((16-i)*8-1) downto ((15-i)*8));
	end generate GenInWords;
	
	OutWords(0)  <= InWords(0);
	OutWords(4)  <= InWords(4);
	OutWords(8)  <= InWords(8);
	OutWords(12) <= InWords(12);
	
	OutWords(5)  <= InWords(1);
	OutWords(9)  <= InWords(5);
	OutWords(13)  <= InWords(9);
	OutWords(1) <= InWords(13);

	OutWords(10)  <= InWords(2);
	OutWords(14)  <= InWords(6);
	OutWords(2) <= InWords(10);
	OutWords(6) <= InWords(14);

	OutWords(15)  <= InWords(3);
	OutWords(3)  <= InWords(7);
	OutWords(7) <= InWords(11);
	OutWords(11) <= InWords(15);

	GenOutWords:
	for i in 0 to 15 generate
		output (((16-i)*8-1) downto ((15-i)*8)) <= OutWords(i);
	end generate GenOutWords;

end Behavioral;

