-- Typing this out manually --
Library ieee;
use ieee.std_logic_1164.all;

entity two_bit_equal is
	port ( a, b 	: in std_logic_vector (1 downto 0);
		aeqb	: out std_logic);
end two_bit_equal;

architecture arch of two_bit_equal is
signal p0, p1, p2, p3 : std_logic;

begin
aeqb <= p0 or p1 or p2 or p3;
p0 <= ((not (a(1))) and (not (b(1)))) and ((not (a(0))) and (not (b(0)))); 	-- (a1'.b1').(a0'.b0') --
p1 <= ((not (a(1))) and (not (b(1)))) and (((a(0)) and (b(0))));		-- (a1'.b1').(a0.b0) --
p2 <= ((a(1)) and (b(1))) and ((not (a(0))) and (not (b(0))));			-- (a1.b1).(a0'b0')  --
p3 <= ((a(1) and b(1)) and (a(0) and b(0))); 					-- (a1.b1).(a0.b0) --

end arch;