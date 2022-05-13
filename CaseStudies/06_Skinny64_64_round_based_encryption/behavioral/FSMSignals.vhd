library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.Functions.all;

entity FSMSignals is
    GENERIC(Tweakey : POSITIVE);
    Port ( FSM   		: in   STD_LOGIC_VECTOR (5 downto 0);
			  done  		: out  STD_LOGIC);
end FSMSignals;

architecture Behavioral of FSMSignals is
begin

	
	doneInst: ENTITY work.LookUp
	GENERIC Map (size => 6, Table => MakeSignaldoneTable (Tweakey))
	PORT Map (FSM, done);


end Behavioral;

