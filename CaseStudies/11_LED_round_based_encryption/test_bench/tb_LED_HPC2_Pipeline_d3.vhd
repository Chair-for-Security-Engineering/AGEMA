
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY tb_LED_HPC2_Pipeline_d3 IS
END tb_LED_HPC2_Pipeline_d3;
 
ARCHITECTURE behavior OF tb_LED_HPC2_Pipeline_d3 IS 
 
	constant fresh_size   : integer := 384;
	constant AddedLatency : integer := 4;


   --Inputs
	constant fresh_byte_size : integer := integer(ceil(real(fresh_size)/real(8)));

   signal clk : std_logic := '0';
   signal IN_reset : std_logic := '0';
   signal IN_plaintext_s0 : std_logic_vector(63 downto 0) := (others => '0');
   signal IN_plaintext_s1 : std_logic_vector(63 downto 0) := (others => '0');
   signal IN_plaintext_s2 : std_logic_vector(63 downto 0) := (others => '0');
   signal IN_plaintext_s3 : std_logic_vector(63 downto 0) := (others => '0');
   signal IN_key_s0 : std_logic_vector(127 downto 0) := (others => '0');
   signal IN_key_s1 : std_logic_vector(127 downto 0) := (others => '0');
   signal IN_key_s2 : std_logic_vector(127 downto 0) := (others => '0');
   signal IN_key_s3 : std_logic_vector(127 downto 0) := (others => '0');
	
   signal IN_plaintext : std_logic_vector(63 downto 0) := (others => '0');
   signal IN_key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal OUT_ciphertext_s0 : std_logic_vector(63 downto 0);
   signal OUT_ciphertext_s1 : std_logic_vector(63 downto 0);
   signal OUT_ciphertext_s2 : std_logic_vector(63 downto 0);
   signal OUT_ciphertext_s3 : std_logic_vector(63 downto 0);
   signal Fresh     : std_logic_vector(8*fresh_byte_size-1 downto 0) := (others => '0');

   signal Mask_P1 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_P2 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_P3 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_K1 : std_logic_vector(127 downto 0) := (others => '0');
   signal Mask_K2 : std_logic_vector(127 downto 0) := (others => '0');
   signal Mask_K3 : std_logic_vector(127 downto 0) := (others => '0');

   signal OUT_ciphertext : std_logic_vector(63 downto 0);
   signal OUT_done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

    constant mask_byte_size : integer := fresh_byte_size+8*3+16*3;
 
    type INT_ARRAY  is array (integer range <>) of integer;
    type REAL_ARRAY is array (integer range <>) of real;
    type BYTE_ARRAY is array (integer range <>) of std_logic_vector(7 downto 0);
    
    signal rr: INT_ARRAY (mask_byte_size-1 downto 0);
    signal mm: BYTE_ARRAY(mask_byte_size-1 downto 0);
    
BEGIN
 
    maskgen: process
         variable seed1, seed2: positive;        -- seed values for random generator
         variable rand: REAL_ARRAY(mask_byte_size-1 downto 0); -- random real-number value in range 0 to 1.0  
         variable range_of_rand : real := 256.0; -- the range of random values created will be 0 to +1600.
    begin
        
        FOR i in 0 to mask_byte_size-1 loop
            uniform(seed1, seed2, rand(i));   -- generate random number
            rr(i) <= integer(trunc(rand(i)*range_of_rand));  -- rescale to 0..1000, convert integer part 
            mm(i) <= std_logic_vector(to_unsigned(rr(i), mm(i)'length));
        end loop;
		  
        wait for clk_period;
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
        Mask_P3(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8*2+i);
    end GENERATE;

	 gen_3:
    for i in 0 to 15 GENERATE
        Mask_K1(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8*3+i);
        Mask_K2(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8*3+16+i);
        Mask_K3(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8*3+16*2+i);
    end GENERATE;


   uut: entity work.LED_HPC2_Pipeline_d3 PORT MAP (
          clk => clk,
          IN_reset => IN_reset,
          IN_plaintext_s0 => IN_plaintext_s0,
          IN_plaintext_s1 => IN_plaintext_s1,
          IN_plaintext_s2 => IN_plaintext_s2,
          IN_plaintext_s3 => IN_plaintext_s3,
          IN_key_s0 => IN_key_s0,
          IN_key_s1 => IN_key_s1,
          IN_key_s2 => IN_key_s2,
          IN_key_s3 => IN_key_s3,
			 Fresh  => Fresh(fresh_size-1 downto 0),
          OUT_ciphertext_s0 => OUT_ciphertext_s0,
          OUT_ciphertext_s1 => OUT_ciphertext_s1,
          OUT_ciphertext_s2 => OUT_ciphertext_s2,
          OUT_ciphertext_s3 => OUT_ciphertext_s3,
          OUT_done => OUT_done
        );

	IN_plaintext_s0 <= IN_plaintext XOR Mask_P1 XOR Mask_P2 XOR Mask_P3;
	IN_plaintext_s1 <= Mask_P1;
	IN_plaintext_s2 <= Mask_P2;
	IN_plaintext_s3 <= Mask_P3;
	
	IN_key_s0 <= IN_key XOR Mask_K1 XOR Mask_K2 XOR Mask_K3;
	IN_key_s1 <= Mask_K1;
	IN_key_s2 <= Mask_K2;
	IN_key_s3 <= Mask_K3;

   OUT_ciphertext <= OUT_ciphertext_s0 XOR OUT_ciphertext_s1 XOR OUT_ciphertext_s2 XOR OUT_ciphertext_s3;

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
      -- hold IN_reset state for 100 ns.
      wait for clk_period;	
		IN_reset	<= '1';

		for i in 0 to AddedLatency loop
			if ((i mod 2) = 0) then
				IN_plaintext 	<= x"B9B11902E6C14E39";
				IN_key 		<= x"F589DA3F6BB38D23E776CDE49EC7CB62";
			else
				IN_plaintext 	<= x"0000000000000000";
				IN_key 		<= x"00000000000000000000000000000000";
			end if;
      
			wait for clk_period*1;
		end loop;	
	
		IN_reset	<= '0';
		wait for clk_period*(AddedLatency+1);

		for i in 0 to AddedLatency loop
			wait until rising_edge(clk) and (OUT_done = '1'); 

			if ((i mod 2) = 0) then
				if (OUT_ciphertext = x"C4DF3176EF3059C8") then
					report "---------- Passed ----------";
				else
					report "---------- Failed ----------";
				end if;	
			else
				if (OUT_ciphertext = x"334c89d55c59c617") then
					report "---------- Passed ----------";
				else
					report "---------- Failed ----------";
				end if;	
			end if;
		end loop;			

      wait;
   end process;


END;
