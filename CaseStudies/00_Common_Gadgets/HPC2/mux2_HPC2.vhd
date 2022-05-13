-------------------------------------------------------------------
-- COMPANY : Ruhr University Bochum
-- AUTHOR  : Amir Moradi (amir.moradi@rub.de) & David Knichel (david.knichel@rub.de)
-- DOCUMENT: https://eprint.iacr.org/2021/569/
-- -----------------------------------------------------------------
--
--
-- Copyright (c) 2021, David Knichel, Amir Moradi, Nicolai M�ller, Pascal Sasdrich
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

-- IF s = 1: c <= a, else b
entity mux2_HPC2 is
    generic (security_order : integer := 1; -- d
             pipeline	: integer := 1); -- 0/1
    port    (a : in std_logic_vector(security_order downto 0);
             b : in std_logic_vector(security_order downto 0);
             s : in std_logic_vector(security_order downto 0);
             r: in std_logic_vector(((((security_order + 1) * security_order) / 2) - 1) downto 0); -- (d+1)*d /2
             clk: in std_logic;
             c : out std_logic_vector(security_order downto 0));
end mux2_HPC2;


architecture Behavioral of mux2_HPC2 is

component and_HPC2 is
    generic (security_order : integer := 1; -- d
             pipeline	: integer := 1); -- 0/1
    port    (a : in std_logic_vector(security_order downto 0);
             b : in std_logic_vector(security_order downto 0);
             r: in std_logic_vector(((((security_order + 1) * security_order) / 2) - 1) downto 0); -- (d+1)*d /2
             clk: in std_logic;
             c : out std_logic_vector(security_order downto 0));
end component;

component reg is
	PORT ( clk 	: IN  STD_LOGIC;
			 d 	: IN  STD_LOGIC;
			 q 	: OUT  STD_LOGIC);
end component;


signal and_in, and_out, b_s1, b_s2 : std_logic_vector(security_order downto 0);


begin

gen_i: for I in 0 to security_order generate
    and_in(I) <= a(I) xor b(I);
        --pipeline
    gen_pipe_i_1 : if (pipeline /= 0) generate
            b_pipe_s1 : reg port map (clk => clk, d => b(I), q => b_s1(I));
            b_pipe_s2 : reg port map (clk => clk, d => b_s1(I), q => b_s2(I));
    end generate gen_pipe_i_1;
     
    gen_pipe_i_0 : if (pipeline = 0) generate
         b_s2(I) <= b(I);
    end generate gen_pipe_i_0;
    
    c(I) <= and_out(I) xor b_s2(I);
    
end generate;

a_HPC2_and : and_HPC2 generic map (security_order => security_order, pipeline => pipeline) port map(a => s, b => and_in, r=>r, clk => clk, c => and_out);

end Behavioral;