
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;

use work.Functions.all;
use IEEE.NUMERIC_STD.ALL;

entity LFSRUpdate is
   GENERIC ( Tweakey  : POSITIVE);
    Port ( LFSR       : in  STD_LOGIC_VECTOR (3 downto 0);
           LFSRUpdate : out  STD_LOGIC_VECTOR (3 downto 0));
end LFSRUpdate;

architecture Behavioral of LFSRUpdate is

begin

	GEN :
	FOR i IN 0 TO 3 GENERATE
		LFSRUpdateInst: ENTITY work.LookUp
		GENERIC Map (size => 4, Table => MakeLFSRUpdateTable(Tweakey, i))
		PORT Map (LFSR, LFSRUpdate(i));
	END GENERATE;


end Behavioral;

