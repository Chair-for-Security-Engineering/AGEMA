
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED is
    Port ( IN_plaintext   : in    STD_LOGIC_VECTOR (63 downto 0);
           IN_key         : in    STD_LOGIC_VECTOR (127 downto 0);
           IN_reset       : in    STD_LOGIC;
           CLK            : in    STD_LOGIC;
           OUT_ciphertext : out   STD_LOGIC_VECTOR (63 downto 0);
           OUT_done       : out   STD_LOGIC);
end LED;

architecture Behavioral of LED is

  SIGNAL led_done, give_out, internal_done : STD_LOGIC;
  SIGNAL ciphertext        : STD_LOGIC_VECTOR(63 downto 0);
  SIGNAL roundconstant     : STD_LOGIC_VECTOR(5 downto 0);

begin

  ---------- LED ------------
  LED_128_Instance: entity work.LED_128
        PORT MAP( IN_plaintext, IN_key, IN_reset,
                  CLK,
                  ciphertext, roundconstant);
  ---------- LED ------------

  ---------- Gen Done Signal ------------
  -- This generates a registered done-signal
  done_process:  process(CLK, IN_reset) begin
    if rising_edge(CLK) then
      if IN_reset='1' then
        internal_done <= '0';
      else
        if roundconstant = "001001" then
          internal_done <= '1';
        end if;
      end if;
    end if;
  end process;
  ---------- Gen Done Signal ------------


  ---------- Output Mapping ------------
  OUT_ciphertext <= ciphertext;
  OUT_done <= internal_done;
  ---------- Output Mapping ------------

end Behavioral;

