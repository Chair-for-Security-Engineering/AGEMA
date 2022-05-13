library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;
library work;
use work.Functions.all;

entity StateUpdate is
    GENERIC(Tweakey : POSITIVE);
    Port ( FSM       : in  STD_LOGIC_VECTOR (5 downto 0);
           FSMUpdate : out  STD_LOGIC_VECTOR (5 downto 0));
end StateUpdate;

architecture Behavioral of StateUpdate is
begin

	GEN :
	FOR i IN 0 TO 5 GENERATE
		StateUpdateInst: ENTITY work.LookUp
		GENERIC Map (size => 6, Table => MakeStateUpdateTable(Tweakey, i))
		PORT Map (FSM, FSMUpdate(i));
	END GENERATE;

end Behavioral;

