library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Gadget_0 is
   Generic (
      in_size	    : integer := 2;
      out_size	    : integer := 1; 
      low_latency   : integer := 1;   -- 0 / 1
      pipeline      : integer := 0);  -- 0 / 1
   Port(
	in0 : in  std_logic_vector(in_size-1  downto 0);
	in1 : in  std_logic_vector(in_size-1  downto 0);
	r   : in  std_logic_vector(out_size*(1+low_latency*(2**in_size-1))-1 downto 0);
	clk : in  std_logic;
	out0: out std_logic_vector(out_size-1 downto 0);
	out1: out std_logic_vector(out_size-1 downto 0));
end GHPC_Gadget_0;


architecture Behavioral of GHPC_Gadget_0 is


	signal in1_reg	 : std_logic_vector(in_size-1  downto 0);

	--===============================================================
	
	signal Step1_reg : bus_array(0 to out_size-1, 2**in_size-1 downto 0);

	--===============================================================

	signal out0_mid  : std_logic_vector(out_size-1 downto 0);

begin

	GEN_in: for I in 0 to in_size-1 generate
		reg_ins1: entity work.reg
		Port map(
			clk	=> clk,
			D	=> in1(I),
			Q	=> in1_reg(I));
	end generate;	

	--===============================

    Step1_0_ins: entity work.GHPC_Step1_0
	Generic map (in_size, out_size, out_size*(1+low_latency*(2**in_size-1)), low_latency, pipeline)
	Port map (in0, r, clk, Step1_reg);

	---------------------------------

	Step2_inst: entity work.GHPC_Step2
	Generic map (in_size, out_size, low_latency, pipeline)
	Port map (Step1_reg, in1_reg, clk, out1);
	
	--===============================

	GEN_out: for X in 0 to out_size-1 generate
           GEN_normal: if (low_latency = 0) generate
	         reg_out0_ins1: entity work.reg
		   Port map(
		      clk => clk,
		      D	  => r(X),
 		      Q	  => out0_mid(X));

                reg_out0_ins2: entity work.reg
                  Port map(
	             clk => clk,
	             D	 => out0_mid(X),
	             Q	 => out0(X));
           end generate;

   	   GEN_LL: if (low_latency /= 0) generate
	      tp: Process (in1, r)
	      begin
	         out0_mid(X) <= r(X*(2**in_size) + to_integer(unsigned(in1)));
 	      end process;

              reg_out0_ins2: entity work.reg
              Port map(
                 clk => clk,
	         D   => out0_mid(X),
	         Q   => out0(X));
           end generate;
	end generate;		
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Gadget_1 is
   Generic (
      in_size	    : integer := 2;
      out_size	    : integer := 1; 
      low_latency   : integer := 1;   -- 0 / 1
      pipeline      : integer := 0);  -- 0 / 1
   Port(
	in0 : in  std_logic_vector(in_size-1  downto 0);
	in1 : in  std_logic_vector(in_size-1  downto 0);
	r   : in  std_logic_vector(out_size*(1+low_latency*(2**in_size-1))-1 downto 0);
	clk : in  std_logic;
	out0: out std_logic_vector(out_size-1 downto 0);
	out1: out std_logic_vector(out_size-1 downto 0));
end GHPC_Gadget_1;


architecture Behavioral of GHPC_Gadget_1 is


	signal in1_reg	 : std_logic_vector(in_size-1  downto 0);

	--===============================================================
	
	signal Step1_reg : bus_array(0 to out_size-1, 2**in_size-1 downto 0);

	--===============================================================

	signal out0_mid  : std_logic_vector(out_size-1 downto 0);

begin

	GEN_in: for I in 0 to in_size-1 generate
		reg_ins1: entity work.reg
		Port map(
			clk	=> clk,
			D	=> in1(I),
			Q	=> in1_reg(I));
	end generate;	

	--===============================

    Step1_1_ins: entity work.GHPC_Step1_1
	Generic map (in_size, out_size, out_size*(1+low_latency*(2**in_size-1)), low_latency, pipeline)
	Port map (in0, r, clk, Step1_reg);

	---------------------------------

	Step2_inst: entity work.GHPC_Step2
	Generic map (in_size, out_size, low_latency, pipeline)
	Port map (Step1_reg, in1_reg, clk, out1);
	
	--===============================

	GEN_out: for X in 0 to out_size-1 generate
           GEN_normal: if (low_latency = 0) generate
	         reg_out0_ins1: entity work.reg
		   Port map(
		      clk => clk,
		      D	  => r(X),
 		      Q	  => out0_mid(X));

                reg_out0_ins2: entity work.reg
                  Port map(
	             clk => clk,
	             D	 => out0_mid(X),
	             Q	 => out0(X));
           end generate;

   	   GEN_LL: if (low_latency /= 0) generate
	      tp: Process (in1, r)
	      begin
	         out0_mid(X) <= r(X*(2**in_size) + to_integer(unsigned(in1)));
 	      end process;

              reg_out0_ins2: entity work.reg
              Port map(
                 clk => clk,
	         D   => out0_mid(X),
	         Q   => out0(X));
           end generate;
	end generate;		
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Gadget_2 is
   Generic (
      in_size	    : integer := 2;
      out_size	    : integer := 1; 
      low_latency   : integer := 1;   -- 0 / 1
      pipeline      : integer := 0);  -- 0 / 1
   Port(
	in0 : in  std_logic_vector(in_size-1  downto 0);
	in1 : in  std_logic_vector(in_size-1  downto 0);
	r   : in  std_logic_vector(out_size*(1+low_latency*(2**in_size-1))-1 downto 0);
	clk : in  std_logic;
	out0: out std_logic_vector(out_size-1 downto 0);
	out1: out std_logic_vector(out_size-1 downto 0));
end GHPC_Gadget_2;


architecture Behavioral of GHPC_Gadget_2 is


	signal in1_reg	 : std_logic_vector(in_size-1  downto 0);

	--===============================================================
	
	signal Step1_reg : bus_array(0 to out_size-1, 2**in_size-1 downto 0);

	--===============================================================

	signal out0_mid  : std_logic_vector(out_size-1 downto 0);

begin

	GEN_in: for I in 0 to in_size-1 generate
		reg_ins1: entity work.reg
		Port map(
			clk	=> clk,
			D	=> in1(I),
			Q	=> in1_reg(I));
	end generate;	

	--===============================

    Step1_2_ins: entity work.GHPC_Step1_2
	Generic map (in_size, out_size, out_size*(1+low_latency*(2**in_size-1)), low_latency, pipeline)
	Port map (in0, r, clk, Step1_reg);

	---------------------------------

	Step2_inst: entity work.GHPC_Step2
	Generic map (in_size, out_size, low_latency, pipeline)
	Port map (Step1_reg, in1_reg, clk, out1);
	
	--===============================

	GEN_out: for X in 0 to out_size-1 generate
           GEN_normal: if (low_latency = 0) generate
	         reg_out0_ins1: entity work.reg
		   Port map(
		      clk => clk,
		      D	  => r(X),
 		      Q	  => out0_mid(X));

                reg_out0_ins2: entity work.reg
                  Port map(
	             clk => clk,
	             D	 => out0_mid(X),
	             Q	 => out0(X));
           end generate;

   	   GEN_LL: if (low_latency /= 0) generate
	      tp: Process (in1, r)
	      begin
	         out0_mid(X) <= r(X*(2**in_size) + to_integer(unsigned(in1)));
 	      end process;

              reg_out0_ins2: entity work.reg
              Port map(
                 clk => clk,
	         D   => out0_mid(X),
	         Q   => out0(X));
           end generate;
	end generate;		
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Gadget_3 is
   Generic (
      in_size	    : integer := 2;
      out_size	    : integer := 1; 
      low_latency   : integer := 1;   -- 0 / 1
      pipeline      : integer := 0);  -- 0 / 1
   Port(
	in0 : in  std_logic_vector(in_size-1  downto 0);
	in1 : in  std_logic_vector(in_size-1  downto 0);
	r   : in  std_logic_vector(out_size*(1+low_latency*(2**in_size-1))-1 downto 0);
	clk : in  std_logic;
	out0: out std_logic_vector(out_size-1 downto 0);
	out1: out std_logic_vector(out_size-1 downto 0));
end GHPC_Gadget_3;


architecture Behavioral of GHPC_Gadget_3 is


	signal in1_reg	 : std_logic_vector(in_size-1  downto 0);

	--===============================================================
	
	signal Step1_reg : bus_array(0 to out_size-1, 2**in_size-1 downto 0);

	--===============================================================

	signal out0_mid  : std_logic_vector(out_size-1 downto 0);

begin

	GEN_in: for I in 0 to in_size-1 generate
		reg_ins1: entity work.reg
		Port map(
			clk	=> clk,
			D	=> in1(I),
			Q	=> in1_reg(I));
	end generate;	

	--===============================

    Step1_3_ins: entity work.GHPC_Step1_3
	Generic map (in_size, out_size, out_size*(1+low_latency*(2**in_size-1)), low_latency, pipeline)
	Port map (in0, r, clk, Step1_reg);

	---------------------------------

	Step2_inst: entity work.GHPC_Step2
	Generic map (in_size, out_size, low_latency, pipeline)
	Port map (Step1_reg, in1_reg, clk, out1);
	
	--===============================

	GEN_out: for X in 0 to out_size-1 generate
           GEN_normal: if (low_latency = 0) generate
	         reg_out0_ins1: entity work.reg
		   Port map(
		      clk => clk,
		      D	  => r(X),
 		      Q	  => out0_mid(X));

                reg_out0_ins2: entity work.reg
                  Port map(
	             clk => clk,
	             D	 => out0_mid(X),
	             Q	 => out0(X));
           end generate;

   	   GEN_LL: if (low_latency /= 0) generate
	      tp: Process (in1, r)
	      begin
	         out0_mid(X) <= r(X*(2**in_size) + to_integer(unsigned(in1)));
 	      end process;

              reg_out0_ins2: entity work.reg
              Port map(
                 clk => clk,
	         D   => out0_mid(X),
	         Q   => out0(X));
           end generate;
	end generate;		
	
end Behavioral;
