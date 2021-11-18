
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY tb_Midori64_HPC2_ClockGating_d3 IS
END tb_Midori64_HPC2_ClockGating_d3;
 
ARCHITECTURE behavior OF tb_Midori64_HPC2_ClockGating_d3 IS 
 
	constant fresh_size   : integer := 1536;
	constant AddedLatency : integer := 8;


   --Inputs
	constant fresh_byte_size : integer := integer(ceil(real(fresh_size)/real(8)));

   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enc_dec : std_logic := '0';
   signal DataIn_s0 : std_logic_vector(63 downto 0) := (others => '0');
   signal DataIn_s1 : std_logic_vector(63 downto 0) := (others => '0');
   signal DataIn_s2 : std_logic_vector(63 downto 0) := (others => '0');
   signal DataIn_s3 : std_logic_vector(63 downto 0) := (others => '0');
   signal key_s0 : std_logic_vector(127 downto 0) := (others => '0');
   signal key_s1 : std_logic_vector(127 downto 0) := (others => '0');
   signal key_s2 : std_logic_vector(127 downto 0) := (others => '0');
   signal key_s3 : std_logic_vector(127 downto 0) := (others => '0');
	
   signal DataIn : std_logic_vector(63 downto 0) := (others => '0');
   signal key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal DataOut_s0 : std_logic_vector(63 downto 0);
   signal DataOut_s1 : std_logic_vector(63 downto 0);
   signal DataOut_s2 : std_logic_vector(63 downto 0);
   signal DataOut_s3 : std_logic_vector(63 downto 0);
   signal Fresh     		: std_logic_vector(8*fresh_byte_size-1 downto 0) := (others => '0');
	signal Synch         : std_logic;

   signal Mask_P1 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_P2 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_P3 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_K1 : std_logic_vector(127 downto 0) := (others => '0');
   signal Mask_K2 : std_logic_vector(127 downto 0) := (others => '0');
   signal Mask_K3 : std_logic_vector(127 downto 0) := (others => '0');


   signal DataOut : std_logic_vector(63 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

    constant mask_byte_size : integer := 8*3+16*3;
 
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
		  
		  wait until rising_edge(clk) and (Synch = '1'); 
		  
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
    end process;

    ---------

	 gen_1:
    FOR i in 0 to fresh_byte_size-1 GENERATE
        Fresh(8*(i+1)-1 downto 8*i) <= mm_fresh(i);
    end GENERATE;
    
	 gen_2:
    for i in 0 to 7 GENERATE
        Mask_P1(8*(i+1)-1 downto 8*i) <= mm(8*0+i);
        Mask_P2(8*(i+1)-1 downto 8*i) <= mm(8*1+i);
        Mask_P3(8*(i+1)-1 downto 8*i) <= mm(8*2+i);
    end GENERATE;

	 gen_3:
    for i in 0 to 15 GENERATE
        Mask_K1(8*(i+1)-1 downto 8*i) <= mm(8*3+i);
        Mask_K2(8*(i+1)-1 downto 8*i) <= mm(8*3+16+i);
        Mask_K3(8*(i+1)-1 downto 8*i) <= mm(8*3+16*2+i);
    end GENERATE;
 
   uut: entity work.Midori64_HPC2_ClockGating_d3 PORT MAP (
          clk => clk,
          reset => reset,
          enc_dec => enc_dec,
          DataIn_s0 => DataIn_s0,
          DataIn_s1 => DataIn_s1,
          DataIn_s2 => DataIn_s2,
          DataIn_s3 => DataIn_s3,
          key_s0 => key_s0,
          key_s1 => key_s1,
          key_s2 => key_s2,
          key_s3 => key_s3,
			 Fresh  => Fresh(fresh_size-1 downto 0),
			 Synch  => Synch,
          DataOut_s0 => DataOut_s0,
          DataOut_s1 => DataOut_s1,
          DataOut_s2 => DataOut_s2,
          DataOut_s3 => DataOut_s3,
          done => done
        );

	DataIn_s0 <= DataIn XOR Mask_P1 XOR Mask_P2 XOR Mask_P3;
	DataIn_s1 <= Mask_P1;
	DataIn_s2 <= Mask_P2;
	DataIn_s3 <= Mask_P3;
	
	key_s0 <= key XOR Mask_K1 XOR Mask_K2 XOR Mask_K3;
	key_s1 <= Mask_K1;
	key_s2 <= Mask_K2;
	key_s3 <= Mask_K3;

   DataOut <= DataOut_s0 XOR DataOut_s1 XOR DataOut_s2 XOR DataOut_s3;

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
		enc_dec <= '0';
		reset	<= '1';
		DataIn 	<= x"42c20fd3b586879e";
		key 	<= x"687ded3b3c85b3f35b1009863e2a8cbf";
      
		wait for clk_period*(AddedLatency + 1);
	
		DataIn 	<= (others => '0');
		reset	<= '0';
		wait for clk_period*(AddedLatency + 1);

		wait until rising_edge(clk) and (done = '1'); 
		wait for clk_period*(AddedLatency);
		
		if (DataOut = x"66bcdc6270d901cd") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	

      wait for clk_period*20.5;	
		enc_dec <= '1';
		reset	<= '1';
		DataIn 	<= x"66bcdc6270d901cd";
		key 	<= x"687ded3b3c85b3f35b1009863e2a8cbf";
      
		wait for clk_period*(AddedLatency + 1);
	
		DataIn 	<= (others => '0');
		reset	<= '0';
		wait for clk_period*(AddedLatency + 1);

		wait until rising_edge(clk) and (done = '1'); 
		wait for clk_period*(AddedLatency);
		
		if (DataOut = x"42c20fd3b586879e") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	


      wait;
   end process;

END;
