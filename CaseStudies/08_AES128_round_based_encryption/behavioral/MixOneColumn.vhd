
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MixOneColumn is
    Port ( input  : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC_VECTOR (31 downto 0));
end MixOneColumn;

architecture Behavioral of MixOneColumn is
	
	COMPONENT Mul2 is
			Port ( input  : in  STD_LOGIC_VECTOR (7 downto 0);
					 output : out STD_LOGIC_VECTOR (7 downto 0));
	end COMPONENT;	
	
	type 		ByteType is array(0 to 3) of std_logic_vector(7 downto 0);
	signal	InBytes    : ByteType;
	signal	DoubleBytes: ByteType;
	signal 	OutBytes   : ByteType;
	
begin

	GenInBytes:
	for i in 0 to 3 generate
			InBytes(i) <= input(((4-i)*8-1) downto ((3-i)*8));
	end generate GenInBytes;

	GenMul2:
	for i in 0 to 3 generate
		Mul2Inst: Mul2
		port map(
			input    => InBytes(i),	
			output   => DoubleBytes(i)
			);
	end generate GenMul2;
	
	CalculateOutBytes:
	for i in 0 to 3 generate
		OutBytes(i) <= DoubleBytes(i) xor DoubleBytes((i+1) mod 4) xor InBytes((i+1) mod 4) xor InBytes((i+2) mod 4) xor InBytes((i+3) mod 4);
	end generate CalculateOutBytes;
	
	GenOutBytes:
	for i in 0 to 3 generate
			output(((4-i)*8-1) downto ((3-i)*8)) <= OutBytes(i);
	end generate GenOutBytes;


end Behavioral;

