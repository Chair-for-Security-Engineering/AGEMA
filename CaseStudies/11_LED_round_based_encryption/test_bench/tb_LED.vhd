
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_LED IS
END tb_LED;
 
ARCHITECTURE behavior OF tb_LED IS 
 

   --Inputs
   signal clk : std_logic := '0';
   signal IN_reset : std_logic := '0';
   signal IN_plaintext : std_logic_vector(63 downto 0) := (others => '0');
   signal IN_key     : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal OUT_ciphertext : std_logic_vector(63 downto 0);
   signal OUT_done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN

   uut: entity work.LED PORT MAP (
          clk => clk,
          IN_reset => IN_reset,
          IN_plaintext => IN_plaintext,
          IN_key => IN_key,
          OUT_ciphertext => OUT_ciphertext,
          OUT_done => OUT_done
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
      -- hold IN_reset state for 100 ns.
      wait for clk_period;	

		IN_reset	<= '1';
		IN_plaintext 	<= x"B9B11902E6C14E39";
		IN_key 			<= x"F589DA3F6BB38D23E776CDE49EC7CB62";
		
      wait for clk_period*1;
	
		IN_reset	<= '0';

		wait until rising_edge(clk) and (OUT_done = '1'); 
		
		if (OUT_ciphertext = x"C4DF3176EF3059C8") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		
		wait for clk_period*20.5;
		
		IN_reset		<= '1';
		IN_plaintext 	<= x"0000000000000000";
		
      wait for clk_period*1;
	
		IN_reset	<= '0';

		wait until rising_edge(clk) and (OUT_done = '1'); 
		
		if (OUT_ciphertext = x"334c89d55c59c617") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		


      -- insert stimulus here 

      wait;
   end process;

END;
