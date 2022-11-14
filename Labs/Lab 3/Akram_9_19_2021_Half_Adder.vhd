-- Half adder --
library ieee;
use ieee.std_logic_1164.all;
entity Akram_9_19_2021_Half_Adder is
	port (A, B : in std_logic;
		Sum, Carry : out std_logic);
end Akram_9_19_2021_Half_Adder;

architecture BEHAV_HA of Akram_9_19_2021_Half_Adder is

begin
-- Process P1 that defines the xor gate for inputs for sum
P1: process (A, B)
	begin
		Sum <= A xor B;
	end process;
-- Process P2 that defines the and gate for inputs for carry
P2: process (A, B)
	begin
		Carry <= A and B;
	end process;
end BEHAV_HA;