
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LED_128 is
    Port ( IN_plaintext     : in  STD_LOGIC_VECTOR (63 downto 0);
           IN_key           : in  STD_LOGIC_VECTOR (127 downto 0);
           IN_reset         : in  STD_LOGIC;
           CLK              : in  STD_LOGIC;
           OUT_ciphertext   : out STD_LOGIC_VECTOR (63 downto 0);
           OUT_roundconstant: out STD_LOGIC_VECTOR ( 5 downto 0));
end LED_128;

architecture Behavioral of LED_128 is

  SIGNAL  cipherstate : STD_LOGIC_VECTOR(63 downto 0);
  SIGNAL  addroundkey_out, addroundkey_tmp, addconst_out, subcells_out, mixcolumns_out : STD_LOGIC_VECTOR(63 downto 0);
  SIGNAL  roundkey_1, roundkey_2, current_roundkey, optional_key_add : STD_LOGIC_VECTOR(63 downto 0);
  SIGNAL  keylength : STD_LOGIC_VECTOR(7 downto 0);
  SIGNAL  roundconstant : STD_LOGIC_VECTOR(5 downto 0);
  SIGNAL  ks : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL  addkey : STD_LOGIC;
  
  signal roundconstant_001001 : std_logic;
  signal ks_0000              : std_logic;
  SIGNAL state0, state1 : STD_LOGIC_VECTOR(63 downto 0);

begin

  ------------ Set Key Length for AddConstants ------------
  keylength <= "10000000";
  ------------ Set Key Length for AddConstants ------------

  ------------ State Change ------------
  
  roundkey_1 <= IN_key(63 downto 0);
  roundkey_2 <= IN_key(127 downto 64);
  
  roundconstant_001001 <= '1' when roundconstant = "001001" else '0';
  
  MUX_state0: entity work.MUX
  Generic Map (size => 64)
  Port Map (S => roundconstant_001001, D1 => addroundkey_out, D0 => mixcolumns_out, Q => state0);
  
  MUX_state1: entity work.MUX
  Generic Map (size => 64)
  Port Map (S => IN_reset, D0 => state0, D1 => IN_plaintext, Q => state1);
  
  
  FSM_core: process(CLK, IN_reset) begin
    if rising_edge(CLK) then
      -- update cipherstate
      cipherstate <= state1;
    
      if IN_reset='0' then
			-- update constants
			roundconstant <= roundconstant(4 downto 0) & ('1' xor roundconstant(5) xor roundconstant(4));
			--
			ks <= ks(2 downto 0) & ('1' xor ks(3));
      else
        -- reset constants
        roundconstant <= "000001";
        --
        ks <= "0000";
      end if;
    end if;
  end process;
  ------------ State Change ------------

--------------STEP FUNCTION & ADDKEY--------------
  ------------ Add RoundKey ------------
  addkey <= ('1' xor (ks(0) or ks(1) or ks(2) or ks(3))) or (ks(0) and ks(1) and ks(2) and ks(3));
  --

  ks_0000 <= '1' when ks = "0000" else '0';

  MUX_current_roundkey: entity work.MUX
  Generic Map (size => 64)
  Port Map (S => ks_0000, D1 => roundkey_1, D0 => roundkey_2, Q => current_roundkey);

  --
  addRoundKey_instance: entity work.AddRoundKey
    PORT MAP(cipherstate,current_roundkey,
             addroundkey_tmp);
  --

  -- addroundkey_out <= addroundkey_tmp when addkey = '1' else cipherstate;
  
  MUX_addroundkey_out: entity work.MUX
  Generic Map (size => 64)
  Port Map (S => addkey, D1 => addroundkey_tmp, D0 => cipherstate, Q => addroundkey_out);
  
  ------------ Add RoundKey ------------

  ------------ Add Constants ------------
  AddConstants_instance: entity work.AddConstants
    PORT MAP(addroundkey_out,keylength,roundconstant,
             addconst_out);
  ------------ Add Constants ------------

  ------------ Sub Cells ------------
  --Stage 1 (G)
  sub_loop: for i in 0 to 15 generate
    SBox_Instance: entity work.sbox
      PORT MAP( addconst_out((i*4+3) downto i*4),
                subcells_out((i*4+3) downto i*4));
  end generate; -- sub_loop
  ------------ Sub Cells ------------

  ------------ Mix Columns + ShiftRows ------------
  mix_loop: for i in 0 to 3 generate
    MCS_Instance: entity work.MixColumnSerial
      PORT MAP( subcells_out((3+(i*4 MOD (16))) downto (0+(i*4 MOD (16)))),
                subcells_out((19+((i+1)*4 MOD (16))) downto (16+((i+1)*4 MOD (16)))),
                subcells_out((35+((i+2)*4 MOD (16))) downto (32+((i+2)*4 MOD (16)))),
                subcells_out((51+((i+3)*4 MOD (16))) downto (48+((i+3)*4 MOD (16)))),
                mixcolumns_out((3+i*4) downto (0+i*4)),
                mixcolumns_out((19+i*4) downto (16+i*4)),
                mixcolumns_out((35+i*4) downto (32+i*4)),
                mixcolumns_out((51+i*4) downto (48+i*4)));
  end generate; -- mix_loop
  ---------- Mix Columns + ShiftRows ------------
--------------STEP FUNCTION & ADDKEY--------------

  ---------- Output Mapping ------------
  OUT_ciphertext <= cipherstate;
  OUT_roundconstant <= roundconstant;
  ---------- Output Mapping ------------

end Behavioral;

