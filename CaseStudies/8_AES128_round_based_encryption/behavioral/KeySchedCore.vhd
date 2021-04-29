
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

USE ieee.numeric_std.ALL;

entity KeySchedCore is
    Port ( input 		: in  STD_LOGIC_VECTOR (31 downto 0);
           Rcon		: in  STD_LOGIC_VECTOR (7 downto 0);
			  output		: out STD_LOGIC_VECTOR (31 downto 0));
end KeySchedCore;

architecture Behavioral of KeySchedCore is
	
	COMPONENT Sbox IS
	PORT ( X     	: IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
	       Y	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
	END COMPONENT;
	
	type ByteType is array(0 to 3) of std_logic_vector(7 downto 0);
	
	signal	InBytes	: ByteType;
	signal 	OutBytes : ByteType;

begin

	GenInBytes:
	for j in 0 to 3 generate
			InBytes((j+3)mod 4) <= input(((4-j)*8-1) downto ((3-j)*8));
	end generate GenInBytes;

	GenSubBytes:
	FOR i IN 0 TO 3 GENERATE
		Inst_Sbox: Sbox
		PORT MAP (
			X => InBytes(i),
			Y => OutBytes(i));
	END GENERATE GenSubBytes;	
	
	GenOutBytes:
	for j in 0 to 3 generate
		output(((4-j)*8-1) downto ((3-j)*8)) <= (OutBytes(j) xor Rcon) when j=0 else OutBytes(j);
	end generate GenOutBytes;

end Behavioral;

