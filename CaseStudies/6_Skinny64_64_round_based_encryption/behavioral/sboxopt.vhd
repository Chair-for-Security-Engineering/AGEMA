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

-- IMPORTS
--------------------------------------------------------------------
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

   SIGNAL XX : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL YY : STD_LOGIC_VECTOR(3 DOWNTO 0);


   ALIAS X3 : STD_LOGIC IS XX(0);
   ALIAS X2 : STD_LOGIC IS XX(1);
   ALIAS X1 : STD_LOGIC IS XX(2);
   ALIAS X0 : STD_LOGIC IS XX(3);

   ALIAS Y3 : STD_LOGIC IS YY(0);
   ALIAS Y2 : STD_LOGIC IS YY(1);
   ALIAS Y1 : STD_LOGIC IS YY(2);
   ALIAS Y0 : STD_LOGIC IS YY(3);
      
   SIGNAL Q0, Q1, Q2, Q3, Q4, Q6, Q7 : STD_LOGIC;
   SIGNAL T0, T1, T2, T3             : STD_LOGIC;
   SIGNAL L0, L1, L2, L3             : STD_LOGIC;

BEGIN

   XX(0) <= NOT X(2);
   
   --XX(1) <= X(2) XOR X(3);
   XOR_i1 : ENTITY WORK.MyXOR    PORT MAP (A => X(2), B => X(3), C => XX(1));

  --XX(2) <= X(0) XOR X(2);
   XOR_i2 : ENTITY WORK.MyXOR    PORT MAP (A => X(0), B => X(2), C => XX(2));

   XX(3) <= X(1);

   -- q_0 = x_0 + x_1   
   XOR0 : ENTITY WORK.MyXOR    PORT MAP (A => X0, B => X1, C => Q0);
  
   -- q_1 = x_0 + x_2 
   XOR1 : ENTITY WORK.MyXOR    PORT MAP (A => X0, B => X2, C => Q1);
        
   -- t_0 = x_3 * q_1
   AND1 : ENTITY WORK.MyAND    PORT MAP (A => X3, B => Q1, C => T0);
      
   -- q_2 = x_0 + x_1 + t_0   
   XOR2 : ENTITY WORK.MyXOR    PORT MAP (A => Q0, B => T0, C => Q2);
   
   -- t_1 = x_0 * q_2
   AND2 : ENTITY WORK.MyAND    PORT MAP (A => X0, B => Q2, C => T1);
         
   -- q4 = 1 + x_0 + x_3
   XOR3 : ENTITY WORK.MyXNOR  PORT MAP (A => X0, B => X3, C => Q4);  
   
   -- t_2 = x_3 * q_4
   AND3 : ENTITY WORK.MyAND    PORT MAP (A => X3, B => Q4, C => T2);
               
   -- l_0 = t_1 + t_2
   XOR4 : ENTITY WORK.MyXOR    PORT MAP (A => T1, B => T2, C => L0);
   
   -- q_6 = x_1 + x_3
   XOR5 : ENTITY WORK.MyXOR    PORT MAP (A => X1, B => X3, C => Q6);
   
   -- q_7 = 1 + q_1 + q_6 + t_2
   XOR6 : ENTITY WORK.MyXNOR   PORT MAP (A => Q1, B => Q6, C => L1);
   XOR7 : ENTITY WORK.MyXOR    PORT MAP (A => L1, B => T2, C => Q7);
   
   -- t_3 = q_6 * q_7
   AND4 : ENTITY WORK.MyAND    PORT MAP (A => Q6, B => Q7, C => T3);
                     
   -- y_0 = x_0 + x_3 + l_0
   XOR8 : ENTITY WORK.MyXOR    PORT MAP (A => X0, B => X3, C => L2); 
   XOR9 : ENTITY WORK.MyXOR    PORT MAP (A => L0, B => L2, C => Y0);  
   
   -- y_1 = l_0 + t_3
   XOR10 : ENTITY WORK.MyXOR   PORT MAP (A => L0, B => T3, C => Y1); 
   
   -- y_2 = x_1 + t_0 + t_2
   XOR11 : ENTITY WORK.MyXOR   PORT MAP (A => X1, B => T0, C => L3); 
   XOR12 : ENTITY WORK.MyXOR   PORT MAP (A => L3, B => T2, C => Y2); 
   
   -- y_3 = x_2 + t_2
   XOR13 : ENTITY WORK.MyXOR   PORT MAP (A => X2, B => T2, C => Y3); 
   
   Y(0) <= YY(2);

   --Y(1) <= YY(1) XNOR YY(3);
   XOR_o1 : ENTITY WORK.MyXNOR    PORT MAP (A => YY(1), B => YY(3), C => Y(1));

   Y(2) <= NOT YY(0);
   Y(3) <= NOT YY(1);

END Behavioral;