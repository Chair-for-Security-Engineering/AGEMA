
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_AES IS
END tb_AES;
 
ARCHITECTURE behavior OF tb_AES IS 
 

   --Inputs
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal plaintext : std_logic_vector(127 downto 0) := (others => '0');
   signal key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal ciphertext : std_logic_vector(127 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN

   uut: entity work.AES PORT MAP (
          clk => clk,
          start => start,
          plaintext => plaintext,
          key => key,
          ciphertext => ciphertext,
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
      -- hold start state for 100 ns.
      wait for clk_period;	

		start	<= '1';

      wait for clk_period*1;
	
		plaintext 	<= x"328831E0435A3137F6309807A88DA234";
		key 			<= x"2B28AB097EAEF7CF15D2154F16A6883C";
		start	<= '0';
      wait for clk_period*1;

		plaintext 	<= (others => '0');
		key 			<= (others => '0');

		wait until rising_edge(clk) and (done = '1'); 
		
		if (ciphertext = x"3902DC1925DC116A8409850B1DFB9732") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		
      wait for clk_period*20.5;

		start	<= '1';
		plaintext 	<= (others => '1');
		key 			<= (others => '1');

      wait for clk_period*1;

		plaintext 	<= (others => '0');
		key 			<= (others => '0');
		start	<= '0';
      wait for clk_period*1;
		
		plaintext 	<= (others => '1');
		key 			<= (others => '1');

		wait until rising_edge(clk) and (done = '1'); 
		
		if (ciphertext = x"66ef88cae98a4c344b2cfa2bd43b592e") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	

      -- insert stimulus here 

      wait;
   end process;

END;
