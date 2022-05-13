

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- withTweak : 0/1 (whether 64-bit Tweak is taken into account)
-- withDec   : 0/1 (whether both encryption and decryption should be realzied)

entity Cipher is
	 Generic ( 
		withTweak : integer := 0;
		withDec   : integer := 0);
    Port ( 
		clk 			: in  STD_LOGIC;
      rst 			: in  STD_LOGIC;
		EncDec		: in  STD_LOGIC := '0';  -- 0: encryption  1: decryption
      Input			: in  STD_LOGIC_VECTOR ( 63 downto 0);
      Key 			: in  STD_LOGIC_VECTOR (127 downto 0);
		Tweak       : in  STD_LOGIC_VECTOR ( 63 downto 0) := (others => '0');
      Output 		: out STD_LOGIC_VECTOR ( 63 downto 0);
      done 			: out STD_LOGIC);
end Cipher;

architecture Behavioral of Cipher is

	-------------------------------

	signal StateRegOutput						: STD_LOGIC_VECTOR(63 downto 0);
	signal RoundConstant							: STD_LOGIC_VECTOR(7  downto 0);
	signal AddRoundKeyOutput					: STD_LOGIC_VECTOR(63 downto 0);
	signal PermutationOutput					: STD_LOGIC_VECTOR(63 downto 0);
	signal MCInput			 						: STD_LOGIC_VECTOR(63 downto 0);
	signal MCOutput								: STD_LOGIC_VECTOR(63 downto 0);
	signal Feedback								: STD_LOGIC_VECTOR(63 downto 0);
	signal RoundKey								: STD_LOGIC_VECTOR(63 downto 0);
	signal K0										: STD_LOGIC_VECTOR(63 downto 0);
	signal K1										: STD_LOGIC_VECTOR(63 downto 0);
	signal Tweak_Q									: STD_LOGIC_VECTOR(63 downto 0);
	
	signal SelectedKey							: STD_LOGIC_VECTOR(63 downto 0);
	signal SelectedTweak							: STD_LOGIC_VECTOR(63 downto 0);
	signal SelectedTweakKey						: STD_LOGIC_VECTOR(63 downto 0);
	signal SelectedTweakKeyMC					: STD_LOGIC_VECTOR(63 downto 0);
	
	signal FSM										: STD_LOGIC_VECTOR(6  downto 0);
	signal FSMInitial								: STD_LOGIC_VECTOR(6  downto 0);
	signal FSMUpdate								: STD_LOGIC_VECTOR(6  downto 0);
	signal FSMReg									: STD_LOGIC_VECTOR(6  downto 0);

	signal notEncDec								: STD_LOGIC;
	signal selects									: STD_LOGIC_VECTOR(1  downto 0);
	signal selectsReg								: STD_LOGIC_VECTOR(1  downto 0);
	signal selectsInitial						: STD_LOGIC_VECTOR(1  downto 0);
	signal selectsNext							: STD_LOGIC_VECTOR(1  downto 0);
	signal sel_Key									: STD_LOGIC;
	signal sel_Tweak								: STD_LOGIC;
	signal done_internal							: STD_LOGIC;
	
begin

	InputMUX: ENTITY work.MUX
	GENERIC Map ( size => 64)
	PORT Map ( 
		sel	=> rst,
		D0   	=> Feedback,
		D1 	=> Input,
		Q 		=> MCInput);

	MCInst: ENTITY work.MC
	GENERIC Map ( size => 4)
	PORT Map (
		state		=> MCInput,
		result	=> MCOutput);
	
	AddKeyXOR1: ENTITY work.XOR_2n
	GENERIC Map ( size => 4, count => 4)
	PORT Map ( MCOutput(63 downto 48), RoundKey(63 downto 48), AddRoundKeyOutput(63 downto 48));

	AddKeyConstXOR: ENTITY work.XOR_3n
	GENERIC Map ( size => 4, count => 2)
	PORT Map ( MCOutput(47 downto 40), RoundKey(47 downto 40), RoundConstant, AddRoundKeyOutput(47 downto 40));

	AddKeyXOR2: ENTITY work.XOR_2n
	GENERIC Map ( size => 4, count => 10)
	PORT Map ( MCOutput(39 downto 0), RoundKey(39 downto 0), AddRoundKeyOutput(39 downto 0));

	StateReg: ENTITY work.reg
	GENERIC Map ( size => 64)
	PORT Map ( 
		clk	=> clk,
		D 		=> AddRoundKeyOutput,
		Q 		=> StateRegOutput);

	PermutationInst: ENTITY work.Permutation
	GENERIC Map ( size => 4)
	PORT Map (
		state		=> StateRegOutput,
		result	=> PermutationOutput);

	SubCellInst: ENTITY work.Sboxes
	GENERIC Map ( count => 16)
	PORT Map (
		input 	=> PermutationOutput,
		output	=> Feedback);

	--===================================================

	K0 	<= Key (127 DOWNTO 64);
	K1 	<= Key (63  DOWNTO 0);

	KeyMUX: ENTITY work.MUX
	GENERIC Map ( size => 64)
	PORT Map ( 
		sel	=> sel_Key,
		D0   	=> K0,
		D1 	=> K1,
		Q 		=> SelectedKey);

	GenwithoutTweak: IF withTweak = 0 GENERATE
		SelectedTweakKey <= SelectedKey;
	END GENERATE;	

	GenwithTweak: IF withTweak /= 0 GENERATE
		Tweak_QInst: ENTITY work.TweakPermutation 
		GENERIC Map (size => 4)
		PORT Map (Tweak, Tweak_Q);

		TweakMUX: ENTITY work.MUX
		GENERIC Map ( size => 64)
		PORT Map ( 
			sel	=> sel_Tweak,
			D0   	=> Tweak,
			D1 	=> Tweak_Q,
			Q 		=> SelectedTweak);
			
		SelectedTweakKey <= SelectedKey XOR SelectedTweak;
	END GENERATE;
	
	-------

	GenwithoutDecKey: IF withDec = 0 GENERATE
		RoundKey		<= SelectedTweakKey;	
	END GENERATE;
	
	GenwithDecKey: IF withDec /= 0 GENERATE
		KeyMCInst: ENTITY work.MC
		GENERIC Map ( size => 4)
		PORT Map (
			state		=> SelectedTweakKey,
			result	=> SelectedTweakKeyMC);

		EncDecKeyMUX: ENTITY work.MUX
		GENERIC Map ( size => 32)
		PORT Map ( 
			sel	=> EncDec,
			D0   	=> SelectedTweakKey  (63 downto 32),
			D1 	=> SelectedTweakKeyMC(63 downto 32),
			Q 		=> RoundKey     (63 downto 32));	

		RoundKey(31 downto 0) <= SelectedTweakKey(31 downto 0);	
	END GENERATE;
	
	-------------------------------------
	
	RoundConstant	<= FSM(6 downto 3) & '0' & FSM(2 downto 0);
	
	GenwithoutDecFSM: IF withDec = 0 GENERATE
		FSMInitial 		<= "0001001";
	END GENERATE;	

	GenwithDecFSM: IF withDec /= 0 GENERATE
		notEncDec		<= not EncDec;
		FSMInitial 		<= EncDec & "00" & notEncDec & EncDec & "01";
	END GENERATE;
	
	FSMMUX: ENTITY work.MUX
	GENERIC Map ( size => 7)
	PORT Map ( 
		sel	=> rst,
		D0   	=> FSMReg,
		D1 	=> FSMInitial,
		Q 		=> FSM);
		
	FSMUpdateInst: ENTITY work.StateUpdate
	GENERIC Map (withDec)
	PORT Map (FSM, EncDec, FSMUpdate);

	FSMRegInst: ENTITY work.reg
	GENERIC Map ( size => 7)
	PORT Map ( 
		clk	=> clk,
		D 		=> FSMUpdate,
		Q 		=> FSMReg);
	
	FSMSignalsInst: ENTITY work.FSMSignals
	GENERIC Map (withDec)
	PORT Map (FSM, EncDec, notEncDec, done_internal);

	----
	
	sel_Key		<= selects(0);
	sel_Tweak	<= selects(1);
	
	selectsInitial <= EncDec & EncDec;
	
	selectsMUX: ENTITY work.MUX
	GENERIC Map ( size => 2)
	PORT Map ( 
		sel	=> rst,
		D0   	=> selectsReg,
		D1 	=> selectsInitial,
		Q 		=> selects);
		
	selectsUpdateInst: ENTITY work.selectsUpdate
	PORT Map (selects, EncDec, selectsNext);

	selectsRegInst: ENTITY work.reg
	GENERIC Map ( size => 2)
	PORT Map ( 
		clk	=> clk,
		D 		=> selectsNext,
		Q 		=> selectsReg);
	
	----------------

	Output	<= StateRegOutput;

	done_reg: PROCESS(clk, done_internal)
	BEGIN
		IF RISING_EDGE(clk) THEN
			done		<= done_internal;	
		END IF;
	END PROCESS;

end Behavioral;

