-- 4Bit_Add/Sub --
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity Akram_9_19_2021_4_Bit_Add_sub is
	port (A, B : in std_logic_vector (3 downto 0);
			Op : in std_logic; -- Operator
			Cf, Ovf : out std_logic; -- carry flag, overflow
			Sum : out std_logic_vector (3 downto 0));
end Akram_9_19_2021_4_Bit_Add_sub;

architecture BEHAV_4BAS of Akram_9_19_2021_4_Bit_Add_sub is
	signal C : std_logic_vector (4 downto 0);
	signal Bx : std_logic_vector (3 downto 0); -- b switch input for adder
	
begin
	-- Bx <= b xor Op & Op & Op & Op; -- 
	-- I'm using a loop as I see a 32 bit task for later --
	P: process (Bx, B, Op)
	begin
		for i in 0 to 3 loop
			Bx(i) <= B(i) xor Op;
		end loop;
	end process;
	
	C(0) <= Op;
	Sum <= A xor Bx xor C(3 downto 0);
	C(4 downto 1) <= (A and Bx) or (C(3 downto 0) and (A xor Bx));
	Cf <= C(4);
	Ovf <= C(3) xor C(4);
end BEHAV_4BAS;