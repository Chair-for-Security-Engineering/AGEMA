
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Midori64_Round IS
	PORT ( input             : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
			 k_0               : IN  STD_LOGIC_VECTOR (63 downto 0);
			 k_1               : IN  STD_LOGIC_VECTOR (63 downto 0);
			 result            : OUT  STD_LOGIC_VECTOR (63 downto 0);

			 -- CONTROLLER PORTS
			 enc_dec           : IN STD_LOGIC;
			 clk               : IN STD_LOGIC;
			 round_number      : IN STD_LOGIC_VECTOR (3 DOWNTO 0); -- besser in round �ndern
			 roundStart_Select : IN STD_LOGIC);
END Midori64_Round;

ARCHITECTURE behavioral OF Midori64_Round IS
	
	COMPONENT ScanFF IS
		GENERIC (SIZE : integer);
		PORT ( CLK	: IN 	STD_LOGIC;
				 SE 	: IN 	STD_LOGIC;
				 D  	: IN 	STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0);
				 DS	: IN 	STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0);
				 Q 	: OUT STD_LOGIC_VECTOR((SIZE-1) DOWNTO 0));
	END COMPONENT;
	
	COMPONENT substitution IS
		PORT ( state : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
				 result : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT roundConstant_MUX IS
		PORT ( round : IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
				 enc_dec: IN STD_LOGIC;
				 roundConstant : OUT  STD_LOGIC_VECTOR (15 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT ShiftRows_Inverse is
		PORT ( state : in  STD_LOGIC_VECTOR (63 downto 0);
				  result : out  STD_LOGIC_VECTOR (63 downto 0));
	END COMPONENT;
	
	COMPONENT matrixMultiplication IS
		PORT ( state : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
				 result : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0));
	END COMPONENT;
	
	COMPONENT ShiftRows is
		PORT ( state : IN  STD_LOGIC_VECTOR (63 DOWNTO 0);
				 result : OUT  STD_LOGIC_VECTOR (63 DOWNTO 0));
	END COMPONENT;
	
	SIGNAL round_Constant     : STD_LOGIC_VECTOR (15 DOWNTO 0);

	SIGNAL SelectedKey,
			 ProcessedKey,
			 roundReg_out,
			 sub_Result,
			 SR_Result,
			 sub_ResultXORkey,
			 mul_input,
			 mul_Result,
			 SR_Inv_Result,
			 mul_ResultXORkey,
			 round_Result : STD_LOGIC_VECTOR (63 DOWNTO 0);
	
	BEGIN 
						  
		constant_MUX : roundConstant_MUX
			PORT MAP ( round => round_number,
						  enc_dec => enc_dec,
						  roundConstant => round_Constant);

		MUXInst: entity work.MUX
		Generic Map (size => 64) 
		Port Map (S => round_number(0), D0 => k_0, D1 => k_1, Q => SelectedKey);

		ProcessedKey(63 downto 61) <= SelectedKey(63 downto 61);
		ProcessedKey(59 downto 57) <= SelectedKey(59 downto 57);
		ProcessedKey(55 downto 53) <= SelectedKey(55 downto 53);
		ProcessedKey(51 downto 49) <= SelectedKey(51 downto 49);
		ProcessedKey(47 downto 45) <= SelectedKey(47 downto 45);
		ProcessedKey(43 downto 41) <= SelectedKey(43 downto 41);
		ProcessedKey(39 downto 37) <= SelectedKey(39 downto 37);
		ProcessedKey(35 downto 33) <= SelectedKey(35 downto 33);
		ProcessedKey(31 downto 29) <= SelectedKey(31 downto 29);
		ProcessedKey(27 downto 25) <= SelectedKey(27 downto 25);
		ProcessedKey(23 downto 21) <= SelectedKey(23 downto 21);
		ProcessedKey(19 downto 17) <= SelectedKey(19 downto 17);
		ProcessedKey(15 downto 13) <= SelectedKey(15 downto 13);
		ProcessedKey(11 downto  9) <= SelectedKey(11 downto  9);
		ProcessedKey( 7 downto  5) <= SelectedKey( 7 downto  5);
		ProcessedKey( 3 downto  1) <= SelectedKey( 3 downto  1);

		ProcessedKey(60)	<= SelectedKey(60) XOR round_Constant(15);
		ProcessedKey(56)	<= SelectedKey(56) XOR round_Constant(14);
		ProcessedKey(52)	<= SelectedKey(52) XOR round_Constant(13);
		ProcessedKey(48)	<= SelectedKey(48) XOR round_Constant(12);
		ProcessedKey(44)	<= SelectedKey(44) XOR round_Constant(11);
		ProcessedKey(40)	<= SelectedKey(40) XOR round_Constant(10);
		ProcessedKey(36)	<= SelectedKey(36) XOR round_Constant( 9);
		ProcessedKey(32)	<= SelectedKey(32) XOR round_Constant( 8);
		ProcessedKey(28)	<= SelectedKey(28) XOR round_Constant( 7);
		ProcessedKey(24)	<= SelectedKey(24) XOR round_Constant( 6);
		ProcessedKey(20)	<= SelectedKey(20) XOR round_Constant( 5);
		ProcessedKey(16)	<= SelectedKey(16) XOR round_Constant( 4);
		ProcessedKey(12)	<= SelectedKey(12) XOR round_Constant( 3);
		ProcessedKey( 8)	<= SelectedKey( 8) XOR round_Constant( 2);
		ProcessedKey( 4)	<= SelectedKey( 4) XOR round_Constant( 1);
		ProcessedKey( 0)	<= SelectedKey( 0) XOR round_Constant( 0);
		
		-----------------------------------------

		roundResult_Reg: ScanFF
			GENERIC MAP ( SIZE => 64)
			PORT MAP (
				CLK	=> clk,
				SE		=> roundStart_Select,
				D		=> round_Result,
				DS		=> input,
				Q		=> roundReg_out);

		sub : substitution
			PORT MAP ( state => roundReg_out,
						  result => sub_Result);
		
		SR: ShiftRows
			PORT MAP ( state => sub_Result,
						  result => SR_Result);
		
		sub_ResultXORkey <= sub_Result xor ProcessedKey;
		
		mul_input_Inst: entity work.MUX
		Generic Map (size => 64) 
		Port Map (S => enc_dec, D0 => SR_Result, D1 => sub_ResultXORkey, Q => mul_input);

		mul: matrixMultiplication
			PORT MAP ( state => mul_input,
						  result => mul_Result);
		
		SR_Inv: ShiftRows_Inverse
			Port MAP ( state => mul_Result,
						  result => SR_Inv_Result);
						  
		mul_ResultXORkey	<= mul_Result xor ProcessedKey;

		Res_Inst: entity work.MUX
		Generic Map (size => 64) 
		Port Map (S => enc_dec, D0 => mul_ResultXORkey,  D1 => SR_Inv_Result, Q => round_Result);


		--------------------------------------------
					  
		result <= sub_Result;

END behavioral;

