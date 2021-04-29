
-- IMPORTS
--------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MyXOR IS
   PORT (
      A     : IN  STD_LOGIC;
      B     : IN  STD_LOGIC;
      C     : OUT STD_LOGIC
   );
END MyXOR;

ARCHITECTURE Behavioral OF MyXOR IS
BEGIN
	C <= A XOR B;
END Behavioral;

--------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MyXNOR IS
   PORT (
      A     : IN  STD_LOGIC;
      B     : IN  STD_LOGIC;
      C     : OUT STD_LOGIC
   );
END MyXNOR;

ARCHITECTURE Behavioral OF MyXNOR IS
BEGIN
	C <= NOT (A XOR B);
END Behavioral;

--------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MyAND IS
   PORT (
      A     : IN  STD_LOGIC;
      B     : IN  STD_LOGIC;
      C     : OUT STD_LOGIC
   );
END MyAND;

ARCHITECTURE Behavioral OF MyAND IS
BEGIN
	C <= A AND B;
END Behavioral;
	
--------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- ENTITY
--------------------------------------------------------------------
ENTITY sbox IS
   PORT (
      X     : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
      Y     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
END sbox;

-- ARCHITECTURE
----------------------------------------------------------------------------------
ARCHITECTURE Behavioral OF sbox IS

   SIGNAL O : STD_LOGIC_VECTOR(3 DOWNTO 0);

   ALIAS X3 : STD_LOGIC IS X(0);
   ALIAS X2 : STD_LOGIC IS X(1);
   ALIAS X1 : STD_LOGIC IS X(2);
   ALIAS X0 : STD_LOGIC IS X(3);

   ALIAS Y3 : STD_LOGIC IS Y(0);
   ALIAS Y2 : STD_LOGIC IS Y(1);
   ALIAS Y1 : STD_LOGIC IS Y(2);
   ALIAS Y0 : STD_LOGIC IS Y(3);
      
   SIGNAL Q0, Q1, Q2, Q3, Q4, Q6, Q7 : STD_LOGIC;
   SIGNAL T0, T1, T2, T3             : STD_LOGIC;
   SIGNAL L0, L1, L2, L3, L4, L5, L7, L8 : STD_LOGIC;

BEGIN

   -- q_0 = 1 + x_1 + x_2
   XOR1 : ENTITY WORK.MyXOR    PORT MAP (A => X1, B => X2, C => L0);
   Q0 <= NOT L0;
  
   -- q_1 = 1 + x_0 
   Q1 <= NOT X0;
   
   -- q_2 = 1 + x_0 + x_2 + x_3 + t_0   
   XOR2 : ENTITY WORK.MyXOR    PORT MAP (A => X2, B => X3, C => L1);
   XOR3 : ENTITY WORK.MyXOR    PORT MAP (A => L1, B => X0, C => L2); 
   XOR16 : ENTITY WORK.MyXNOR  PORT MAP (A => T0, B => L2, C => Q2);  
   
   -- q_3 = x_0 + x_1 + x_2 + x_3
   XOR4 : ENTITY WORK.MyXOR    PORT MAP (A => X0, B => X3, C => L3);
   XOR5 : ENTITY WORK.MyXOR    PORT MAP (A => L3, B => L0, C => Q3);
   
   -- q_4 = 1 + x_2
   Q4 <= NOT X2;
   
   -- q_6 = 1 + x_0 + x_2 + t_0 + t_2
   XOR6 : ENTITY WORK.MyXOR    PORT MAP (A => X0, B => X2, C => L4);
   XOR7 : ENTITY WORK.MyXOR    PORT MAP (A => T0, B => T2, C => L5);
   XOR8 : ENTITY WORK.MyXNOR   PORT MAP (A => L4, B => L5, C => Q6);
   
   -- q_7 = x_1 + x_2 + x_3
   XOR9 : ENTITY WORK.MyXOR    PORT MAP (A => L1, B => X1, C => Q7);
      
   -- t_0 = q_0 * q_1
   AND1 : ENTITY WORK.MyAND    PORT MAP (A => Q0, B => Q1, C => T0);
      
   -- t_1 = q_2 * q_3
   AND2 : ENTITY WORK.MyAND    PORT MAP (A => Q2, B => Q3, C => T1);
   
   -- t_2 = q_4 * x_1
   AND3 : ENTITY WORK.MyAND    PORT MAP (A => Q4, B => X1, C => T2);
   
   -- t_3 = q_6 * q_7
   AND4 : ENTITY WORK.MyAND    PORT MAP (A => Q6, B => Q7, C => T3);
   
   -- y_0 = x_3 + t_0 + t_2 + t_3
   XOR10 : ENTITY WORK.MyXOR    PORT MAP (A => L5, B => T3, C => L7);
   XOR11 : ENTITY WORK.MyXOR    PORT MAP (A => X3, B => L7, C => Y0);
   
   -- y_1 = x_2 + x_3 + t_0 + t_1 + t_2   
   XOR12 : ENTITY WORK.MyXOR    PORT MAP (A => L5, B => T1, C => L8);
   XOR13 : ENTITY WORK.MyXOR    PORT MAP (A => L1, B => L8, C => Y1);
      
   -- y_2 = x_0 + x_2 + t_3
   XOR14 : ENTITY WORK.MyXOR    PORT MAP (A => L4, B => T3, C => Y2);
   
   -- y_3 = x_0 + x_3 + t_2
   XOR15 : ENTITY WORK.MyXOR    PORT MAP (A => L3, B => T2, C => Y3);

END Behavioral;