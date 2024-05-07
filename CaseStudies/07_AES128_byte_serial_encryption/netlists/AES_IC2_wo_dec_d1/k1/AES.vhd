library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AES is
    Port ( plaintext  : in  STD_LOGIC_VECTOR (127 downto 0);
           key        : in  STD_LOGIC_VECTOR (127 downto 0);
           reset      : in  STD_LOGIC;
           clk        : in  STD_LOGIC;
           ciphertext : out STD_LOGIC_VECTOR (127 downto 0);
           done       : out STD_LOGIC);
end AES;

architecture Behavioral of AES is

component AES_Top is
	Port(x : in STD_LOGIC_VECTOR (257 downto 0); 
	     y: out	STD_LOGIC_VECTOR (128 downto 0));
end component;

   signal x : std_logic_vector(257 downto 0);
   signal y : std_logic_vector(128 downto 0);

begin
    x <= reset & clk & key(0) & key(1) & key(2) & key(3) & key(4) & key(5) & key(6) & key(7) & key(8) & key(9) & key(10) & key(11) & key(12) & key(13) & key(14) & key(15) & key(16) & key(17) & key(18) & key(19) & key(20) & key(21) & key(22) & key(23) & key(24) & key(25) & key(26) & key(27) & key(28) & key(29) & key(30) & key(31) & key(32) & key(33) & key(34) & key(35) & key(36) & key(37) & key(38) & key(39) & key(40) & key(41) & key(42) & key(43) & key(44) & key(45) & key(46) & key(47) & key(48) & key(49) & key(50) & key(51) & key(52) & key(53) & key(54) & key(55) & key(56) & key(57) & key(58) & key(59) & key(60) & key(61) & key(62) & key(63) & key(64) & key(65) & key(66) & key(67) & key(68) & key(69) & key(70) & key(71) & key(72) & key(73) & key(74) & key(75) & key(76) & key(77) & key(78) & key(79) & key(80) & key(81) & key(82) & key(83) & key(84) & key(85) & key(86) & key(87) & key(88) & key(89) & key(90) & key(91) & key(92) & key(93) & key(94) & key(95) & key(96) & key(97) & key(98) & key(99) & key(100) & key(101) & key(102) & key(103) & key(104) & key(105) & key(106) & key(107) & key(108) & key(109) & key(110) & key(111) & key(112) & key(113) & key(114) & key(115) & key(116) & key(117) & key(118) & key(119) & key(120) & key(121) & key(122) & key(123) & key(124) & key(125) & key(126) & key(127) & plaintext(0) & plaintext(1) & plaintext(2) & plaintext(3) & plaintext(4) & plaintext(5) & plaintext(6) & plaintext(7) & plaintext(8) & plaintext(9) & plaintext(10) & plaintext(11) & plaintext(12) & plaintext(13) & plaintext(14) & plaintext(15) & plaintext(16) & plaintext(17) & plaintext(18) & plaintext(19) & plaintext(20) & plaintext(21) & plaintext(22) & plaintext(23) & plaintext(24) & plaintext(25) & plaintext(26) & plaintext(27) & plaintext(28) & plaintext(29) & plaintext(30) & plaintext(31) & plaintext(32) & plaintext(33) & plaintext(34) & plaintext(35) & plaintext(36) & plaintext(37) & plaintext(38) & plaintext(39) & plaintext(40) & plaintext(41) & plaintext(42) & plaintext(43) & plaintext(44) & plaintext(45) & plaintext(46) & plaintext(47) & plaintext(48) & plaintext(49) & plaintext(50) & plaintext(51) & plaintext(52) & plaintext(53) & plaintext(54) & plaintext(55) & plaintext(56) & plaintext(57) & plaintext(58) & plaintext(59) & plaintext(60) & plaintext(61) & plaintext(62) & plaintext(63) & plaintext(64) & plaintext(65) & plaintext(66) & plaintext(67) & plaintext(68) & plaintext(69) & plaintext(70) & plaintext(71) & plaintext(72) & plaintext(73) & plaintext(74) & plaintext(75) & plaintext(76) & plaintext(77) & plaintext(78) & plaintext(79) & plaintext(80) & plaintext(81) & plaintext(82) & plaintext(83) & plaintext(84) & plaintext(85) & plaintext(86) & plaintext(87) & plaintext(88) & plaintext(89) & plaintext(90) & plaintext(91) & plaintext(92) & plaintext(93) & plaintext(94) & plaintext(95) & plaintext(96) & plaintext(97) & plaintext(98) & plaintext(99) & plaintext(100) & plaintext(101) & plaintext(102) & plaintext(103) & plaintext(104) & plaintext(105) & plaintext(106) & plaintext(107) & plaintext(108) & plaintext(109) & plaintext(110) & plaintext(111) & plaintext(112) & plaintext(113) & plaintext(114) & plaintext(115) & plaintext(116) & plaintext(117) & plaintext(118) & plaintext(119) & plaintext(120) & plaintext(121) & plaintext(122) & plaintext(123) & plaintext(124) & plaintext(125) & plaintext(126) & plaintext(127);
    ciphertext <= y(0) & y(1) & y(2) & y(3) & y(4) & y(5) & y(6) & y(7) & y(8) & y(9) & y(10) & y(11) & y(12) & y(13) & y(14) & y(15) & y(16) & y(17) & y(18) & y(19) & y(20) & y(21) & y(22) & y(23) & y(24) & y(25) & y(26) & y(27) & y(28) & y(29) & y(30) & y(31) & y(32) & y(33) & y(34) & y(35) & y(36) & y(37) & y(38) & y(39) & y(40) & y(41) & y(42) & y(43) & y(44) & y(45) & y(46) & y(47) & y(48) & y(49) & y(50) & y(51) & y(52) & y(53) & y(54) & y(55) & y(56) & y(57) & y(58) & y(59) & y(60) & y(61) & y(62) & y(63) & y(64) & y(65) & y(66) & y(67) & y(68) & y(69) & y(70) & y(71) & y(72) & y(73) & y(74) & y(75) & y(76) & y(77) & y(78) & y(79) & y(80) & y(81) & y(82) & y(83) & y(84) & y(85) & y(86) & y(87) & y(88) & y(89) & y(90) & y(91) & y(92) & y(93) & y(94) & y(95) & y(96) & y(97) & y(98) & y(99) & y(100) & y(101) & y(102) & y(103) & y(104) & y(105) & y(106) & y(107) & y(108) & y(109) & y(110) & y(111) & y(112) & y(113) & y(114) & y(115) & y(116) & y(117) & y(118) & y(119) & y(120) & y(121) & y(122) & y(123) & y(124) & y(125) & y(126) & y(127);
    done <= y(128);

top : AES_Top
	Port map(
		x => x,
		y => y
	);

end Behavioral;
