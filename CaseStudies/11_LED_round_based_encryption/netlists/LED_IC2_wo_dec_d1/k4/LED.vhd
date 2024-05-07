library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED is
    Port ( IN_plaintext  : in  STD_LOGIC_VECTOR (63 downto 0);
           IN_key        : in  STD_LOGIC_VECTOR (127 downto 0);
           IN_reset      : in  STD_LOGIC;
           CLK        : in  STD_LOGIC;
           OUT_ciphertext : out STD_LOGIC_VECTOR (63 downto 0);
           OUT_done       : out STD_LOGIC);
end LED;

architecture Behavioral of LED is

component LED_Top is
	Port(x : in STD_LOGIC_VECTOR (193 downto 0); 
	     y: out	STD_LOGIC_VECTOR (64 downto 0));
end component;

   signal x : std_logic_vector(193 downto 0);
   signal y : std_logic_vector(64 downto 0);

begin
    x <= CLK & IN_reset & IN_key(0) & IN_key(1) & IN_key(2) & IN_key(3) & IN_key(4) & IN_key(5) & IN_key(6) & IN_key(7) & IN_key(8) & IN_key(9) & IN_key(10) & IN_key(11) & IN_key(12) & IN_key(13) & IN_key(14) & IN_key(15) & IN_key(16) & IN_key(17) & IN_key(18) & IN_key(19) & IN_key(20) & IN_key(21) & IN_key(22) & IN_key(23) & IN_key(24) & IN_key(25) & IN_key(26) & IN_key(27) & IN_key(28) & IN_key(29) & IN_key(30) & IN_key(31) & IN_key(32) & IN_key(33) & IN_key(34) & IN_key(35) & IN_key(36) & IN_key(37) & IN_key(38) & IN_key(39) & IN_key(40) & IN_key(41) & IN_key(42) & IN_key(43) & IN_key(44) & IN_key(45) & IN_key(46) & IN_key(47) & IN_key(48) & IN_key(49) & IN_key(50) & IN_key(51) & IN_key(52) & IN_key(53) & IN_key(54) & IN_key(55) & IN_key(56) & IN_key(57) & IN_key(58) & IN_key(59) & IN_key(60) & IN_key(61) & IN_key(62) & IN_key(63) & IN_key(64) & IN_key(65) & IN_key(66) & IN_key(67) & IN_key(68) & IN_key(69) & IN_key(70) & IN_key(71) & IN_key(72) & IN_key(73) & IN_key(74) & IN_key(75) & IN_key(76) & IN_key(77) & IN_key(78) & IN_key(79) & IN_key(80) & IN_key(81) & IN_key(82) & IN_key(83) & IN_key(84) & IN_key(85) & IN_key(86) & IN_key(87) & IN_key(88) & IN_key(89) & IN_key(90) & IN_key(91) & IN_key(92) & IN_key(93) & IN_key(94) & IN_key(95) & IN_key(96) & IN_key(97) & IN_key(98) & IN_key(99) & IN_key(100) & IN_key(101) & IN_key(102) & IN_key(103) & IN_key(104) & IN_key(105) & IN_key(106) & IN_key(107) & IN_key(108) & IN_key(109) & IN_key(110) & IN_key(111) & IN_key(112) & IN_key(113) & IN_key(114) & IN_key(115) & IN_key(116) & IN_key(117) & IN_key(118) & IN_key(119) & IN_key(120) & IN_key(121) & IN_key(122) & IN_key(123) & IN_key(124) & IN_key(125) & IN_key(126) & IN_key(127) & IN_plaintext(0) & IN_plaintext(1) & IN_plaintext(2) & IN_plaintext(3) & IN_plaintext(4) & IN_plaintext(5) & IN_plaintext(6) & IN_plaintext(7) & IN_plaintext(8) & IN_plaintext(9) & IN_plaintext(10) & IN_plaintext(11) & IN_plaintext(12) & IN_plaintext(13) & IN_plaintext(14) & IN_plaintext(15) & IN_plaintext(16) & IN_plaintext(17) & IN_plaintext(18) & IN_plaintext(19) & IN_plaintext(20) & IN_plaintext(21) & IN_plaintext(22) & IN_plaintext(23) & IN_plaintext(24) & IN_plaintext(25) & IN_plaintext(26) & IN_plaintext(27) & IN_plaintext(28) & IN_plaintext(29) & IN_plaintext(30) & IN_plaintext(31) & IN_plaintext(32) & IN_plaintext(33) & IN_plaintext(34) & IN_plaintext(35) & IN_plaintext(36) & IN_plaintext(37) & IN_plaintext(38) & IN_plaintext(39) & IN_plaintext(40) & IN_plaintext(41) & IN_plaintext(42) & IN_plaintext(43) & IN_plaintext(44) & IN_plaintext(45) & IN_plaintext(46) & IN_plaintext(47) & IN_plaintext(48) & IN_plaintext(49) & IN_plaintext(50) & IN_plaintext(51) & IN_plaintext(52) & IN_plaintext(53) & IN_plaintext(54) & IN_plaintext(55) & IN_plaintext(56) & IN_plaintext(57) & IN_plaintext(58) & IN_plaintext(59) & IN_plaintext(60) & IN_plaintext(61) & IN_plaintext(62) & IN_plaintext(63);
    OUT_ciphertext <= y(0) & y(1) & y(2) & y(3) & y(4) & y(5) & y(6) & y(7) & y(8) & y(9) & y(10) & y(11) & y(12) & y(13) & y(14) & y(15) & y(16) & y(17) & y(18) & y(19) & y(20) & y(21) & y(22) & y(23) & y(24) & y(25) & y(26) & y(27) & y(28) & y(29) & y(30) & y(31) & y(32) & y(33) & y(34) & y(35) & y(36) & y(37) & y(38) & y(39) & y(40) & y(41) & y(42) & y(43) & y(44) & y(45) & y(46) & y(47) & y(48) & y(49) & y(50) & y(51) & y(52) & y(53) & y(54) & y(55) & y(56) & y(57) & y(58) & y(59) & y(60) & y(61) & y(62) & y(63);
    OUT_done <= y(64);

top : LED_Top
	Port map(
		x => x,
		y => y
	);

end Behavioral;
