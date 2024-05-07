library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Midori64 is
    Port ( DataIn     : in  STD_LOGIC_VECTOR (63 downto 0);
           key        : in  STD_LOGIC_VECTOR (127 downto 0);
           reset      : in  STD_LOGIC;
	       enc_dec    : in  STD_LOGIC;
           clk        : in  STD_LOGIC;
           DataOut    : out STD_LOGIC_VECTOR (63 downto 0);
           done       : out STD_LOGIC);
end Midori64;

architecture Behavioral of Midori64 is

component Midori64_Top is
	Port(x : in STD_LOGIC_VECTOR (194 downto 0); 
	     y: out	STD_LOGIC_VECTOR (64 downto 0));
end component;

   signal x : std_logic_vector(194 downto 0);
   signal y : std_logic_vector(64 downto 0);

begin
	x <= enc_dec & reset & clk & key(0) & key(1) & key(2) & key(3) & key(4) & key(5) & key(6) & key(7) & key(8) & key(9) & key(10) & key(11) & key(12) & key(13) & key(14) & key(15) & key(16) & key(17) & key(18) & key(19) & key(20) & key(21) & key(22) & key(23) & key(24) & key(25) & key(26) & key(27) & key(28) & key(29) & key(30) & key(31) & key(32) & key(33) & key(34) & key(35) & key(36) & key(37) & key(38) & key(39) & key(40) & key(41) & key(42) & key(43) & key(44) & key(45) & key(46) & key(47) & key(48) & key(49) & key(50) & key(51) & key(52) & key(53) & key(54) & key(55) & key(56) & key(57) & key(58) & key(59) & key(60) & key(61) & key(62) & key(63) & key(64) & key(65) & key(66) & key(67) & key(68) & key(69) & key(70) & key(71) & key(72) & key(73) & key(74) & key(75) & key(76) & key(77) & key(78) & key(79) & key(80) & key(81) & key(82) & key(83) & key(84) & key(85) & key(86) & key(87) & key(88) & key(89) & key(90) & key(91) & key(92) & key(93) & key(94) & key(95) & key(96) & key(97) & key(98) & key(99) & key(100) & key(101) & key(102) & key(103) & key(104) & key(105) & key(106) & key(107) & key(108) & key(109) & key(110) & key(111) & key(112) & key(113) & key(114) & key(115) & key(116) & key(117) & key(118) & key(119) & key(120) & key(121) & key(122) & key(123) & key(124) & key(125) & key(126) & key(127) & DataIn(0) & DataIn(1) & DataIn(2) & DataIn(3) & DataIn(4) & DataIn(5) & DataIn(6) & DataIn(7) & DataIn(8) & DataIn(9) & DataIn(10) & DataIn(11) & DataIn(12) & DataIn(13) & DataIn(14) & DataIn(15) & DataIn(16) & DataIn(17) & DataIn(18) & DataIn(19) & DataIn(20) & DataIn(21) & DataIn(22) & DataIn(23) & DataIn(24) & DataIn(25) & DataIn(26) & DataIn(27) & DataIn(28) & DataIn(29) & DataIn(30) & DataIn(31) & DataIn(32) & DataIn(33) & DataIn(34) & DataIn(35) & DataIn(36) & DataIn(37) & DataIn(38) & DataIn(39) & DataIn(40) & DataIn(41) & DataIn(42) & DataIn(43) & DataIn(44) & DataIn(45) & DataIn(46) & DataIn(47) & DataIn(48) & DataIn(49) & DataIn(50) & DataIn(51) & DataIn(52) & DataIn(53) & DataIn(54) & DataIn(55) & DataIn(56) & DataIn(57) & DataIn(58) & DataIn(59) & DataIn(60) & DataIn(61) & DataIn(62) & DataIn(63);
    DataOut <= y(0) & y(1) & y(2) & y(3) & y(4) & y(5) & y(6) & y(7) & y(8) & y(9) & y(10) & y(11) & y(12) & y(13) & y(14) & y(15) & y(16) & y(17) & y(18) & y(19) & y(20) & y(21) & y(22) & y(23) & y(24) & y(25) & y(26) & y(27) & y(28) & y(29) & y(30) & y(31) & y(32) & y(33) & y(34) & y(35) & y(36) & y(37) & y(38) & y(39) & y(40) & y(41) & y(42) & y(43) & y(44) & y(45) & y(46) & y(47) & y(48) & y(49) & y(50) & y(51) & y(52) & y(53) & y(54) & y(55) & y(56) & y(57) & y(58) & y(59) & y(60) & y(61) & y(62) & y(63);
    done <= y(64);

top : Midori64_Top
	Port map(
		x => x,
		y => y
	);

end Behavioral;
