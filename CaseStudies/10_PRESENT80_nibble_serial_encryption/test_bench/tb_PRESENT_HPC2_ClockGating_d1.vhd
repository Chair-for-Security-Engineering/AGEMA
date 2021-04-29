
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY tb_PRESENT_HPC2_ClockGating_d1 IS
END tb_PRESENT_HPC2_ClockGating_d1;
 
ARCHITECTURE behavior OF tb_PRESENT_HPC2_ClockGating_d1 IS 
 
	constant fresh_size   : integer := 4;
	constant AddedLatency : integer := 4;


   --Inputs
	constant fresh_byte_size : integer := integer(ceil(real(fresh_size)/real(8)));

   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal data_in_s0 : std_logic_vector(63 downto 0) := (others => '0');
   signal data_in_s1 : std_logic_vector(63 downto 0) := (others => '0');
   signal Key_s0 : std_logic_vector(79 downto 0) := (others => '0');
   signal Key_s1 : std_logic_vector(79 downto 0) := (others => '0');
	
   signal data_in : std_logic_vector(63 downto 0) := (others => '0');
   signal Key : std_logic_vector(79 downto 0) := (others => '0');

 	--Outputs
   signal data_out_s0 : std_logic_vector(63 downto 0);
   signal data_out_s1 : std_logic_vector(63 downto 0);
   signal Fresh     		: std_logic_vector(8*fresh_byte_size-1 downto 0) := (others => '0');
	signal Synch         : std_logic;

   signal Mask_P : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_K : std_logic_vector(79 downto 0) := (others => '0');


   signal data_out : std_logic_vector(63 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

    constant mask_byte_size : integer := fresh_byte_size+8+10;
 
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
        Mask_P(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+i);
    end GENERATE;

	 gen_3:
    for i in 0 to 9 GENERATE
        Mask_K(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8+i);
    end GENERATE;
 
   uut: entity work.PRESENT_HPC2_ClockGating_d1 PORT MAP (
          clk => clk,
          reset => reset,
          data_in_s0 => data_in_s0,
          data_in_s1 => data_in_s1,
          Key_s0 => Key_s0,
          Key_s1 => Key_s1,
			 Fresh  => Fresh(fresh_size-1 downto 0),
			 Synch  => Synch,
          data_out_s0 => data_out_s0,
          data_out_s1 => data_out_s1,
          done => done
        );

	data_in_s0 <= data_in XOR Mask_P;
	data_in_s1 <= Mask_P;
	
	Key_s0 <= Key XOR Mask_K;
	Key_s1 <= Mask_K;

   data_out <= data_out_s0 XOR data_out_s1;

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

		reset	<= '1';
		data_in 	<= x"B205D6F95EED44CB";
		Key 		<= x"8F31A1F39DD7CEE38C3B";
      
		wait for clk_period*(AddedLatency + 1);
	
		data_in 	<= (others => '0');
		Key    		<= (others => '0');
		reset	<= '0';
		wait for clk_period*(AddedLatency + 1);

		wait until rising_edge(clk) and (done = '1'); 
		wait for clk_period*(AddedLatency);
		
		if (data_out = x"759214987F6B5E7A") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	

      wait;
   end process;

END;
