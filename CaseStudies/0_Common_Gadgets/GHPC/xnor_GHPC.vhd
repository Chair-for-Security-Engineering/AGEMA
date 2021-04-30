-------------------------------------------------------------------
-- COMPANY : Ruhr University Bochum
-- AUTHOR  : Amir Moradi (amir.moradi@rub.de)
-- DOCUMENT: https:--eprint.iacr.org/2021/
-- -----------------------------------------------------------------
--
--
-- Copyright (c) 2021, David Knichel, Amir Moradi, Niolai M�ller, Pascal Sasdrich
--
-- All rights reserved.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
-- ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTERS BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
-- Please see LICENSE and README for license and further instructions.
--


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity xnor_GHPC is
	generic (
		low_latency    : integer := 1;  -- dummy
		pipeline       : integer := 1); -- dummy
	port (
		a 		: in  std_logic_vector(1 downto 0);
		b 		: in  std_logic_vector(1 downto 0);
		c 		: out std_logic_vector(1 downto 0));
end xnor_GHPC;

architecture Behavioral of xnor_GHPC is

	component xnor_2 is
	PORT ( 
		a 	: IN  STD_LOGIC;
		b 	: IN  STD_LOGIC;
		c 	: OUT STD_LOGIC);
	end component;

	component xor_2 is
	PORT ( 
		a 	: IN  STD_LOGIC;
		b 	: IN  STD_LOGIC;
		c 	: OUT STD_LOGIC);
	end component;

begin 

	Ins0: xnor_2 port map (a => a(0), b => b(0), c => c(0));

	gen_o : for I in 1 to 1 generate
		Ins: xor_2 port map (a => a(I), b => b(I), c => c(I));
	end generate;

end Behavioral;
