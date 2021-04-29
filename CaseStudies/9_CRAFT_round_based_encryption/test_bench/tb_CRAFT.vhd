
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_CRAFT IS
END tb_CRAFT;
 
ARCHITECTURE behavior OF tb_CRAFT IS 
 

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal Plaintext : std_logic_vector(63 downto 0) := (others => '0');
   signal Key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal Ciphertext : std_logic_vector(63 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN

   uut: entity work.CRAFT PORT MAP (
          clk => clk,
          rst => rst,
          Plaintext => Plaintext,
          Key => Key,
          Ciphertext => Ciphertext,
          done => done
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
      -- hold rst state for 100 ns.
      wait for clk_period;	

		rst	<= '1';
		Plaintext 	<= x"0123456789ABCDEF";
		Key 			<= x"18F4EEBDFCED7841D9E0E38CFE6A9405";
		
      wait for clk_period*1;
	
		rst	<= '0';

		wait until rising_edge(clk) and (done = '1'); 
		
		if (Ciphertext = x"614D03B82A8A2817") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		
		wait for clk_period*0.5;
		
		rst	<= '1';
		Plaintext 	<= (others => '0');
		
      wait for clk_period*1;
	
		rst	<= '0';

		wait until rising_edge(clk) and (done = '1'); 
		
		if (Ciphertext = x"a6410cd11943b1b7") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		


      -- insert stimulus here 

      wait;
   end process;

END;
