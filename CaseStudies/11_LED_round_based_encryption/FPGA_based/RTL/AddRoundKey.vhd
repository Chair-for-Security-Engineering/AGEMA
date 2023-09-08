
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AddRoundKey is
    Port ( IN_cipherstate   : in  STD_LOGIC_VECTOR (63 downto 0);
           IN_roundkey      : in  STD_LOGIC_VECTOR (63 downto 0);
           OUT_cipherstate  : out STD_LOGIC_VECTOR (63 downto 0));
end AddRoundKey;

architecture Behavioral of AddRoundKey is

begin

  OUT_cipherstate <= IN_cipherstate xor IN_roundkey;

end Behavioral;

