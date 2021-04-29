
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_Midori64 IS
END tb_Midori64;
 
ARCHITECTURE behavior OF tb_Midori64 IS 
 

   --DataIns
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enc_dec : std_logic := '0';
   signal DataIn : std_logic_vector(63 downto 0) := (others => '0');
   signal key     : std_logic_vector(127 downto 0) := (others => '0');

 	--DataOuts
   signal DataOut : std_logic_vector(63 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN

   uut: entity work.Midori64 PORT MAP (
          clk => clk,
          reset => reset,
			 enc_dec => enc_dec,
          DataIn => DataIn,
          key => key,
          DataOut => DataOut,
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
      -- hold reset state for 100 ns.
      wait for clk_period;	
		enc_dec <= '0';
		
		reset		<= '1';
		DataIn 	<= x"42c20fd3b586879e";
		key 		<= x"687ded3b3c85b3f35b1009863e2a8cbf";
		
      wait for clk_period*1;
	
		reset	<= '0';

		wait until rising_edge(clk) and (done = '1'); 
		
		if (DataOut = x"66bcdc6270d901cd") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		
		wait for clk_period*20.5;
		
		reset		<= '1';
		DataIn 	<= x"0000000000000000";
		
      wait for clk_period*1;
	
		reset	<= '0';

		wait until rising_edge(clk) and (done = '1'); 
		
		if (DataOut = x"36f32dcf124ab057") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		
		wait for clk_period*20.5;
		enc_dec <= '1';

		reset		<= '1';
		DataIn 	<= x"66bcdc6270d901cd";
		key 		<= x"687ded3b3c85b3f35b1009863e2a8cbf";
		
      wait for clk_period*1;
	
		reset	<= '0';

		wait until rising_edge(clk) and (done = '1'); 
		
		if (DataOut = x"42c20fd3b586879e") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		
		wait for clk_period*20.5;
		
		reset		<= '1';
		DataIn 	<= x"36f32dcf124ab057";
		
      wait for clk_period*1;
	
		reset	<= '0';

		wait until rising_edge(clk) and (done = '1'); 
		
		if (DataOut = x"0000000000000000") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	

      -- insert stimulus here 

      wait;
   end process;

END;
