-- N_Bit_Add/Sub Flags --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;
entity Akram_9_19_2021_N_Bit_Add_sub_Flags is
	generic (n : integer := 32);
	
	port (A, B 						: in std_logic_vector (n-1 downto 0);
			Op 						: in std_logic; -- Operator
			Sum 						: inout std_logic_vector (n-1 downto 0);
			Cf, Ovf, Negf, ZeroF : inout std_logic); -- carry flag, overflow, Negative, Zero			
end Akram_9_19_2021_N_Bit_Add_sub_Flags;

architecture BEHAV_NBASF of Akram_9_19_2021_N_Bit_Add_sub_Flags is
	signal C : std_logic_vector (n downto 0);
	signal Bx, Temp_Sum : std_logic_vector (n-1 downto 0); -- b switch input for adder
	
begin
	P: process (Bx, B, Op)
	begin
		for i in 0 to n-1 loop
			Bx(i) <= B(i) xor Op;
		end loop;
	end process;
	
	C(0) 				<= Op;
	Sum 				<= Temp_Sum;
	Temp_Sum			<= A xor Bx xor C(n-1 downto 0);
	C(n downto 1) 	<= (A and Bx) or (C(n-1 downto 0) and (A xor Bx));
	Cf 				<= C(n);
	Ovf 				<= C(n-1) xor C(n); -- overflow flag
	Negf 				<= Temp_Sum(n-1); -- Negative flag
	ZeroF				<= not(or_reduce (Temp_Sum)); -- Zero flag
	
end BEHAV_NBASF;