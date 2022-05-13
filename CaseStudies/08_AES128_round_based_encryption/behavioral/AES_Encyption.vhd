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

	COMPONENT reg_SDE IS
	GENERIC ( size: POSITIVE := 128);
	PORT ( clk  : IN  STD_LOGIC;
			 D0   : IN  STD_LOGIC_VECTOR ((size-1) DOWNTO 0);
			 D1   : IN  STD_LOGIC_VECTOR ((size-1) DOWNTO 0);
			 sel  : IN  STD_LOGIC;
			 Q    : OUT STD_LOGIC_VECTOR ((size-1) DOWNTO 0));
	END COMPONENT;

	COMPONENT SubBytes is
	Port ( input  : in  STD_LOGIC_VECTOR (127 downto 0);
			 output : out STD_LOGIC_VECTOR (127 downto 0));
	end COMPONENT;	

	COMPONENT ShiftRows is
	Port ( input  : in  STD_LOGIC_VECTOR (127 downto 0);
			 output : out STD_LOGIC_VECTOR (127 downto 0));
	end COMPONENT;	

	COMPONENT MixColumns is
	Port ( input  : in  STD_LOGIC_VECTOR (127 downto 0);
			 output : out STD_LOGIC_VECTOR (127 downto 0));
	end COMPONENT;	

	COMPONENT KeyExpansion is
	Port ( input  : in  STD_LOGIC_VECTOR (127 downto 0);
			 Rcon   : in  STD_LOGIC_VECTOR (7 downto 0);
			 output : out STD_LOGIC_VECTOR (127 downto 0));			  
	end COMPONENT;
			
	COMPONENT counter IS
	GENERIC ( size: POSITIVE);
	PORT ( clk     : IN  STD_LOGIC;
			 reset	: IN  STD_LOGIC;
			 q 		: OUT STD_LOGIC_VECTOR ((size-1) DOWNTO 0));
	END COMPONENT;
	
	-------------------------
	
	signal RoundInput					: STD_LoGIC_VECTOR(127 downto 0);
	signal SubBytesInput				: STD_LoGIC_VECTOR(127 downto 0);
	signal ShiftRowsInput			: STD_LoGIC_VECTOR(127 downto 0);
	signal MixColumnsInput			: STD_LoGIC_VECTOR(127 downto 0);
	signal MixColumnsOutput			: STD_LoGIC_VECTOR(127 downto 0);
	signal RoundOutput				: STD_LoGIC_VECTOR(127 downto 0);
	
	signal RoundKey					: STD_LoGIC_VECTOR(127 downto 0);
	signal KeyExpansionOutput		: STD_LoGIC_VECTOR(127 downto 0);

	signal LastRound					: STD_LOGIC;
	signal RoundCounter      		: STD_LoGIC_VECTOR(3 downto 0);
	signal Rcon							: STD_LoGIC_VECTOR(7 downto 0);
		
begin

	RoundReg: reg_SDE
	GENERIC MAP (size => 128)
	PORT MAP (
		clk	=> clk,
		D0		=> RoundOutput,
		D1		=> plaintext,
		sel	=> reset,
		Q		=> RoundInput);
	
	SubBytesInput <= RoundInput XOR RoundKey;
	
	SubBytesIns: SubBytes
	PORT MAP (
		input		=> SubBytesInput,
		output	=> ShiftRowsInput);
	
	ShiftRowsIns: ShiftRows
	PORT MAP (
		input		=> ShiftRowsInput,
		output	=> MixColumnsInput);

	MixColumnsIns: MixColumns
	PORT MAP (
		input		=> MixColumnsInput,
		output	=> MixColumnsOutput);

	RoundOutput <= MixColumnsInput WHEN LastRound = '1' ELSE MixColumnsOutput;
	
	ciphertext 		<= SubBytesInput;
	
	-------------------------------------------------
		
	KeyReg: reg_SDE
	GENERIC MAP (size => 128)
	PORT MAP (
		clk	=> clk,
		D0		=> KeyExpansionOutput,
		D1		=> key,
		sel	=> reset,
		Q		=> RoundKey);

	KeyExpansionIns: KeyExpansion
	PORT MAP (
		input		=> RoundKey,
		Rcon		=> Rcon,
		output	=> KeyExpansionOutput);
	
	-------------------------------------------------

	RoundCounterIns: counter
	GENERIC MAP ( size => 4)
	PORT MAP ( 
		clk   => clk,
		reset	=> reset,
		q 		=> RoundCounter);
		
	LastRound   			<= '1' WHEN RoundCounter = x"9" ELSE '0';
	done						<= '1' WHEN RoundCounter = x"A" ELSE '0';
	
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
		
end Behavioral;

