
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_SkinnyTop IS
END tb_SkinnyTop;
 
ARCHITECTURE behavior OF tb_SkinnyTop IS 
 

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal Plaintext : std_logic_vector(63 downto 0) := (others => '0');
   signal Key : std_logic_vector(63 downto 0) := (others => '0');

 	--Outputs
   signal Ciphertext : std_logic_vector(63 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN

   uut: entity work.SkinnyTop PORT MAP (
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
		Plaintext 	<= x"06034f957724d19d";
		Key 			<= x"f5269826fc681238";
      wait for clk_period*1;
	
		rst	<= '0';

      wait until rising_edge(clk) and (done = '1'); 
		
		if (Ciphertext = x"bb39dfb2429b8ac7") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		

      -- insert stimulus here 

      wait;
   end process;

END;
