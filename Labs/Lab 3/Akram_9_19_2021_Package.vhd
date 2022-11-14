library ieee;
use ieee.std_logic_1164.all;

package Akram_9_19_2021_Package is
	component Akram_9_19_2021_Half_Adder
		port (A, B 			: in std_logic;
				Sum, Carry 	: out std_logic);
	end component;
	
	component Akram_9_19_2021_1_Bit_Full_Adder
		port (A, B, Cin : in std_logic; 
				Sum, Cout : out std_logic);
	end component;
	
	component Akram_9_19_2021_4_Bit_Adder
		port (A, B 	: in std_logic_vector (3 downto 0);
				Cin 	: in std_logic;	
				Sum 	: out std_logic_vector (3 downto 0);
				Cout 	: out std_logic);
	end component;
	
	component Akram_9_19_2021_4_Bit_Add_sub
		port (A, B 		: in std_logic_vector (3 downto 0);
				Op 		: in std_logic; -- Operator
				Cf, Ovf 	: out std_logic; -- carry flag, overflow
				Sum 		: out std_logic_vector (3 downto 0));
	end component;
	
end Akram_9_19_2021_Package;