
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_PRESENT IS
END tb_PRESENT;
 
ARCHITECTURE behavior OF tb_PRESENT IS 
 

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal data_in : std_logic_vector(63 downto 0) := (others => '0');
   signal Key     : std_logic_vector(79 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(63 downto 0);
   signal done : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN

   uut: entity work.PRESENT PORT MAP (
          clk => clk,
          reset => reset,
          data_in => data_in,
          Key => Key,
          data_out => data_out,
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

		reset	<= '1';
		data_in 	<= x"B205D6F95EED44CB";
		Key 		<= x"8F31A1F39DD7CEE38C3B";
		
      wait for clk_period*1;
	
		reset	<= '0';

		wait until rising_edge(clk) and (done = '1'); 
		
		if (data_out = x"759214987F6B5E7A") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		
		wait for clk_period*20.5;
		
		reset		<= '1';
		data_in 	<= x"EC49CDE913D6AC38";
		Key  		<= x"7F7F78C672C9AC3DE4B5";
		
      wait for clk_period*1;
	
		reset	<= '0';

		wait until rising_edge(clk) and (done = '1'); 
		
		if (data_out = x"DE2BBDF7663BEB22") then
			report "---------- Passed ----------";
		else
			report "---------- Failed ----------";
		end if;	
		


      -- insert stimulus here 

      wait;
   end process;

END;
