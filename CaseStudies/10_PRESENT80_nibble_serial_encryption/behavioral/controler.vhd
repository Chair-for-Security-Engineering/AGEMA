library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controler is
port(
	clk	: in std_logic;
	reset	: in std_logic;
	selSbox : out std_logic;
	ctrlData: out std_logic_vector(1 downto 0);
	ctrlKey : out std_logic_vector(1 downto 0);
	round : out std_logic_vector(4 downto 0);
  	done    : out std_logic;
	final   : out std_logic);
end entity controler;

	
architecture fsm of controler is

----------------------------------------------------------
-- component declaration
----------------------------------------------------------

component counter is
	generic(NBITS: integer);
	port(
		clk	: in std_logic;
		n_reset	: in std_logic;
		en      : in std_logic;
		q	: out std_logic_vector(NBITS - 1 downto 0)
		);
end component counter;

----------------------------------------------------------
-- finite state stuff
----------------------------------------------------------
	
	type ps_states is (S_SBOX, S_PLAYER_Key, S_FINISHED, S_DONE);
 
  	signal ps_state  		: ps_states;
  	signal next_state 		: ps_states;

----------------------------------------------------------
-- signal declaration
----------------------------------------------------------

signal countRound  : std_logic_vector(4 downto 0);
signal countSerial : std_logic_vector(3 downto 0);
signal en_countRound : std_logic;
signal rst_countRound : std_logic;
signal selData : std_logic;
signal selKey  : std_logic;
signal en_countSerial, rst_countSerial : std_logic;
signal rst_countSerialInt              : std_logic;

begin

----------------------------------------------------------
-- component instantiation
----------------------------------------------------------

cnt_rnd: counter
  generic map(NBITS => 5)
  port map(
            clk => clk,
            n_reset => rst_countRound,
            en => en_countRound,
            q => countRound
            );
              
cnt_ser: counter
  generic map(NBITS => 4)
  port map(
            clk => clk,
            n_reset => rst_countSerial,
            en => en_countSerial,
            q => countSerial
            );
  

rst_countRound  <= not reset;
rst_countSerial <= '0' WHEN reset = '1' ELSE rst_countSerialInt;

----------------------------------------------------------
-- finite state stuff
----------------------------------------------------------

ps_state_change:	process(clk, next_state, reset)
begin
	if(clk'event and clk = '1') then
		if (reset = '1') then
			ps_state <= S_SBOX;
		else
			ps_state <= next_state;
		end if;
	end if;
end process;


----------------------------------------------------------
-- FSM
----------------------------------------------------------

ps_state_compute:  process(ps_state, reset, countSerial, countRound)
begin
----------------------------------------------------------
-- finite state stuff
----------------------------------------------------------
next_state <= ps_state;
round <= countRound;
rst_countSerialInt <= '1';
en_countRound   <= '0';
en_countSerial  <= '0';

selSbox <= '0';

selData   <= '0';

selKey 	<= '0';

done  <= '0';
final <= '0';

case ps_state is

	when S_SBOX=>
		en_countSerial <= '1';
		if(countSerial="1111") then --SER_CLK
			en_countRound <= '1';
			next_state <= S_PLAYER_Key;
		end if;

	when S_PLAYER_Key=>
		--state registers in parallel
		--key register gets the Sbox output
		selData 	<= '1';
		selKey 	<= '1';
		selSbox  <= '1';
		rst_countSerialInt <= '0';

		if(countRound="11111") then
		  next_state <= S_FINISHED;
		else
		  next_state <= S_SBOX;
		end if;

	when S_FINISHED=>
		en_countSerial <= '1';
		done <= '1';
		if(countSerial="1111") then--SER_CLK
			next_state <= S_DONE;
		end if;
          
	when S_DONE =>
      final <= '1';
          
   when others =>
      next_state <= S_SBOX;
        
end case;
        
end process;

--ctrl = MUX&SEL
ctrlData <= "11" WHEN reset = '1' ELSE '0' & selData;
ctrlKey  <= "11" WHEN reset = '1' ELSE '0' & selKey;
end;
