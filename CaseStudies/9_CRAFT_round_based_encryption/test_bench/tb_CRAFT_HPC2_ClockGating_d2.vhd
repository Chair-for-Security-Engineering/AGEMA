
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY tb_CRAFT_HPC2_ClockGating_d2 IS
END tb_CRAFT_HPC2_ClockGating_d2;
 
ARCHITECTURE behavior OF tb_CRAFT_HPC2_ClockGating_d2 IS 
 
	constant fresh_size   : integer := 768;
	constant AddedLatency : integer := 8;


   --Inputs
	constant fresh_byte_size : integer := integer(ceil(real(fresh_size)/real(8)));

   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal Plaintext_s0 : std_logic_vector(63 downto 0) := (others => '0');
   signal Plaintext_s1 : std_logic_vector(63 downto 0) := (others => '0');
   signal Plaintext_s2 : std_logic_vector(63 downto 0) := (others => '0');
   signal Key_s0 : std_logic_vector(127 downto 0) := (others => '0');
   signal Key_s1 : std_logic_vector(127 downto 0) := (others => '0');
   signal Key_s2 : std_logic_vector(127 downto 0) := (others => '0');
	
   signal Plaintext : std_logic_vector(63 downto 0) := (others => '0');
   signal Key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal Ciphertext_s0 : std_logic_vector(63 downto 0);
   signal Ciphertext_s1 : std_logic_vector(63 downto 0);
   signal Ciphertext_s2 : std_logic_vector(63 downto 0);
   signal Fresh     		: std_logic_vector(8*fresh_byte_size-1 downto 0) := (others => '0');
	signal Synch         : std_logic;

   signal Mask_P1 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_P2 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_K1 : std_logic_vector(127 downto 0) := (others => '0');
   signal Mask_K2 : std_logic_vector(127 downto 0) := (others => '0');


   signal Ciphertext : std_logic_vector(63 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

    constant mask_byte_size : integer := fresh_byte_size+8*2+16*2;
 
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
    for i in 0 to 7 GENERATE
        Mask_P1(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8*0+i);
        Mask_P2(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8*1+i);
    end GENERATE;

	 gen_3:
    for i in 0 to 15 GENERATE
        Mask_K1(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8*2+i);
        Mask_K2(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8*2+16+i);
    end GENERATE;
 
   uut: entity work.CRAFT_HPC2_ClockGating_d2 PORT MAP (
          clk => clk,
          rst => rst,
          Plaintext_s0 => Plaintext_s0,
          Plaintext_s1 => Plaintext_s1,
          Plaintext_s2 => Plaintext_s2,
          Key_s0 => Key_s0,
          Key_s1 => Key_s1,
          Key_s2 => Key_s2,
			 Fresh  => Fresh(fresh_size-1 downto 0),
			 Synch  => Synch,
          Ciphertext_s0 => Ciphertext_s0,
          Ciphertext_s1 => Ciphertext_s1,
          Ciphertext_s2 => Ciphertext_s2,
          done => done
        );

	Plaintext_s0 <= Plaintext XOR Mask_P1 XOR Mask_P2;
	Plaintext_s1 <= Mask_P1;
	Plaintext_s2 <= Mask_P2;
	
	Key_s0 <= Key XOR Mask_K1 XOR Mask_K2;
	Key_s1 <= Mask_K1;
	Key_s2 <= Mask_K2;

   Ciphertext <= Ciphertext_s0 XOR Ciphertext_s1 XOR Ciphertext_s2;

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
      -- hold rst state for 100 ns.
      wait for clk_period;	

		rst	<= '1';
		Plaintext 	<= x"0123456789ABCDEF";
		Key 			<= x"18F4EEBDFCED7841D9E0E38CFE6A9405";
      
		wait for clk_period*(AddedLatency + 1);
	
		Plaintext 	<= (others => '0');
		rst	<= '0';

		wait until rising_edge(clk) and (done = '1'); 
		wait for clk_period*(AddedLatency);
		
		if (Ciphertext = x"614D03B82A8A2817") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	

      wait;
   end process;

END;
