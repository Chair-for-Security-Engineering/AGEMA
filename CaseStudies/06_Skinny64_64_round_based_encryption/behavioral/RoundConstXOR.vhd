
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RoundConstXOR is

	GENERIC ( size  : POSITIVE);
	PORT ( R_in0 	 : IN  STD_LOGIC_VECTOR ((size*16-1)  DOWNTO 0);
			 R_in1 	 : IN  STD_LOGIC_VECTOR (5  DOWNTO 0);
			 R_q 	 : OUT STD_LOGIC_VECTOR ((size*16-1)  DOWNTO 0);
		    const : IN  STD_LOGIC_VECTOR (3 DOWNTO 0) := (others => '0'));

end RoundConstXOR;

architecture Behavioral of RoundConstXOR is

SIGNAL tmp1: STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL tmp2: STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL tmp3: STD_LOGIC_VECTOR (7 DOWNTO 0);

begin

tmp1 <= R_in0(47 downto 44) & R_in0(63 downto 60);
tmp2 <= "00" & R_in1;


		AddConstXOR: ENTITY work.XOR_2n 
				GENERIC Map ( size => size, count => 2)
					PORT Map ( tmp1,tmp2,tmp3);
------------------------------------------------------------------------------------------------
					
			R_q(63 DOWNTO 60) <= tmp3(3 DOWNTO 0);
			R_q(59 DOWNTO 48) <= R_in0(59 DOWNTO 48);
			R_q(47 DOWNTO 44) <= tmp3(7 DOWNTO 4);
			R_q(43 DOWNTO 30) <= R_in0(43 DOWNTO 30);
			R_q(29) 	     	   <= NOT(R_in0(29));
			R_q(28 DOWNTO  0) <= R_in0(28 DOWNTO  0);
			
			

end Behavioral;

