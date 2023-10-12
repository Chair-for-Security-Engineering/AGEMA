library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AES is
    Port ( plaintext  : in  STD_LOGIC_VECTOR (127 downto 0);
           key        : in  STD_LOGIC_VECTOR (127 downto 0);
           reset      : in  STD_LOGIC;
           clk        : in  STD_LOGIC;
           ciphertext : out STD_LOGIC_VECTOR (127 downto 0);
           done       : out STD_LOGIC);
end AES;

architecture Behavioral of AES is

	signal RoundInput					: STD_LoGIC_VECTOR(127 downto 0);
	signal ShiftRowsInput			: STD_LoGIC_VECTOR(127 downto 0);
	signal ShiftRowsOutput			: STD_LoGIC_VECTOR(127 downto 0);

	signal SubBytesInput				: STD_LoGIC_VECTOR(31  downto 0);
	signal SubBytesOutput			: STD_LoGIC_VECTOR(31  downto 0);
	signal MixColumnsOutput			: STD_LoGIC_VECTOR(31  downto 0);
	signal ColumnOutput				: STD_LoGIC_VECTOR(31  downto 0);

	signal RoundOutput				: STD_LoGIC_VECTOR(127 downto 0);
	
	signal RoundKey					: STD_LoGIC_VECTOR(127 downto 0);
	signal KSSubBytesInput			: STD_LoGIC_VECTOR(31  downto 0);
	signal KeyExpansionOutput		: STD_LoGIC_VECTOR(127 downto 0);
	signal RoundKeyOutput			: STD_LoGIC_VECTOR(127 downto 0);

	signal RoundCounter      		: STD_LoGIC_VECTOR(3 downto 0);
	signal InRoundCounter     		: STD_LoGIC_VECTOR(2 downto 0);
	signal Rcon							: STD_LoGIC_VECTOR(7 downto 0);
	
	signal DoneInt						: STD_LOGIC;
	signal LastRound					: STD_LOGIC;
	signal AKSR							: STD_LOGIC;
	signal AKSRnotDone				: STD_LOGIC;
	signal LastRoundorDone			: STD_LOGIC;
			
begin

	RoundReg: entity work.reg_SDE
	GENERIC MAP (size => 128)
	PORT MAP (
		clk	=> clk,
		D0		=> RoundOutput,
		D1		=> plaintext,
		sel	=> reset,
		Q		=> RoundInput);

	----------------------------------

	ShiftRowsInput <= RoundInput XOR RoundKey;

	ShiftRowsIns: entity work.ShiftRows
	PORT MAP (
		input		=> ShiftRowsInput,
		output	=> ShiftRowsOutput);

	----------------------------------

	MuxSboxIn: entity work.MUX
	generic map (size => 32)
	port map (
		S	=> AKSRnotDone,
		D0 => RoundInput(127 downto 96),
		D1	=> KSSubBytesInput,
		Q	=> SubBytesInput);

	SubBytesIns: entity work.SubBytes	
	PORT MAP (
		input		=> SubBytesInput,
		output	=> SubBytesOutput);
	
	MixColumnsIns: entity work.MixOneColumn
	PORT MAP (
		input		=> SubBytesOutput,
		output	=> MixColumnsOutput);

	MuxMCOut: entity work.MUX
	generic map (size => 32)
	port map (
		S	=> LastRoundorDone,
		D0 => MixColumnsOutput,
		D1	=> SubBytesOutput,
		Q	=> ColumnOutput);

	ShiftRowsInvIns: entity work.ShiftRowsInv
	PORT MAP (
		input		=> RoundInput,
		output	=> ciphertext);

	----------------------------------

	MuxRound: entity work.MUX
	generic map (size => 128)
	port map (
		S	=> AKSRnotDone,
		D0(127 downto 32) => RoundInput(95 downto 0),
		D0(31  downto  0) => ColumnOutput,
		D1	=> ShiftRowsOutput,
		Q	=> RoundOutput);

	----------------------------------
	----------------------------------

	KeyReg: entity work.reg_SDE
	GENERIC MAP (size => 128)
	PORT MAP (
		clk	=> clk,
		D0		=> RoundKeyOutput,
		D1		=> key,
		sel	=> reset,
		Q		=> RoundKey);

	KeyExpansionIns: entity work.KeyExpansion
	PORT MAP (
		input			=> RoundKey,
		SubBytesIn	=> KSSubBytesInput,
		SubBytesOut	=> SubBytesOutput,
		Rcon			=> Rcon,
		output		=> KeyExpansionOutput);

	MuxKeyExpansion: entity work.MUX
	generic map (size => 128)
	port map (
		S	=> AKSRnotDone,
		D0	=> RoundKey,
		D1	=> KeyExpansionOutput,
		Q	=> RoundKeyOutput);

	----------------------------------
	----------------------------------

	RoundCounterIns: entity work.counter
	GENERIC MAP ( 
		size 		=> 4,
		modulo	=> 16)
	PORT MAP ( 
		clk   	=> clk,
		enable 	=> AKSRnotDone,
		reset		=> reset,
		q 			=> RoundCounter);
		
	InRoundCounterIns: entity work.counter
	GENERIC MAP ( 
		size 		=> 3,
		modulo	=> 5)
	PORT MAP ( 
		clk   	=> clk,
		enable 	=> '1',
		reset		=> reset,
		q 			=> InRoundCounter);
		
	LastRound	<= '1' WHEN RoundCounter   = x"A"  ELSE '0';
	DoneInt		<= '1' WHEN RoundCounter   = x"B"  ELSE '0';
	AKSR			<= '1' WHEN InRoundCounter = "000" ELSE '0';
	
	AKSRnotDone 	 <= AKSR and (not DoneInt);
	LastRoundorDone <= LastRound or DoneInt;
	
	WITH RoundCounter SELECT
		Rcon <= 	x"01" WHEN x"0",
					x"02" WHEN x"1",
					x"04" WHEN x"2",
					x"08" WHEN x"3",
					x"10" WHEN x"4",
					x"20" WHEN x"5",
					x"40" WHEN x"6",
					x"80" WHEN x"7",
					x"1B" WHEN x"8",
					x"36" WHEN x"9",
					x"00" WHEN OTHERS;
	
	done <= DoneInt;
		
end Behavioral;

