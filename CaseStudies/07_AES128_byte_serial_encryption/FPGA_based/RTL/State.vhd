--Template for state register with two shifting directions
-- MixColumns is included and requires 4 clock cycles, 1 for each column
-- S00 first, then S01
--    +---+  +---+  +---+  +---+
--  <-|S00|<-|S01|<-|S02|<-|S03|<-
--    +---+  +---+  +---+  +---+
--    +---+  +---+  +---+  +---+
--  <-|S10|<-|S11|<-|S12|<-|S13|<-
--    +---+  +---+  +---+  +---+
--    +---+  +---+  +---+  +---+
--  <-|S20|<-|S21|<-|S22|<-|S23|<-
--    +---+  +---+  +---+  +---+
--    +---+  +---+  +---+  +---+
--  <-|S30|<-|S31|<-|S32|<-|S33|<-
--    +---+  +---+  +---+  +---+
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity State is
	port(
		clk	: in std_logic;
		selSR: in std_logic;
		selMC: in std_logic;
		inputPar : in std_logic_vector(127 downto 0);
		nReset   : in std_logic;
		inMC: in std_logic_vector(31 downto 0);
		intFinal : in std_logic;
		SboxOut  : in std_logic_vector(7 downto 0);
		StateOutXORroundKey : in std_logic_vector(7 downto 0);
		output: out std_logic_vector(7 downto 0);
		outMC: out std_logic_vector(31 downto 0);
		outPar: out std_logic_vector(127 downto 0)
		);

end entity State;


architecture dfl of State is

	signal inS00ser, inS01ser, inS02ser, inS03ser 	: std_logic_vector(7 downto 0);
	signal inS00par, inS01par, inS02par, inS03par 	: std_logic_vector(7 downto 0);
	signal inS10ser, inS11ser, inS12ser, inS13ser 	: std_logic_vector(7 downto 0);
	signal inS10par, inS11par, inS12par, inS13par 	: std_logic_vector(7 downto 0);
	signal inS20ser, inS21ser, inS22ser, inS23ser 	: std_logic_vector(7 downto 0);
	signal inS20par, inS21par, inS22par, inS23par 	: std_logic_vector(7 downto 0);
	signal inS30ser, inS31ser, inS32ser, inS33ser 	: std_logic_vector(7 downto 0);
	signal inS30par, inS31par, inS32par, inS33par 	: std_logic_vector(7 downto 0);
	
	signal outS00ser, outS01ser, outS02ser, outS03ser 	: std_logic_vector(7 downto 0);
	signal outS00par, outS01par, outS02par, outS03par 	: std_logic_vector(7 downto 0);
	signal outS10ser, outS11ser, outS12ser, outS13ser 	: std_logic_vector(7 downto 0);
	signal outS10par, outS11par, outS12par, outS13par 	: std_logic_vector(7 downto 0);
	signal outS20ser, outS21ser, outS22ser, outS23ser 	: std_logic_vector(7 downto 0);
	signal outS20par, outS21par, outS22par, outS23par 	: std_logic_vector(7 downto 0);
	signal outS30ser, outS31ser, outS32ser, outS33ser 	: std_logic_vector(7 downto 0);
	signal outS30par, outS31par, outS32par, outS33par 	: std_logic_vector(7 downto 0);

component reg is
	generic (NBITS_D0: integer;
		 NBITS_D1: integer);
	port(
		clk	: in std_logic;
		sel	: in std_logic;
		D0	: in std_logic_vector(NBITS_D0 - 1 downto 0);
		D1	: in std_logic_vector(NBITS_D1 - 1 downto 0);
		Q0	: out std_logic_vector(NBITS_D0 -1 downto 0);
		Q1	: out std_logic_vector(NBITS_D1 -1 downto 0)
		);
end component reg;

	type BYTE_ARRAY is array (integer range <>) of std_logic_vector(7 downto 0);
	signal inputArray  : BYTE_ARRAY(15 downto 0);
	signal StateArray  : std_logic_vector(127 downto 0);
	
	signal outS10ser_MC, outS20ser_MC, outS30ser_MC, input_MC : std_logic_vector(7 downto 0);

   signal input : std_logic_vector(7 downto 0);

begin

	GEN : FOR I IN 0 TO 15 GENERATE	
		inputArray(I) <= inputPar(127-I*8 downto 120-I*8);
	END GENERATE;
  
-----------------------------------------------
--Row 0 
-----------------------------------------------
S00reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS00ser,
  		D1 => inS00par,
      	Q0 => outS00ser,
      	Q1 => outS00par
		);
S01reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS01ser,
  		D1 => inS01par,
      	Q0 => outS01ser,
      	Q1 => outS01par
		);
S02reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS02ser,
  		D1 => inS02par,
      	Q0 => outS02ser,
      	Q1 => outS02par
		);
S03reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS03ser,
  		D1 => inS03par,
      	Q0 => outS03ser,
      	Q1 => outS03par
		);
-----------------------------------------------
--Row 1
-----------------------------------------------
S10reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS10ser,
  		D1 => inS10par,
      	Q0 => outS10ser,
      	Q1 => outS10par
		);
S11reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS11ser,
  		D1 => inS11par,
      	Q0 => outS11ser,
      	Q1 => outS11par
		);
S12reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS12ser,
  		D1 => inS12par,
      	Q0 => outS12ser,
      	Q1 => outS12par
		);
S13reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS13ser,
  		D1 => inS13par,
      	Q0 => outS13ser,
      	Q1 => outS13par
		);
-----------------------------------------------
--Row 2
-----------------------------------------------
S20reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS20ser,
  		D1 => inS20par,
      	Q0 => outS20ser,
      	Q1 => outS20par
		);
S21reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS21ser,
  		D1 => inS21par,
      	Q0 => outS21ser,
      	Q1 => outS21par
		);
S22reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS22ser,
  		D1 => inS22par,
      	Q0 => outS22ser,
      	Q1 => outS22par
		);
S23reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS23ser,
  		D1 => inS23par,
      	Q0 => outS23ser,
      	Q1 => outS23par
		);
-----------------------------------------------
--Row 3
-----------------------------------------------
S30reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS30ser,
  		D1 => inS30par,
      	Q0 => outS30ser,
      	Q1 => outS30par
		);
S31reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS31ser,
  		D1 => inS31par,
      	Q0 => outS31ser,
      	Q1 => outS31par
		);
S32reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS32ser,
  		D1 => inS32par,
      	Q0 => outS32ser,
      	Q1 => outS32par
		);
S33reg: reg
	generic map(NBITS_D0=>8,
				NBITS_D1=>8)
	port map(
		clk => clk,
		sel => selSR,
      	D0 => inS33ser,
  		D1 => inS33par,
      	Q0 => outS33ser,
      	Q1 => outS33par
		);

-----------------------------------------------
--8-bit horizontal Wiring, 1 MUX per Row for MC
-----------------------------------------------
--Row 0 
-----------------------------------------------
MUX_inS00ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(0), D1 => outS01ser, Q => inS00ser);
MUX_inS01ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(1), D1 => outS02ser, Q => inS01ser);
MUX_inS02ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(2), D1 => outS03ser, Q => inS02ser);

MUX_outS10_MC: ENTITY work.MUX Generic Map (size => 8) Port Map (S => selMC,  D0 => outS10ser,     D1 => inMC(31 downto 24), Q => outS10ser_MC);
MUX_inS03ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(3), D1 => outS10ser_MC,       Q => inS03ser);

-----------------------------------------------
--Row 1
-----------------------------------------------

MUX_inS10ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(4), D1 => outS11ser, Q => inS10ser);
MUX_inS11ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(5), D1 => outS12ser, Q => inS11ser);
MUX_inS12ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(6), D1 => outS13ser, Q => inS12ser);

MUX_outS20_MC: ENTITY work.MUX Generic Map (size => 8) Port Map (S => selMC,  D0 => outS20ser,     D1 => inMC(23 downto 16), Q => outS20ser_MC);
MUX_inS13ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(7), D1 => outS20ser_MC,       Q => inS13ser);

-----------------------------------------------
--Row 2
-----------------------------------------------

MUX_inS20ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(8),  D1 => outS21ser, Q => inS20ser);
MUX_inS21ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(9),  D1 => outS22ser, Q => inS21ser);
MUX_inS22ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(10), D1 => outS23ser, Q => inS22ser);

MUX_outS30_MC: ENTITY work.MUX Generic Map (size => 8) Port Map (S => selMC,  D0 => outS30ser,      D1 => inMC(15 downto  8), Q => outS30ser_MC);
MUX_inS23ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(11), D1 => outS30ser_MC,       Q => inS23ser);

-----------------------------------------------
--Row 3 
-----------------------------------------------

MUX_inS30ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(12), D1 => outS31ser, Q => inS30ser);
MUX_inS31ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(13), D1 => outS32ser, Q => inS31ser);
MUX_inS32ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset, D0 => inputArray(14), D1 => outS33ser, Q => inS32ser);


--MUX_StateIn:   ENTITY work.MUX Generic Map (size => 8) Port Map (S => intFinal, D0 => SboxOut,        D1 => StateOutXORroundKey, Q => input);
--MUX_input_MC:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => selMC,    D0 => input,          D1 => inMC(7  downto  0),  Q => input_MC);

MUX_inS33ser:  ENTITY work.MUX Generic Map (size => 8) Port Map (S => nReset,   D0 => inputArray(15), D1 => input_MC,            Q => inS33ser);

gen33ser: for i in 0 to 7 generate
	Inst1 : LUT5 generic map (INIT => X"AAAAF0CC")
	port map (
		I0 => inMC(i),
		I1 => SboxOut(i),
		I2 => StateOutXORroundKey(i),
		I3 => intFinal,
		I4 => selMC,
		O  => input_MC(i));
end generate;




-----------------------------------------------
--8-bit vertical Wiring
-----------------------------------------------
--Row 0 no shifting
-----------------------------------------------
inS00par <= outS00par;
inS01par <= outS01par;
inS02par <= outS02par;
inS03par <= outS03par;
-----------------------------------------------
--Row 1 left shift by 1 
-----------------------------------------------
inS10par <= outS11par;
inS11par <= outS12par;
inS12par <= outS13par;
inS13par <= outS10par;
-----------------------------------------------
--Row 2 left shift by 2 
-----------------------------------------------
inS20par <= outS22par;
inS21par <= outS23par;
inS22par <= outS20par;
inS23par <= outS21par;
-----------------------------------------------
--Row 3 left shift by 3 
-----------------------------------------------
inS30par <= outS33par;
inS31par <= outS30par;
inS32par <= outS31par;
inS33par <= outS32par;

-----------------------------------------------
--output Wiring 
-----------------------------------------------
outMC <= outS00ser&outS10ser&outS20ser&outS30ser;

output <= outS00ser;


outPar <= outS00par & outS01par & outS02par & outS03par & 
          outS10par & outS11par & outS12par & outS13par & 
			 outS20par & outS21par & outS22par & outS23par & 
			 outS30par & outS31par & outS32par & outS33par;

end architecture;
