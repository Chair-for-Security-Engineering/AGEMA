
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

USE ieee.numeric_std.ALL;

entity KeyExpansion is
    Port ( input  		: in  STD_LOGIC_VECTOR (127 downto 0);
			  SubBytesIn 	: out STD_LOGIC_VECTOR (31  downto 0);
			  SubBytesOut 	: in  STD_LOGIC_VECTOR (31  downto 0);
			  Rcon   		: in  STD_LOGIC_VECTOR (7   downto 0);
			  output 		: out STD_LOGIC_VECTOR (127 downto 0));			  
end KeyExpansion;

architecture Behavioral of KeyExpansion is
	
	type WordType is array(0 to 3) of std_logic_vector(31 downto 0);
		
	signal	InWords	: WordType;
	signal 	OutWords : WordType;
	signal	tmp		: STD_LOGIC_VECTOR(31 downto 0);
	
begin
	
	GenInWords:
	for i in 0 to 3 generate
			InWords(i) <= input(((4-i)*32-1) downto ((3-i)*32));
	end generate GenInWords;
		
	KeySchedCoreInst: entity work.KeySchedCore
	Port map(
		input			=> InWords(3),
		SubBytesIn	=> SubBytesIn,
		SubBytesOut	=> SubBytesOut,
		Rcon			=> Rcon,
		output		=> tmp);
	
	OutWords(0) <= InWords(0) xor tmp;
	
	GenXorWords:
	for i in 1 to 3 generate
				OutWords(i) <= OutWords(i-1) xor InWords(i);
	end generate GenXorWords;
		
	GenOutWords:
	for i in 0 to 3 generate
		output(((4-i)*32-1) downto ((3-i)*32)) <= OutWords(i);
	end generate GenOutWords;
	
end Behavioral;

