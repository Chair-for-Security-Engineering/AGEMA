-- RCon computation with output gating
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controler is
        port(
                clk       : in std_logic;
                nReset    : in std_logic;
                selMC     : out std_logic;
                selSR     : out std_logic;
                selXOR    : out std_logic;
                enRCon    : out std_logic;
					 finalStep : out std_logic
                );

end entity controler;

architecture dfl of controler is

---------------------------------------------------------------------------
-- Component declaration
---------------------------------------------------------------------------
component dflipfloplw is
	generic (NBITS: integer);
	port(
		clk	: in std_logic;
		n_reset	: in std_logic;
		D	: in std_logic_vector(NBITS-1 downto 0);
		D_rst	: in std_logic_vector(NBITS-1 downto 0);
		Q	: out std_logic_vector(NBITS-1 downto 0)
		);

end component dflipfloplw;

component clock_gate IS
PORT (  clk    : IN std_logic;
        enable : IN std_logic;
        clk_en : OUT std_logic
);
end component clock_gate;

---------------------------------------------------------------------------
-- signal declaration
---------------------------------------------------------------------------
        signal seq6In, seq6Out    : std_logic_vector(4 downto 0);
        signal seq4In, seq4Out    : std_logic_vector(1 downto 0);
        signal intSelSR, intSelXOR, nRstSeq4 : std_logic;
        signal CSselMC, NSenRC, CSenRC, enSelMC  : std_logic;

begin

	finalStep <= '1' when ((seq6Out = "00000") and (seq4Out = "01")) else '0';

	seq6In <= seq6Out(3 downto 0)&(seq6Out(4) XNOR seq6Out(0));

	seq6: dflipfloplw
		generic map(NBITS=>5)
		port map(
			clk => clk,
			n_reset => nReset,
			D => seq6In,
			D_rst => "10101",
			Q => seq6Out
			);
		
	intSelSR <= (seq6Out(4) NOR seq6Out(3)) AND (seq6Out(2) NOR seq6Out(1)) AND (NOT seq6Out(0));

	nRstSeq4 <= (NOT intSelSR) AND nReset;
	selSR <= intSelSR AND nReset;

	-----------------------------------------------
	-- selXOR generation
	-----------------------------------------------

	seq4In <= seq4Out(0)&(not seq4Out(1));

	seq4: dflipfloplw
		generic map(NBITS=>2)
		port map(
			clk => clk,
			n_reset => nRstSeq4,
			D => seq4In,
			D_rst => "01",
			Q => seq4Out
			);
		
	intSelXOR <= (seq4Out(1) OR seq4Out(0)) AND nReset;
	selXOR <= intSelXOR;

	-----------------------------------------------
	-- selMC generation uses selSR
	-----------------------------------------------
	selMC <= CSselMC AND nReset;

	enSelMC <= intSelSR OR (intSelXOR NOR intSelSR);

	FF_selMC:      Process(clk)
	  begin

				 if (clk'event AND clk = '1') then
							if (nReset = '0') then
									  CSselMC <= '0';
							else
							  if enSelMC = '1' then
									  CSselMC <= intselSR;--NSselMC;
									else
									  CSselMC <= CSselMC;
									end if;
							end if;
				 end if;
	  end process;

	-----------------------------------------------
	-- enRCon generation is 1 CLK buffered selSR
	-----------------------------------------------
	NSenRC    <= intSelSR;
	enRCon <= CSenRC;

	FF_enRc:      Process(clk)
	  begin

				 if (clk'event AND clk = '1') then
							if (nReset = '0') then
									  CSenRC <= '0';
							else
									  CSenRC <= NSenRC;
							end if;
				 end if;
	  end process;

end architecture dfl;