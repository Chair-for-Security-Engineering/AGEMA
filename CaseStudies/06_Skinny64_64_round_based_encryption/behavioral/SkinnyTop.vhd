
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

library work;
use work.Functions.all;



entity SkinnyTop is
    Port ( clk 			: in  STD_LOGIC;
           rst 			: in  STD_LOGIC;
           Plaintext 	: in  STD_LOGIC_VECTOR (63 downto 0);
           Key 			: in  STD_LOGIC_VECTOR (63 downto 0);
           Ciphertext 	: out STD_LOGIC_VECTOR (63 downto 0);
           done 			: out STD_LOGIC);

end SkinnyTop;

architecture Behavioral of SkinnyTop is

   constant TweakeySize: POSITIVE := 1;

	signal StateRegInput 						: STD_LOGIC_VECTOR(63 downto 0);
	signal StateRegOutput						: STD_LOGIC_VECTOR(63 downto 0);
	signal SubCellOutput							: STD_LOGIC_VECTOR(63 downto 0);
	signal AddRoundConstantOutput				: STD_LOGIC_VECTOR(63 downto 0);
	signal AddRoundTweakeyOutput				: STD_LOGIC_VECTOR(63 downto 0);	
	signal ShiftRowsOutput						: STD_LOGIC_VECTOR(63 downto 0);
	signal MCOutput								: STD_LOGIC_VECTOR(63 downto 0);
	signal Feedback								: STD_LOGIC_VECTOR(63 downto 0);
	signal RoundTweakey							: STD_LOGIC_VECTOR(31 downto 0);
	signal done_internal							: STD_LOGIC;
	signal doneReg_internal						: STD_LOGIC_VECTOR(0 downto 0);
	signal FSM										: STD_LOGIC_VECTOR(5 downto 0);
	signal FSMUpdate								: STD_LOGIC_VECTOR(5 downto 0);
	signal FSMSelected							: STD_LOGIC_VECTOR(5 downto 0);

begin

	   PlaintextMUX: ENTITY work.MUX
			GENERIC Map ( size => 64)
			PORT Map ( 
				sel	=> rst,
				D0   	=> Feedback,
				D1 	=> Plaintext,
				Q 		=> StateRegInput);

		StateReg: ENTITY work.reg
			GENERIC Map ( size => 64)
			PORT Map ( 
				clk	=> clk,
				D 		=> StateRegInput,
				Q 		=> StateRegOutput);
			
		SubCellInst: ENTITY work.Sboxes
			GENERIC Map ( count => 16)
			PORT Map (
				input 	=> StateRegOutput,
				output	=> SubCellOutput);
			
		AddConstXOR: ENTITY work.RoundConstXOR 
			GENERIC Map ( size => 4)
			PORT Map ( 
			R_in0 =>SubCellOutput ,
			R_in1 =>FSM, 
			R_q => AddRoundConstantOutput);	

 
		AddRoundTweakeyXOR: ENTITY work.XOR_2n  
			GENERIC Map ( size => 4, count => 8)
			PORT Map ( 
			 AddRoundConstantOutput (63 downto 32),
			 RoundTweakey, 
			  AddRoundTweakeyOutput (63 downto 32));
		
		AddRoundTweakeyOutput (31 downto 0) <= AddRoundConstantOutput (31 downto 0);

	  	  
	   ShiftRowsInst: ENTITY work.ShiftRows
			GENERIC Map ( size => 4)
			PORT Map (
				state		=> AddRoundTweakeyOutput,
				result	=> ShiftRowsOutput);
			
		MCInst: ENTITY work.MC
			GENERIC Map ( size => 4)
			PORT Map (
				state		=> ShiftRowsOutput,
				result	=> MCOutput);	
      Feedback <= MCOutput;
	-------------------------------------------------
		
		TweakeyGeneration: ENTITY work.TweakeySchedule
		GENERIC Map ( size => 4, Tweakey => TweakeySize)
		PORT Map ( 
			Key					=> Key,
			clk					=> clk,
			rst	            => rst,
			TweakeyOutput 		=> RoundTweakey);


	-------------------------------------------------
	
	------------------------------------------------
	
	FSMMUX: ENTITY work.MUX
	GENERIC Map ( size => 6)
	PORT Map ( 
		sel	=> rst,
		D0   	=> FSMUpdate,
		D1 	=>  "000001",
		Q 		=> FSMSelected);
		
	FSMReg: ENTITY work.reg
	GENERIC Map ( size => 6)
	PORT Map ( 
		clk	=> clk,
		D 		=> FSMSelected,
		Q 		=> FSM);
		
	FSMUpdateInst: ENTITY work.StateUpdate
	GENERIC Map ( Tweakey => TweakeySize)
	PORT Map (FSM, FSMUpdate);
	
	FSMSignalsInst: ENTITY work.FSMSignals
	GENERIC Map ( Tweakey => TweakeySize)
	PORT Map (FSM, done_internal);

	----------------
	
	Ciphertext <= StateRegOutput;
	done	<= done_internal;

end Behavioral;

