

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity StateUpdate is
	Generic (withDec : integer);
	Port ( FSM       : in  STD_LOGIC_VECTOR (6 downto 0);
			 EncDec	  : in  STD_LOGIC;
          FSMUpdate : out STD_LOGIC_VECTOR (6 downto 0));
end StateUpdate;

architecture Behavioral of StateUpdate is
begin

	GenwithoutDec: IF withDec = 0 GENERATE
		proc: process (FSM)
		begin
			FSMUpdate(0) <= FSM(1);
			FSMUpdate(1) <= FSM(2);
			FSMUpdate(2) <= FSM(0) XOR FSM(1);

			FSMUpdate(3) <= FSM(4);
			FSMUpdate(4) <= FSM(5);
			FSMUpdate(5) <= FSM(6);
			FSMUpdate(6) <= FSM(3) XOR FSM(4);
		end process;
	END GENERATE;

	------------

	GenwithDec: IF withDec /= 0 GENERATE
		proc: process (EncDec, FSM)
		begin
			IF (EncDec = '0') THEN  --- Encryption
				FSMUpdate(0) <= FSM(1);
				FSMUpdate(1) <= FSM(2);
				FSMUpdate(2) <= FSM(0) XOR FSM(1);

				FSMUpdate(3) <= FSM(4);
				FSMUpdate(4) <= FSM(5);
				FSMUpdate(5) <= FSM(6);
				FSMUpdate(6) <= FSM(3) XOR FSM(4);
			ELSE	--- Decryption
				FSMUpdate(0) <= FSM(0) XOR FSM(2);
				FSMUpdate(1) <= FSM(0);
				FSMUpdate(2) <= FSM(1);

				FSMUpdate(3) <= FSM(3) XOR FSM(6);
				FSMUpdate(4) <= FSM(3);
				FSMUpdate(5) <= FSM(4);
				FSMUpdate(6) <= FSM(5);
			END IF;
		end process;	
	END GENERATE;

end Behavioral;

