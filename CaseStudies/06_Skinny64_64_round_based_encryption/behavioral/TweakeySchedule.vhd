
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.Functions.all;

entity TweakeySchedule is

		GENERIC ( size  : POSITIVE;
		          Tweakey: POSITIVE);
		 Port (    clk 			   : in  STD_LOGIC;
					  rst 			   : in  STD_LOGIC;
					  Key 			   : in  STD_LOGIC_VECTOR (16*Tweakey*size-1 downto 0);
					  TweakeyOutput 	: out STD_LOGIC_VECTOR (16*(size/2)-1 downto 0));

end TweakeySchedule;

architecture Behavioral of TweakeySchedule is

	signal key_Feedback   : STD_LOGIC_VECTOR(16*Tweakey*size-1 downto 0);
	signal PermutedKey    : STD_LOGIC_VECTOR(16*Tweakey*size-1 downto 0);
	signal StateRegInput  : STD_LOGIC_VECTOR (16*Tweakey*size-1 downto 0);
	signal StateRegOutput : STD_LOGIC_VECTOR (16*Tweakey*size-1 downto 0);

begin

	

	KEYMUX: ENTITY work.MUX
			GENERIC Map ( size =>16*Tweakey*size)
			PORT Map ( 
				sel	=> rst,
				D0   	=> key_Feedback,
				D1 	=> Key,
				Q 		=> StateRegInput);
	

   
	StateReg: ENTITY work.reg
			GENERIC Map ( size => 16*Tweakey*size)
			PORT Map ( 
				clk	=> clk,
				D 		=> StateRegInput,
				Q 		=> StateRegOutput);
				
	Gen1: If Tweakey =1 GENERATE	
	
      	TweakeyOutput <= StateRegOutput (63 downto 32);
			
	END GENERATE;

	
	Gen2: If Tweakey =2 GENERATE	
	
      	AddTweakeyXOR: ENTITY work.XOR_2n  
				GENERIC Map ( size => 4, count => 8)
				PORT Map ( 
				 StateRegOutput (127 downto 96),
				 StateRegOutput (63 downto 32), 
				 TweakeyOutput);
	END GENERATE;
	
   Gen3: If Tweakey =3 GENERATE	
		
				AddTweakeyXOR: ENTITY work.XOR_3n  
					GENERIC Map ( size => 4, count => 8)
					PORT Map ( 
					 StateRegOutput (191 downto 160),
					 StateRegOutput (127 downto 96),
					 StateRegOutput (63 downto 32), 
					 TweakeyOutput);
	END GENERATE;		
				
			
	-- PERMUTATION & LFSR -------------------------------------------------------------
	Gen4:
		If Tweakey >=1 GENERATE
			-- PERMUTATION -----------------
		 Permut: ENTITY work.Permutation
			GENERIC MAP (size => size)
			PORT MAP ( StateRegOutput (16*Tweakey*size-1 downto 16*(Tweakey-1)*size),PermutedKey(16*Tweakey*size-1 downto 16*(Tweakey-1)*size));
				
			-- NO LFSR ---------------------
			key_Feedback (16*Tweakey*size-1 downto 16*(Tweakey-1)*size) <= PermutedKey (16*Tweakey*size-1 downto 16*(Tweakey-1)*size);
		END GENERATE;
		
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
	
	Gen5:
		If Tweakey =2 GENERATE
		
	-- PERMUTATION -----------------
		 Permut: ENTITY work.Permutation
			GENERIC MAP (size => size)
			PORT MAP ( StateRegOutput (16*(Tweakey-1)*size-1 downto 16*(Tweakey-2)*size),PermutedKey(16*(Tweakey-1)*size-1 downto 16*(Tweakey-2)*size));
				
	-- LFSR ---------------------
	
	Gen6:
      FOR i IN 0 TO 7 GENERATE
			LFSRUpdateInst2: ENTITY work.LFSRUpdate
			GENERIC Map (Tweakey => Tweakey) 
			PORT Map (PermutedKey(16*(Tweakey-1)*size-1-(4*i) downto 16*(Tweakey-1)*size-4-(4*i)),
			          key_Feedback(16*(Tweakey-1)*size-1-(4*i) downto 16*(Tweakey-1)*size-4-(4*i)));
	   END GENERATE;
		
		key_Feedback(16*(Tweakey-1)*size-33 downto 16*(Tweakey-1)*size-48) <= PermutedKey(16*(Tweakey-1)*size-33 downto 16*(Tweakey-1)*size-48);
	
		key_Feedback(16*(Tweakey-1)*size-49 downto 16*(Tweakey-1)*size-64) <= PermutedKey(16*(Tweakey-1)*size-49 downto 16*(Tweakey-1)*size-64);		
				
	END GENERATE;
			
--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
	
	Gen7:
		If Tweakey =3 GENERATE
		
		-- PERMUTATION -----------------
		 Permut1: ENTITY work.Permutation
			GENERIC MAP (size => size)
			PORT MAP ( StateRegOutput (16*(Tweakey-1)*size-1 downto 16*(Tweakey-2)*size),PermutedKey(16*(Tweakey-1)*size-1 downto 16*(Tweakey-2)*size));
				
	-- LFSR ---------------------
	
	Gen6:
      FOR i IN 0 TO 7 GENERATE
			LFSRUpdateInst2: ENTITY work.LFSRUpdate
			GENERIC Map (Tweakey => Tweakey-1) 
			PORT Map (PermutedKey(16*(Tweakey-1)*size-1-(4*i) downto 16*(Tweakey-1)*size-4-(4*i)),
			          key_Feedback(16*(Tweakey-1)*size-1-(4*i) downto 16*(Tweakey-1)*size-4-(4*i)));
	   END GENERATE;
		
		key_Feedback(16*(Tweakey-1)*size-33 downto 16*(Tweakey-1)*size-48) <= PermutedKey(16*(Tweakey-1)*size-33 downto 16*(Tweakey-1)*size-48);
	
		key_Feedback(16*(Tweakey-1)*size-49 downto 16*(Tweakey-1)*size-64) <= PermutedKey(16*(Tweakey-1)*size-49 downto 16*(Tweakey-1)*size-64);		
	
		
	-- PERMUTATION -----------------
		 Permut2: ENTITY work.Permutation
			GENERIC MAP (size => size)
			PORT MAP (StateRegOutput (16*(Tweakey-2)*size-1 downto 16*(Tweakey-3)*size),PermutedKey(16*(Tweakey-2)*size-1 downto 16*(Tweakey-3)*size));
				
	-- LFSR ---------------------
	
	Gen8:
	 FOR i IN 0 TO 7 GENERATE
	    LFSRUpdateInst3: ENTITY work.LFSRUpdate
			GENERIC Map (Tweakey => Tweakey) 
			PORT Map (PermutedKey(16*(Tweakey-2)*size-1-(4*i) downto 16*(Tweakey-2)*size-4-(4*i)),
			          key_Feedback(16*(Tweakey-2)*size-1-(4*i) downto 16*(Tweakey-2)*size-4-(4*i)));
	    
	 END GENERATE;
	
		key_Feedback(16*(Tweakey-2)*size-33 downto 16*(Tweakey-2)*size-48) <= PermutedKey(16*(Tweakey-2)*size-33 downto 16*(Tweakey-2)*size-48);
	
		key_Feedback(16*(Tweakey-2)*size-49 downto 16*(Tweakey-2)*size-64) <= PermutedKey(16*(Tweakey-2)*size-49 downto 16*(Tweakey-2)*size-64);		
		
	   
	 END GENERATE;

end Behavioral;

