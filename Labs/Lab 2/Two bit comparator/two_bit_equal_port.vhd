-- Manually typing, no copying or pasting --
Library ieee;
use ieee.std_logic_1164.all;

entity two_bit_equal_port is
port (
	a, b : in std_logic_vector (1 downto 0);
	aeqb : out std_logic);
end two_bit_equal_port;

architecture arch of two_bit_equal_port is

	component equal
	port (
		I0, I1: in std_logic;
		Eq : out std_logic);
	end component;
	signal e0, e1: std_logic;

	begin

	H1: equal port map (i0 => a(0), i1 => b(0), eq => e0);
	H2: equal port map (i0 => a(1), i1 => b(1), eq => e1);

	aeqb <= e0 and e1;

end arch;
