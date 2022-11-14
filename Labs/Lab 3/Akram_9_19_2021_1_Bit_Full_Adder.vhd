-- Full adder --
library ieee;
use ieee.std_logic_1164.all;
entity Akram_9_19_2021_1_Bit_Full_Adder is
	port (A, B, Cin : in std_logic; 
		Sum, Cout : out std_logic);
end Akram_9_19_2021_1_Bit_Full_Adder;

architecture BEHAV_FA of Akram_9_19_2021_1_Bit_Full_Adder is
	
	signal S1, C1, C2 : std_logic;
	component Akram_9_19_2021_Half_Adder
		port (A, B : in std_logic;
		Sum, Carry : out std_logic);
	end component;
	
begin
	HA0: Akram_9_19_2021_Half_Adder
		port map (A, B, S1, C1);
	HA1: Akram_9_19_2021_Half_Adder
		port map (Cin, S1, Sum, C2);
	Cout <= C1 or C2;
end BEHAV_FA;