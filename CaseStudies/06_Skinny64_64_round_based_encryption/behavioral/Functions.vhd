library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

package Functions is

	
		
	function MakeStateUpdate (Tweakey    : POSITIVE;
		                       FSM  	  	  : STD_LOGIC_VECTOR (5 DOWNTO 0))
		return STD_LOGIC_VECTOR ;		

	function MakeStateUpdateTable ( Tweakey    : POSITIVE; BitNumber : NATURAL)
		return STD_LOGIC_VECTOR;


	function MakeSignaldoneTable( Tweakey    : POSITIVE)
		return STD_LOGIC_VECTOR ;
		
		
	function MakeLFSRTweakey (Tweakey    : POSITIVE;
		LFSR  	  	  : STD_LOGIC_VECTOR (3 DOWNTO 0))
		return STD_LOGIC_VECTOR;
		
   
	function MakeLFSRUpdateTable ( Tweakey    : POSITIVE; BitNumber : NATURAL)
		return STD_LOGIC_VECTOR;

 
end Functions;

package body Functions is	

	
	function MakeStateUpdate ( Tweakey    : POSITIVE;
		                        FSM  	  	  : STD_LOGIC_VECTOR (5 DOWNTO 0))
										
		return STD_LOGIC_VECTOR is
		variable FSMUpdate : STD_LOGIC_VECTOR (5 DOWNTO 0);
		variable Noten   : STD_LOGIC;
	
	begin
	
	
	if (Tweakey = 1) then
	
	  if (FSM = "100011") then
				FSMUpdate(0) := FSM(0);
				FSMUpdate(1) := FSM(1);
				FSMUpdate(2) := FSM(2);
				FSMUpdate(3) := FSM(3);
				FSMUpdate(4) := FSM(4);
				FSMUpdate(5) := FSM(5);
			else
			   FSMUpdate(0) := FSM(5) XNOR FSM(4);
				FSMUpdate(1) := FSM(0);
				FSMUpdate(2) := FSM(1);
				FSMUpdate(3) := FSM(2);
				FSMUpdate(4) := FSM(3);
				FSMUpdate(5) := FSM(4);
				
			end if;
		
	end if;
		
	if(Tweakey = 2) then
		
		 if (FSM = "110110") then
				FSMUpdate(0) := FSM(0);
				FSMUpdate(1) := FSM(1);
				FSMUpdate(2) := FSM(2);
				FSMUpdate(3) := FSM(3);
				FSMUpdate(4) := FSM(4);
				FSMUpdate(5) := FSM(5);
			else
			   FSMUpdate(0) := FSM(5) XNOR FSM(4);
				FSMUpdate(1) := FSM(0);
				FSMUpdate(2) := FSM(1);
				FSMUpdate(3) := FSM(2);
				FSMUpdate(4) := FSM(3);
				FSMUpdate(5) := FSM(4);
			end if;	
	end if;
	
   if (Tweakey = 3) then
			
			if (FSM = "101001") then
				FSMUpdate(0) := FSM(0);
				FSMUpdate(1) := FSM(1);
				FSMUpdate(2) := FSM(2);
				FSMUpdate(3) := FSM(3);
				FSMUpdate(4) := FSM(4);
				FSMUpdate(5) := FSM(5);
			else
			   FSMUpdate(0) := FSM(5) XNOR FSM(4);
				FSMUpdate(1) := FSM(0);
				FSMUpdate(2) := FSM(1);
				FSMUpdate(3) := FSM(2);
				FSMUpdate(4) := FSM(3);
				FSMUpdate(5) := FSM(4);
			end if;	
   end if;
  
	  return FSMUpdate;
	end MakeStateUpdate;	
	
	--------------------------------------

	function MakeStateUpdateTable (Tweakey    : POSITIVE; BitNumber : NATURAL)
		return STD_LOGIC_VECTOR is
		variable FSMUpdateTable : STD_LOGIC_VECTOR (63 DOWNTO 0);
		variable FSMUpdate      : STD_LOGIC_VECTOR (5  DOWNTO 0);
		variable i   : NATURAL;
	begin
		for i in 0 to 63 loop
			FSMUpdate := MakeStateUpdate(Tweakey, std_logic_vector(to_unsigned(i,6)));
			FSMUpdateTable(63-i) := FSMUpdate(BitNumber);
		end loop;
	  return FSMUpdateTable;
	end MakeStateUpdateTable;	

	---------------------------------------

	function MakeSignaldone (Tweakey    : POSITIVE;
		FSM  	  	  : STD_LOGIC_VECTOR (5 DOWNTO 0))
		return STD_LOGIC is
		variable done : STD_LOGIC;
	begin
		
		if(Tweakey = 1) then
			IF (FSM = "110001") THEN
					done := '1';
				ELSE 
					done := '0';
				END IF;	
		end if;
		
		if(Tweakey = 2) then
			IF (FSM = "011011") THEN
				done := '1';
			ELSE 
				done := '0';
			END IF;	
		end if;

		if(Tweakey = 3) then
			IF (FSM = "110100") THEN
				done := '1';
			ELSE 
				done := '0';
			END IF;		
		end if;
			
		
		return done;
	end MakeSignaldone;	


	-----------------------------------------

	function MakeSignaldoneTable (Tweakey    : POSITIVE)
		return STD_LOGIC_VECTOR is
		variable doneTable : STD_LOGIC_VECTOR (63 DOWNTO 0);
		variable i   : NATURAL;
	begin
		for i in 0 to 63 loop
			doneTable(63-i) := MakeSignaldone(Tweakey,std_logic_vector(to_unsigned(i,6)));
		end loop;
	  return doneTable;
	end MakeSignaldoneTable;	
	
  ------------------------------------------	

	function MakeLFSRTweakey (Tweakey    : POSITIVE;
		                       LFSR  	  	 : STD_LOGIC_VECTOR (3 DOWNTO 0))
		return STD_LOGIC_VECTOR is
		variable LFSRUpdate : STD_LOGIC_VECTOR (3 DOWNTO 0);
		
	begin
		
		if(Tweakey = 2) then

			LFSRUpdate(0) := LFSR(3) XOR LFSR(2);
			LFSRUpdate(1) := LFSR(0);
			LFSRUpdate(2) := LFSR(1);
			LFSRUpdate(3) := LFSR(2);
		else
		   
			LFSRUpdate(0) := LFSR(1);
			LFSRUpdate(1) := LFSR(2);
			LFSRUpdate(2) := LFSR(3);
			LFSRUpdate(3) := LFSR(3) XOR LFSR(0);
		   
		end if;
		
	  return LFSRUpdate;
	end MakeLFSRTweakey;	
	
	
	------------------------------------------------------

	function MakeLFSRUpdateTable ( Tweakey    : POSITIVE; BitNumber : NATURAL)
		return STD_LOGIC_VECTOR is
		variable LFSRUpdateTable : STD_LOGIC_VECTOR (15 DOWNTO 0);
		variable LFSRUpdate      : STD_LOGIC_VECTOR (3  DOWNTO 0);
		variable i   : NATURAL;
	begin
		for i in 0 to 15 loop
			LFSRUpdate := MakeLFSRTweakey(Tweakey,std_logic_vector(to_unsigned(i,4)));
			LFSRUpdateTable(15-i) := LFSRUpdate(BitNumber);
		end loop;
	  return LFSRUpdateTable;
	end MakeLFSRUpdateTable;	


end Functions;

