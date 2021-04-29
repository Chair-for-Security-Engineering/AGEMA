
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity present is
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
			  data_in  : in  STD_LOGIC_VECTOR (63 downto 0);
           key      : in  STD_LOGIC_VECTOR (79 downto 0);
           data_out : out  STD_LOGIC_VECTOR (63 downto 0);
           done     : out  STD_LOGIC);
end present;

architecture dfl of present is

----------------------------------------------------------
-- component declaration
----------------------------------------------------------
component controler is
port(
	clk	: in std_logic;
	reset	: in std_logic;
	selSbox : out std_logic;
	ctrlData: out std_logic_vector(1 downto 0);
	ctrlKey : out std_logic_vector(1 downto 0);
	round : out std_logic_vector(4 downto 0);
  	done    : out std_logic;
	final   : out std_logic
);
end component controler;


component dataBody is
    Port ( clk : in  STD_LOGIC;
           ctrl : in  STD_LOGIC_VECTOR (1 downto 0);
           inputA : in  STD_LOGIC_VECTOR (63 downto 0);
           inputB : in  STD_LOGIC_VECTOR (3 downto 0);
           outputA : out  STD_LOGIC_VECTOR (3 downto 0);
			  outputB : out  STD_LOGIC_VECTOR (63 downto 0));
end component dataBody;

component keyschedule is
		Port ( clk : in  STD_LOGIC;
           ctrl : in  STD_LOGIC_VECTOR (1 downto 0);
			  counter : in STD_LOGIC_VECTOR(4 downto 0);
           inputA : in  STD_LOGIC_VECTOR (79 downto 0);
           inputB : in  STD_LOGIC_VECTOR (3 downto 0);
           outputA : out  STD_LOGIC_VECTOR (3 downto 0);
           outputB : out  STD_LOGIC_VECTOR (3 downto 0));
end component keyschedule;

----------------------------------------------------------
-- data signals
----------------------------------------------------------
signal sboxIn : STD_LOGIC_VECTOR (3 downto 0);
signal sboxOut : STD_LOGIC_VECTOR (3 downto 0);
signal roundkey, keyRegKS: STD_LOGIC_VECTOR (3 downto 0);
signal serialIn, state, stateXORroundkey: STD_LOGIC_VECTOR (3 downto 0);
signal intDone : STD_LOGIC;
signal final   : STD_LOGIC;

signal parallelState : STD_LOGIC_VECTOR (63 downto 0);
----------------------------------------------------------
-- control signals
----------------------------------------------------------
signal selSbox : std_logic;
signal counter : STD_LOGIC_VECTOR (4 downto 0);
signal ctrlData: STD_LOGIC_VECTOR (1 downto 0);
signal ctrlKey : STD_LOGIC_VECTOR (1 downto 0);

begin
----------------------------------------------------------
-- component instantiation
----------------------------------------------------------
----------------------------------------------------------
-- FSM
----------------------------------------------------------
fsm: controler
		port map(
			clk => clk,
			reset => reset,
			selSbox => selSbox,
			ctrlData => ctrlData,
			ctrlKey => ctrlKey,
			round => counter,
			done => intDone,
			final => final
		);

----------------------------------------------------------
-- STATE register
----------------------------------------------------------
stateFF: dataBody
    Port map ( clk => clk,
           ctrl => ctrlData,
           inputA => data_in,
           inputB => serialIn,
           outputA => state,
			  outputB => parallelState
			  );

----------------------------------------------------------
-- Key register
----------------------------------------------------------
keyFF: keyschedule
    Port map ( clk => clk,
           ctrl => ctrlKey,
			  counter => counter,
           inputA => key,
           inputB => sboxOut,
           outputA => roundkey,
           outputB => keyRegKS
			  );

----------------------------------------------------------
-- S-box component
----------------------------------------------------------
sboxInst: entity work.sbox
    Port map ( 
           X  => sboxIn,
           Y => sboxOut );
			  
----------------------------------------------------------
-- XOR sums for the S-Box input
----------------------------------------------------------
stateXORroundkey <= state XOR roundkey;
----------------------------------------------------------
-- Sbox input MUXes
----------------------------------------------------------

MUX_sboxin: entity work.MUX
Generic Map (size => 4)
Port Map (S => selSbox, D0 => stateXORroundkey, D1 => keyRegKS, Q => sboxIn);

MUX_serialIn: entity work.MUX
Generic Map (size => 4)
Port Map (S => intDone, D1 => stateXORroundkey, D0 => sboxOut, Q => serialIn);

				
----------------------------------------------------------
-- making of the output
----------------------------------------------------------

done <= final;
data_out <= parallelState;

end dfl;

