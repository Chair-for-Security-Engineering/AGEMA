
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

USE IEEE.NUMERIC_STD.ALL;

ENTITY counter4Bit IS
	PORT ( clk     : IN  STD_LOGIC;
			 reset   : IN  STD_LOGIC;
			 q       : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END counter4bit;

ARCHITECTURE behavioral OF counter4Bit IS

	signal count : unsigned (3 downto 0);

begin

	process(clk, reset) 
	begin
		if rising_edge(clk) then
			if reset='1' then 
				count <= "0000"; 
			else
				count <= count + 1;
			end if;
		end if;
	end process; 

	q <= std_logic_vector(count);	
	
	
END behavioral;

