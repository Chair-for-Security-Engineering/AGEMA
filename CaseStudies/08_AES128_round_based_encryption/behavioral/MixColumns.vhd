
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MixColumns is
    Port ( input   : in  STD_LOGIC_VECTOR (127 downto 0);
           output  : out STD_LOGIC_VECTOR (127 downto 0));
end MixColumns;

architecture Behavioral of MixColumns is
	
	COMPONENT MixOneColumn is
	Port ( input  : in  STD_LOGIC_VECTOR (31 downto 0);
			 output : out STD_LOGIC_VECTOR (31 downto 0));
	end COMPONENT;

	type ColumnWordType is array(0 to 3) of std_logic_vector(31 downto 0);
	signal	InColumns	: ColumnWordType;
	signal 	OutColumns  : ColumnWordType;

begin

	GenInWords:
	for i in 0 to 3 generate
			InColumns(i) <= input(((16-4*i)*8-1) downto ((12-4*i)*8));
	end generate GenInWords;

	GenMixColumns:
	for i in 0 to 3 generate
		MixOneColumnInst: MixOneColumn
		port map(
			input 	=> InColumns(i),	
			output 	=> OutColumns(i));
	end generate GenMixColumns;

	GenOutWords:
	for i in 0 to 3 generate
			output(((16-4*i)*8-1) downto ((12-4*i)*8)) <= OutColumns(i);
	end generate GenOutWords;

end Behavioral;

