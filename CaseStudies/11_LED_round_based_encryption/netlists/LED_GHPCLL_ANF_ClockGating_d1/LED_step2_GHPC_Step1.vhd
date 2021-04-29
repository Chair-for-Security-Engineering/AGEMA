library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_0 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_0;


architecture Behavioral of GHPC_Step1_0 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_1 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_1;


architecture Behavioral of GHPC_Step1_1 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_2 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_2;


architecture Behavioral of GHPC_Step1_2 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_3 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_3;


architecture Behavioral of GHPC_Step1_3 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_4 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_4;


architecture Behavioral of GHPC_Step1_4 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_5 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_5;


architecture Behavioral of GHPC_Step1_5 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_6 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_6;


architecture Behavioral of GHPC_Step1_6 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_7 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_7;


architecture Behavioral of GHPC_Step1_7 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_8 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_8;


architecture Behavioral of GHPC_Step1_8 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(3)) xor (in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_9 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_9;


architecture Behavioral of GHPC_Step1_9 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(3)) xor (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_10 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_10;


architecture Behavioral of GHPC_Step1_10 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(3)) xor (in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_11 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_11;


architecture Behavioral of GHPC_Step1_11 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(3)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3)) xor (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(3)) xor (in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_12 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_12;


architecture Behavioral of GHPC_Step1_12 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(3)) xor (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_13 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_13;


architecture Behavioral of GHPC_Step1_13 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(3)) xor (in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_14 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_14;


architecture Behavioral of GHPC_Step1_14 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(3)) xor (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.GHPC_pkg.all;

entity GHPC_Step1_15 is
   Generic (
      in_size	    : integer;
      out_size	    : integer; 
      fresh_size    : integer;
      low_latency   : integer;
      pipeline      : integer);
   Port(
	in0 		: in  std_logic_vector(in_size-1    downto 0);
	r   		: in  std_logic_vector(fresh_size-1 downto 0);
	clk 		: in  std_logic;
	Step1_reg	: out bus_array(0 to out_size-1, 2**in_size-1 downto 0));
end GHPC_Step1_15;


architecture Behavioral of GHPC_Step1_15 is


	type in_array  is array(natural range <>) of std_logic_vector(in_size-1  downto 0);
	type out_array is array(natural range <>) of std_logic_vector(out_size-1 downto 0);

	signal in0_comb		: in_array(0 to 2**in_size-1);
	signal FuncOut 		: out_array(0 to 2**in_size-1);
	signal Step1		: bus_array(0 to   out_size-1, 2**in_size-1 downto 0);

begin

	GEN_in0_comb: for I in 0 to 2**in_size-1 generate
		GEN_in0_bit: for J in 0 to in_size-1 generate
			in0_comb(I)(j) <= in0(J) when GetBit(I,in_size,J) = '0' else (not in0(J));
		end generate;
		
            FuncOut(I)(0) <= (in0_comb(I)(3)) xor (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(1) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(0)) xor (in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(2) <= (in0_comb(I)(3)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
            FuncOut(I)(3) <= (in0_comb(I)(2)) xor (in0_comb(I)(3) and in0_comb(I)(2)) xor (in0_comb(I)(1)) xor (in0_comb(I)(3) and in0_comb(I)(1)) xor (in0_comb(I)(2) and in0_comb(I)(1)) xor (in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(2) and in0_comb(I)(0)) xor (in0_comb(I)(3) and in0_comb(I)(1) and in0_comb(I)(0)) xor (in0_comb(I)(2) and in0_comb(I)(1) and in0_comb(I)(0));
                                                                    -- input:  in0_comb(I)
	end generate;

	---------------------------------

	GEN_out: for X in 0 to out_size-1 generate
		GEN_Step1_1: for I in 0 to 2**in_size-1 generate
		   GEN_normal: if (low_latency = 0) generate
                      Step1(X, I) <= r(X) xor FuncOut(I)(X);
                   end generate;

		   GEN_LL: if (low_latency /= 0) generate
                      Step1(X, I) <= r(I+X*(2**in_size)) xor FuncOut(I)(X);
                   end generate;
			
 		   reg_ins: entity work.reg
		   Port map(
		     clk	=> clk,
		     D		=> Step1(X, I),
		     Q		=> Step1_reg(X, I));
		end generate;	
	end generate;	
	
end Behavioral;
