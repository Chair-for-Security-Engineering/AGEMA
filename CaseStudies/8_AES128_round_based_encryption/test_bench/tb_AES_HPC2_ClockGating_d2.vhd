
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY tb_AES_HPC2_ClockGating_d2 IS
END tb_AES_HPC2_ClockGating_d2;
 
ARCHITECTURE behavior OF tb_AES_HPC2_ClockGating_d2 IS 
 
	constant fresh_size   : integer := 2040;
	constant AddedLatency : integer := 8;


   --Inputs
	constant fresh_byte_size : integer := integer(ceil(real(fresh_size)/real(8)));

   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal plaintext_s0 : std_logic_vector(127 downto 0) := (others => '0');
   signal plaintext_s1 : std_logic_vector(127 downto 0) := (others => '0');
   signal plaintext_s2 : std_logic_vector(127 downto 0) := (others => '0');
   signal key_s0 : std_logic_vector(127 downto 0) := (others => '0');
   signal key_s1 : std_logic_vector(127 downto 0) := (others => '0');
   signal key_s2 : std_logic_vector(127 downto 0) := (others => '0');
	
   signal plaintext : std_logic_vector(127 downto 0) := (others => '0');
   signal key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal ciphertext_s0 : std_logic_vector(127 downto 0);
   signal ciphertext_s1 : std_logic_vector(127 downto 0);
   signal ciphertext_s2 : std_logic_vector(127 downto 0);
   signal Fresh     		: std_logic_vector(8*fresh_byte_size-1 downto 0) := (others => '0');
	signal Synch         : std_logic;

   signal Mask_P1 : std_logic_vector(127 downto 0) := (others => '0');
   signal Mask_P2 : std_logic_vector(127 downto 0) := (others => '0');
   signal Mask_K1 : std_logic_vector(127 downto 0) := (others => '0');
   signal Mask_K2 : std_logic_vector(127 downto 0) := (others => '0');


   signal ciphertext : std_logic_vector(127 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

    constant mask_byte_size : integer := fresh_byte_size+16*2+16*2;
 
    type INT_ARRAY  is array (integer range <>) of integer;
    type REAL_ARRAY is array (integer range <>) of real;
    type BYTE_ARRAY is array (integer range <>) of std_logic_vector(7 downto 0);
    
    signal rr: INT_ARRAY (mask_byte_size-1 downto 0);
    signal mm: BYTE_ARRAY(mask_byte_size-1 downto 0);
    
BEGIN
 
    maskgen: process
         variable seed1, seed2: positive;        -- seed values for random generator
         variable rand: REAL_ARRAY(mask_byte_size-1 downto 0); -- random real-number value in range 0 to 1.0  
         variable range_of_rand : real := 256.0; -- the range of random values created will be 0 to +1000.
    begin
        
        FOR i in 0 to mask_byte_size-1 loop
            uniform(seed1, seed2, rand(i));   -- generate random number
            rr(i) <= integer(trunc(rand(i)*range_of_rand));  -- rescale to 0..1000, convert integer part 
            mm(i) <= std_logic_vector(to_unsigned(rr(i), mm(i)'length));
        end loop;
		  
		  wait until rising_edge(Synch); 
		  
    end process;

    ---------

	 gen_1:
    FOR i in 0 to fresh_byte_size-1 GENERATE
        Fresh(8*(i+1)-1 downto 8*i) <= mm(i);
    end GENERATE;
    
	 gen_2:
    for i in 0 to 15 GENERATE
        Mask_P1(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+16*0+i);
        Mask_P2(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+16*1+i);
    end GENERATE;

	 gen_3:
    for i in 0 to 15 GENERATE
        Mask_K1(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+16*2+i);
        Mask_K2(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+16*3+i);
    end GENERATE;
 
   uut: entity work.AES_HPC2_ClockGating_d2 PORT MAP (
          clk => clk,
          reset => reset,
          plaintext_s0 => plaintext_s0,
          plaintext_s1 => plaintext_s1,
          plaintext_s2 => plaintext_s2,
          key_s0 => key_s0,
          key_s1 => key_s1,
          key_s2 => key_s2,
			 Fresh  => Fresh(fresh_size-1 downto 0),
			 Synch  => Synch,
          ciphertext_s0 => ciphertext_s0,
          ciphertext_s1 => ciphertext_s1,
          ciphertext_s2 => ciphertext_s2,
          done => done
        );

	plaintext_s0 <= plaintext XOR Mask_P1 XOR Mask_P2;
	plaintext_s1 <= Mask_P1;
	plaintext_s2 <= Mask_P2;
	
	key_s0 <= key XOR Mask_K1 XOR Mask_K2;
	key_s1 <= Mask_K1;
	key_s2 <= Mask_K2;

   ciphertext <= ciphertext_s0 XOR ciphertext_s1 XOR ciphertext_s2;

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period;	

		reset			<= '1';
		plaintext 	<= x"3243f6a8885a308d313198a2e0370734";
		key 			<= x"2b7e151628aed2a6abf7158809cf4f3c";
      
		wait for clk_period*(AddedLatency + 1);
	
		reset			<= '0';
		plaintext 	<= (others => '0');
		key 			<= (others => '0');

		wait for clk_period*(AddedLatency + 1);

		wait until rising_edge(clk) and (done = '1'); 
		wait for clk_period*(AddedLatency);
		
		if (ciphertext = x"3925841d02dc09fbdc118597196a0b32") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	

      wait;
   end process;

END;
