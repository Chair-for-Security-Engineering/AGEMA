
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MixColumnSerial is
    Port ( IN_column_element_0  : in  STD_LOGIC_VECTOR (3 downto 0);
           IN_column_element_1  : in  STD_LOGIC_VECTOR (3 downto 0);
           IN_column_element_2  : in  STD_LOGIC_VECTOR (3 downto 0);
           IN_column_element_3  : in  STD_LOGIC_VECTOR (3 downto 0);
           OUT_column_element_0 : out STD_LOGIC_VECTOR (3 downto 0);
           OUT_column_element_1 : out STD_LOGIC_VECTOR (3 downto 0);
           OUT_column_element_2 : out STD_LOGIC_VECTOR (3 downto 0);
           OUT_column_element_3 : out STD_LOGIC_VECTOR (3 downto 0));
end MixColumnSerial;

architecture Behavioral of MixColumnSerial is

  SIGNAL a_1_in, a_1_out : STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL a_2_in, a_2_out : STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL a_3_in, a_3_out : STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL a_4_in, a_4_out : STD_LOGIC_VECTOR(15 downto 0);
  
  SIGNAL element_0_x4_1, element_1_x1_1, element_2_x2_1, element_3_x2_1 : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL element_0_x4_2, element_1_x1_2, element_2_x2_2, element_3_x2_2 : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL element_0_x4_3, element_1_x1_3, element_2_x2_3, element_3_x2_3 : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL element_0_x4_4, element_1_x1_4, element_2_x2_4, element_3_x2_4 : STD_LOGIC_VECTOR(3 downto 0);

begin


  ------------- Input Mapping -------------
  a_1_in <= IN_column_element_3 & IN_column_element_2 & IN_column_element_1 & IN_column_element_0;
  ------------- Input Mapping -------------
  
----------- Compute Shifted Values -----------
  element_0_x4_1 <= (a_1_in(1 downto 0) & "00") xor ('0' & a_1_in(3) & a_1_in(3) & '0') xor ('0' & '0' & a_1_in(2) & a_1_in(2));
  element_1_x1_1 <= a_1_in(7 downto 4);
  element_2_x2_1 <= (a_1_in(10 downto 8) & '0') xor ('0' & '0' & a_1_in(11) & a_1_in(11));
  element_3_x2_1 <= (a_1_in(14 downto 12) & '0') xor ('0' & '0' & a_1_in(15) & a_1_in(15));
  ----------- Compute Shifted Values -----------

  ----------- Compute New Column -----------
  a_1_out(3 downto 0) <= a_1_in(7 downto 4);
  a_1_out(7 downto 4) <= a_1_in(11 downto 8);
  a_1_out(11 downto 8) <= a_1_in(15 downto 12);
  a_1_out(15 downto 12) <= element_0_x4_1 xor element_1_x1_1 xor element_2_x2_1 xor element_3_x2_1;

----------- Compute Shifted Values -----------
  element_0_x4_2 <= (a_2_in(1 downto 0) & "00") xor ('0' & a_2_in(3) & a_2_in(3) & '0') xor ('0' & '0' & a_2_in(2) & a_2_in(2));
  element_1_x1_2 <= a_2_in(7 downto 4);
  element_2_x2_2 <= (a_2_in(10 downto 8) & '0') xor ('0' & '0' & a_2_in(11) & a_2_in(11));
  element_3_x2_2 <= (a_2_in(14 downto 12) & '0') xor ('0' & '0' & a_2_in(15) & a_2_in(15));
  ----------- Compute Shifted Values -----------

  ----------- Compute New Column -----------
  a_2_out(3 downto 0) <= a_2_in(7 downto 4);
  a_2_out(7 downto 4) <= a_2_in(11 downto 8);
  a_2_out(11 downto 8) <= a_2_in(15 downto 12);
  a_2_out(15 downto 12) <= element_0_x4_2 xor element_1_x1_2 xor element_2_x2_2 xor element_3_x2_2;

----------- Compute Shifted Values -----------
  element_0_x4_3 <= (a_3_in(1 downto 0) & "00") xor ('0' & a_3_in(3) & a_3_in(3) & '0') xor ('0' & '0' & a_3_in(2) & a_3_in(2));
  element_1_x1_3 <= a_3_in(7 downto 4);
  element_2_x2_3 <= (a_3_in(10 downto 8) & '0') xor ('0' & '0' & a_3_in(11) & a_3_in(11));
  element_3_x2_3 <= (a_3_in(14 downto 12) & '0') xor ('0' & '0' & a_3_in(15) & a_3_in(15));
  ----------- Compute Shifted Values -----------

  ----------- Compute New Column -----------
  a_3_out(3 downto 0) <= a_3_in(7 downto 4);
  a_3_out(7 downto 4) <= a_3_in(11 downto 8);
  a_3_out(11 downto 8) <= a_3_in(15 downto 12);
  a_3_out(15 downto 12) <= element_0_x4_3 xor element_1_x1_3 xor element_2_x2_3 xor element_3_x2_3;


----------- Compute Shifted Values -----------
  element_0_x4_4 <= (a_4_in(1 downto 0) & "00") xor ('0' & a_4_in(3) & a_4_in(3) & '0') xor ('0' & '0' & a_4_in(2) & a_4_in(2));
  element_1_x1_4 <= a_4_in(7 downto 4);
  element_2_x2_4 <= (a_4_in(10 downto 8) & '0') xor ('0' & '0' & a_4_in(11) & a_4_in(11));
  element_3_x2_4 <= (a_4_in(14 downto 12) & '0') xor ('0' & '0' & a_4_in(15) & a_4_in(15));
  ----------- Compute Shifted Values -----------

  ----------- Compute New Column -----------
  a_4_out(3 downto 0) <= a_4_in(7 downto 4);
  a_4_out(7 downto 4) <= a_4_in(11 downto 8);
  a_4_out(11 downto 8) <= a_4_in(15 downto 12);
  a_4_out(15 downto 12) <= element_0_x4_4 xor element_1_x1_4 xor element_2_x2_4 xor element_3_x2_4;

  ------------- Output Mapping -------------
  OUT_column_element_0 <= a_4_out(3 downto 0);
  OUT_column_element_1 <= a_4_out(7 downto 4);
  OUT_column_element_2 <= a_4_out(11 downto 8);
  OUT_column_element_3 <= a_4_out(15 downto 12);
  ------------- Output Mapping -------------
  
  a_2_in <= a_1_out;
  a_3_in <= a_2_out;
  a_4_in <= a_3_out;
  

end Behavioral;