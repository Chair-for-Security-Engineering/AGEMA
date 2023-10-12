
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;
 
ENTITY tb_AES_LMDPL_d1 IS
END tb_AES_LMDPL_d1;
 
ARCHITECTURE behavior OF tb_AES_LMDPL_d1 IS 
 
	constant fresh_size   : integer := 34;

    -- Component Declaration for the Unit Under Test (UUT)
	constant fresh_byte_size : integer := integer(ceil(real(fresh_size)/real(8)));
 
    COMPONENT AES_LMDPL_Pipeline_d1
    PORT(
         Po_rst       : IN  std_logic;
         plaintext_s0 : IN  std_logic_vector(127 downto 0);
         key_s0 : IN  std_logic_vector(127 downto 0);
         clk : IN  std_logic;
         start : IN  std_logic;
         Fresh : IN  std_logic_vector(33 downto 0);
         plaintext_s1 : IN  std_logic_vector(127 downto 0);
         key_s1 : IN  std_logic_vector(127 downto 0);
         ciphertext_s0 : OUT  std_logic_vector(127 downto 0);
         done : OUT  std_logic;
         ciphertext_s1 : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Po_rst : std_logic;
   signal plaintext_s0 : std_logic_vector(127 downto 0) := (others => '0');
   signal key_s0 : std_logic_vector(127 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal Fresh : std_logic_vector(8*fresh_byte_size-1 downto 0) := (others => '0');
   signal plaintext_s1 : std_logic_vector(127 downto 0) := (others => '0');
   signal key_s1 : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal ciphertext_s0 : std_logic_vector(127 downto 0);
   signal done : std_logic;
   signal ciphertext_s1 : std_logic_vector(127 downto 0);

   signal plaintext  : std_logic_vector(127 downto 0) := (others => '0');
   signal key        : std_logic_vector(127 downto 0) := (others => '0');
   signal ciphertext : std_logic_vector(127 downto 0) := (others => '0');

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
   signal Mask_P : std_logic_vector(127 downto 0) := (others => '0');
   signal Mask_K : std_logic_vector(127 downto 0) := (others => '0');
 
    constant mask_byte_size : integer := 16+16;
 
    type INT_ARRAY  is array (integer range <>) of integer;
    type REAL_ARRAY is array (integer range <>) of real;
    type BYTE_ARRAY is array (integer range <>) of std_logic_vector(7 downto 0);
    
    signal rr: INT_ARRAY (mask_byte_size-1 downto 0);
    signal mm: BYTE_ARRAY(mask_byte_size-1 downto 0);
    
    signal rr_fresh: INT_ARRAY (fresh_byte_size-1 downto 0);
    signal mm_fresh: BYTE_ARRAY(fresh_byte_size-1 downto 0);
 
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
		  
		  wait for clk_period;
		  wait for clk_period;
    end process;


   fresh_maskgen: process
         variable seed1, seed2: positive;        -- seed values for random generator
         variable rand: REAL_ARRAY(fresh_byte_size-1 downto 0); -- random real-number value in range 0 to 1.0  
         variable range_of_rand : real := 256.0; -- the range of random values created will be 0 to +1000.
    begin
        
		  FOR i in 0 to fresh_byte_size-1 loop
				uniform(seed1, seed2, rand(i));   -- generate random number
				rr_fresh(i) <= integer(trunc(rand(i)*range_of_rand));  -- rescale to 0..1000, convert integer part 
				mm_fresh(i) <= std_logic_vector(to_unsigned(rr_fresh(i), mm_fresh(i)'length));
		  end loop;
		  
		  wait for clk_period;
		  wait for clk_period;
    end process;

    ---------

	 gen_1:
    FOR i in 0 to fresh_byte_size-1 GENERATE
        Fresh(8*(i+1)-1 downto 8*i) <= mm_fresh(i);
    end GENERATE;
    
	 gen_2:
    for i in 0 to 15 GENERATE
        Mask_P(8*(i+1)-1 downto 8*i) <= mm(i);
    end GENERATE;

	 gen_3:
    for i in 0 to 15 GENERATE
        Mask_K(8*(i+1)-1 downto 8*i) <= mm(16+i);
    end GENERATE;
 
 	plaintext_s0 <= plaintext XOR Mask_P;
	plaintext_s1 <= Mask_P;
	
	key_s0 <= key XOR Mask_K;
	key_s1 <= Mask_K;

   ciphertext <= ciphertext_s0 XOR ciphertext_s1;
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AES_LMDPL_Pipeline_d1 PORT MAP (
          Po_rst  => Po_rst,
          plaintext_s0 => plaintext_s0,
          key_s0 => key_s0,
          clk => clk,
          start => start,
          Fresh => Fresh(fresh_size-1 downto 0),
          plaintext_s1 => plaintext_s1,
          key_s1 => key_s1,
          ciphertext_s0 => ciphertext_s0,
          done => done,
          ciphertext_s1 => ciphertext_s1
        );

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
      Po_rst <= '1';
		
      wait for clk_period*20;

      Po_rst <= '0';

      -- insert stimulus here 

		start	<= '1';

      wait for clk_period*2;
	
		plaintext 	<= x"328831E0435A3137F6309807A88DA234";
		key 			<= x"2B28AB097EAEF7CF15D2154F16A6883C";
		start	      <= '0';
      wait for clk_period*2;

		plaintext 	<= (others => '0');
		key 			<= (others => '0');

		wait until falling_edge(clk) and (done = '1'); 
		wait for clk_period*1;
				
		if (ciphertext = x"3902DC1925DC116A8409850B1DFB9732") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	

		wait until falling_edge(clk);
      wait for clk_period*1;
		
		start	      <= '1';
      wait for clk_period*2;

		plaintext 	<= (others => '0');
		key 			<= (others => '0');
		start	      <= '0';

      wait for clk_period*2;

		plaintext 	<= x"328831E0435A3137F6309807A88DA234";
		key 			<= x"2B28AB097EAEF7CF15D2154F16A6883C";

		wait until falling_edge(clk) and (done = '1'); 
		wait for clk_period*1;
				
		if (ciphertext = x"66ef88cae98a4c344b2cfa2bd43b592e") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		
      wait;
   end process;

END;
