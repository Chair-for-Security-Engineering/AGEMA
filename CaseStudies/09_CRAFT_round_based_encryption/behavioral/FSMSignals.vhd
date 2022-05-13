

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSMSignals is
	Generic (withDec : integer);
    Port ( FSM   		: in   STD_LOGIC_VECTOR (6 downto 0);
           EncDec		: in   STD_LOGIC;
			  notEncDec : in   STD_LOGIC;
			  done  		: out  STD_LOGIC);
end FSMSignals;

architecture Behavioral of FSMSignals is

	signal FSMdone : STD_LOGIC_VECTOR (6 downto 0);
	
begin

	GenwithoutDec: IF withDec = 0 GENERATE
		FSMdone <=  "1000101";
	END GENERATE;

	GenwithDec: IF withDec /= 0 GENERATE
		FSMdone <= notEncDec & "00" & EncDec & notEncDec & "01";
	END GENERATE;

	done <= '1' WHEN (FSM = FSMdone) ELSE '0';
	
end Behavioral;

