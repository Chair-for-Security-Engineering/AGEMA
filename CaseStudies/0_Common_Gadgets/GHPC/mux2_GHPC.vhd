
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- IF s = 1: c <= a, else b
entity mux2_GHPC is
   Generic (
      low_latency   : integer := 1;   -- 0 / 1
      pipeline      : integer := 0);  -- 0 / 1
   Port(
	a   : in  std_logic_vector(1 downto 0);
	b   : in  std_logic_vector(1 downto 0);
	s   : in  std_logic_vector(1 downto 0);
	r   : in  std_logic_vector((1+low_latency*3)-1 downto 0);
	clk : in  std_logic;
	c   : out std_logic_vector(1 downto 0));
end mux2_GHPC;

architecture Behavioral of mux2_GHPC is

component and_GHPC is
   Generic (
      low_latency   : integer := 1;   -- 0 / 1
      pipeline      : integer := 0);  -- 0 / 1
   Port(
	a   : in  std_logic_vector(1 downto 0);
	b   : in  std_logic_vector(1 downto 0);
	r   : in  std_logic_vector((1+low_latency*3)-1 downto 0);
	clk : in  std_logic;
	c   : out std_logic_vector(1 downto 0));
end component;

component reg is
	PORT ( clk 	: IN  STD_LOGIC;
			 d 	: IN  STD_LOGIC;
			 q 	: OUT  STD_LOGIC);
end component;

signal and_in, and_out, b_s1, b_s2 : std_logic_vector(1 downto 0);

begin

gen_i: for I in 0 to 1 generate
    and_in(I) <= a(I) xor b(I);
        --pipeline
    gen_pipe_i_1 : if (pipeline /= 0) generate
            gen_LL: if (low_latency /= 0) generate
	            b_pipe_s1 : reg port map (clk => clk, d => b(I), q => b_s2(I));
	    end generate;
	    
            gen_normal: if (low_latency = 0) generate
		    b_pipe_s1 : reg port map (clk => clk, d => b(I), q => b_s1(I));
		    b_pipe_s2 : reg port map (clk => clk, d => b_s1(I), q => b_s2(I));
            end generate;
    end generate gen_pipe_i_1;
     
    gen_pipe_i_0 : if (pipeline = 0) generate
         b_s2(I) <= b(I);
    end generate gen_pipe_i_0;
    
    c(I) <= and_out(I) xor b_s2(I);
    
end generate;

and_GHPC_inst: and_GHPC generic map (low_latency => low_latency, pipeline => pipeline) port map(a => s, b => and_in, r=>r, clk => clk, c => and_out);

end Behavioral;