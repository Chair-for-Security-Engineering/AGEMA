
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AddConstants is
    Port ( IN_cipherstate     : in  STD_LOGIC_VECTOR (63 downto 0);
           IN_keylength       : in  STD_LOGIC_VECTOR (7 downto 0);
           IN_round_constants : in  STD_LOGIC_VECTOR (5 downto 0);
           OUT_cipherstate    : out STD_LOGIC_VECTOR (63 downto 0));
end AddConstants;

architecture Behavioral of AddConstants is

begin

	OUT_cipherstate(3 downto 0) 	<= IN_cipherstate(3 downto 0)		xor "0000" xor IN_keylength(7 downto 4);
	OUT_cipherstate(19 downto 16) <= IN_cipherstate(19 downto 16)	xor "0001" xor IN_keylength(7 downto 4);
	OUT_cipherstate(35 downto 32) <= IN_cipherstate(35 downto 32)	xor "0010" xor IN_keylength(3 downto 0);
	OUT_cipherstate(51 downto 48) <= IN_cipherstate(51 downto 48)	xor "0011" xor IN_keylength(3 downto 0);
--
	OUT_cipherstate(6 downto 4) 	<= IN_cipherstate(6 downto 4)		xor IN_round_constants(5 downto 3);
	OUT_cipherstate(22 downto 20) <= IN_cipherstate(22 downto 20)	xor IN_round_constants(2 downto 0);
	OUT_cipherstate(38 downto 36) <= IN_cipherstate(38 downto 36)	xor IN_round_constants(5 downto 3);
	OUT_cipherstate(54 downto 52) <= IN_cipherstate(54 downto 52)	xor IN_round_constants(2 downto 0);
--
	OUT_cipherstate(15 downto 7) 	<= IN_cipherstate(15 downto 7);
	OUT_cipherstate(31 downto 23) <= IN_cipherstate(31 downto 23);
	OUT_cipherstate(47 downto 39) <= IN_cipherstate(47 downto 39);
	OUT_cipherstate(63 downto 55) <= IN_cipherstate(63 downto 55);

end Behavioral;

