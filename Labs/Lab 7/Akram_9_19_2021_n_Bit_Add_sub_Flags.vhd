library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.std_logic_unsigned.all;

entity Akram_9_19_2021_N_Bit_Add_Sub_Flags is
    generic(n: natural := 16);
	 
    port(Akram_a, Akram_b					: in std_logic_vector(n-1 downto 0);
        Akram_sum								: out std_logic_vector(n-1 downto 0);
        Akram_op								: in std_logic;
        Akram_ovf, Akram_n, Akram_z		: out std_logic); -- carry flag, overflow, Negative, Zero	
end Akram_9_19_2021_N_Bit_Add_Sub_Flags;

architecture BEHAV_nBASF of Akram_9_19_2021_N_Bit_Add_Sub_Flags is
    signal Akram_cin							: std_logic_vector(n downto 0);
	 signal Bx, Akram_temp_sum				: std_logic_vector(n-1 downto 0); --Akram_temp_sum computes the zero flag, Bx = b switch input for adder
    
begin
    P: process(Akram_b, Akram_op)
    begin
				for i in 0 to n-1 loop
						Bx(i) <= Akram_b(i) xor Akram_op;
           end loop;
    end process;
		  
    Akram_cin(0) <= Akram_op;
    Akram_sum 									<= Akram_temp_sum;
	 Akram_temp_sum 							<= Akram_a xor Bx xor Akram_cin(n-1 downto 0);
    Akram_cin(n downto 1) 					<= (Akram_a and Bx) or (Akram_cin(n-1 downto 0) and (Akram_a xor Bx));
    
    Akram_ovf 									<= Akram_cin(n-1) xor Akram_cin(n); -- overflow flag
    Akram_n 									<= Akram_temp_sum(n-1); -- negative flag
	 Akram_z 									<= not(or_reduce(Akram_temp_sum)); -- zero flag	 
end BEHAV_nBASF;