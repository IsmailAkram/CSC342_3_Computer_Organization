-- 4 Bit Adder
library ieee;
use ieee.std_logic_1164.all;
entity Akram_9_19_2021_4_Bit_Adder is
	port (A, B : in std_logic_vector (3 downto 0);
		Cin : in std_logic;	
		Sum : out std_logic_vector (3 downto 0);
		Cout : out std_logic);
end Akram_9_19_2021_4_Bit_Adder;

architecture BEHAV_4BA of Akram_9_19_2021_4_Bit_Adder is
	
	signal C: std_logic_vector (4 downto 0);
	component Akram_9_19_2021_1_Bit_Full_Adder
		port (A, B, Cin : in std_logic; 
		Sum, Cout : out std_logic);
	end component;
	
begin
	FA0: Akram_9_19_2021_1_Bit_Full_Adder
		port map (A(0), B(0), Cin, Sum(0), C(1));
	FA1: Akram_9_19_2021_1_Bit_Full_Adder
		port map (A(1), B(1), C(1), Sum(1), C(2));
	FA2: Akram_9_19_2021_1_Bit_Full_Adder
		port map (A(2), B(2), C(2), Sum(2), C(3));
	FA3: Akram_9_19_2021_1_Bit_Full_Adder
		port map (A(3), B(3), C(3), Sum(3), C(4));
	Cout <= c(4);
end BEHAV_4BA;