
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.math_real.ALL;

ENTITY tb_SkinnyTop_HPC2_Pipeline_d2 IS
END tb_SkinnyTop_HPC2_Pipeline_d2;
 
ARCHITECTURE behavior OF tb_SkinnyTop_HPC2_Pipeline_d2 IS 
 
	constant fresh_size   : integer := 192;
	constant AddedLatency : integer := 4;


   --Inputs
	constant fresh_byte_size : integer := integer(ceil(real(fresh_size)/real(8)));

   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal Plaintext_s0 : std_logic_vector(63 downto 0) := (others => '0');
   signal Plaintext_s1 : std_logic_vector(63 downto 0) := (others => '0');
   signal Plaintext_s2 : std_logic_vector(63 downto 0) := (others => '0');
   signal Key_s0 : std_logic_vector(63 downto 0) := (others => '0');
   signal Key_s1 : std_logic_vector(63 downto 0) := (others => '0');
   signal Key_s2 : std_logic_vector(63 downto 0) := (others => '0');
	
   signal Plaintext : std_logic_vector(63 downto 0) := (others => '0');
   signal Key : std_logic_vector(63 downto 0) := (others => '0');

 	--Outputs
   signal Ciphertext_s0 : std_logic_vector(63 downto 0);
   signal Ciphertext_s1 : std_logic_vector(63 downto 0);
   signal Ciphertext_s2 : std_logic_vector(63 downto 0);
   signal Fresh     : std_logic_vector(8*fresh_byte_size-1 downto 0) := (others => '0');

   signal Mask_P1 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_P2 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_K1 : std_logic_vector(63 downto 0) := (others => '0');
   signal Mask_K2 : std_logic_vector(63 downto 0) := (others => '0');


   signal Ciphertext : std_logic_vector(63 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

    constant mask_byte_size : integer := fresh_byte_size+8*2+8*2;
 
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
    end GENERATE;

	 gen_3:
    for i in 0 to 7 GENERATE
        Mask_K1(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8*2+i);
        Mask_K2(8*(i+1)-1 downto 8*i) <= mm(fresh_byte_size+8*3+i);
    end GENERATE;


   uut: entity work.SkinnyTop_HPC2_Pipeline_d2 PORT MAP (
          clk => clk,
          rst => rst,
          Plaintext_s0 => Plaintext_s0,
          Plaintext_s1 => Plaintext_s1,
          Plaintext_s2 => Plaintext_s2,
          Key_s0 => Key_s0,
          Key_s1 => Key_s1,
          Key_s2 => Key_s2,
			 Fresh  => Fresh(fresh_size-1 downto 0),
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

		for i in 0 to AddedLatency loop
			if ((i mod 2) = 0) then
				Plaintext 	<= x"06034f957724d19d";
				Key 			<= x"f5269826fc681238";
			else
				Plaintext 	<= x"0000000000000000";
				Key 			<= x"0000000000000000";
			end if;
      
			wait for clk_period*1;
		end loop;	
	
		rst	<= '0';
		wait for clk_period*1;

		for i in 0 to AddedLatency loop
			wait until rising_edge(clk) and (done = '1'); 

			if ((i mod 2) = 0) then
				if (Ciphertext = x"bb39dfb2429b8ac7") then
					report "---------- Passed ----------";
				else
					report "---------- Failed ----------";
				end if;	
			else
				if (Ciphertext = x"e377bd614cccaed7") then
					report "---------- Passed ----------";
				else
					report "---------- Failed ----------";
				end if;	
			end if;
		end loop;			

      wait;
   end process;

END;
