
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package GHPC_pkg is

	-- Functions

	function xor_all (
		input 	: std_logic_vector)
		return std_logic;
		
	function GetBit (
		input 	: integer;
		size     : integer;
		myBit    : integer)
		return std_logic;
	
	-- Types	

	type bus_array is array(natural range <>, natural range <>) of std_logic;

end GHPC_pkg;

package body GHPC_pkg is
  
	function xor_all (
		input 	: std_logic_vector)
		return std_logic is
		variable res : std_logic := '0';
	begin
		for i in input'range loop
			res := res xor input(i);
		end loop;
		return res;
	end xor_all;

	--------------------------------------------------------

	function GetBit (
		input 	: integer;
		size     : integer;
		myBit    : integer)
		return std_logic is
		variable temp: std_logic_vector(size-1 downto 0);
		variable res : std_logic := '0';
	begin
		temp := std_logic_vector(to_unsigned(input, size));
		res := temp(myBit);
		return res;
	end GetBit;
  
end GHPC_pkg;
