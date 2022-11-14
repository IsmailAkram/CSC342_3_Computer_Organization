-- N_Bit_Add/Sub --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity Akram_9_19_2021_N_Bit_Add_sub is
	generic (n : integer := 32);
	
	port (A, B : in std_logic_vector (n-1 downto 0);
			Op : in std_logic; -- Operator
			Cf, Ovf : out std_logic; -- carry flag, overflow
			Sum : out std_logic_vector (n-1 downto 0));
end Akram_9_19_2021_N_Bit_Add_sub;

architecture BEHAV_NBAS of Akram_9_19_2021_N_Bit_Add_sub is
	signal C : std_logic_vector (n downto 0);
	signal Bx : std_logic_vector (n-1 downto 0); -- b switch input for adder
	
begin
	P: process (Bx, B, Op)
	begin
		for i in 0 to n-1 loop
			Bx(i) <= B(i) xor Op;
		end loop;
	end process;
	
	C(0) <= Op;
	Sum <= A xor Bx xor C(n-1 downto 0);
	C(n downto 1) <= (A and Bx) or (C(n-1 downto 0) and (A xor Bx));
	Cf <= C(n);
	Ovf <= C(n-1) xor C(n);
end BEHAV_NBAS;
