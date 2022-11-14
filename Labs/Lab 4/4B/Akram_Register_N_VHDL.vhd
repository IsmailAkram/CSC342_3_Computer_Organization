library ieee;
use ieee.std_logic_1164.all;

entity Akram_Register_N_VHDL is
	generic (N : integer := 32);
	port (
		AKRA_clk : in std_logic; -- clock --
		AKRA_wren : in std_logic; -- write enable --
		AKRA_rden : in std_logic; -- read enable --
		AKRA_chen : in std_logic; -- chip enable --
		AKRA_data : in std_logic_vector (N-1 downto 0); -- data input --
		AKRA_q : out std_logic_vector (N-1 downto 0)); -- output --
		
end Akram_Register_N_VHDL;

architecture arch of Akram_Register_N_VHDL is

	signal storage : std_logic_vector (N-1 downto 0);
	
	
begin
	process (AKRA_clk)
	begin
		if (rising_edge(AKRA_clk) and AKRA_wren = '1')
			then storage <= AKRA_data;
		end if;
	end process;
	
	process (AKRA_rden, AKRA_chen, storage)
	begin
		if (AKRA_rden = '1' and AKRA_chen = '1')
			then AKRA_q <= storage;
		elsif(AKRA_chen = '0')
			then AKRA_q <= (others => 'Z');
		end if;
	end process;
end arch;

-- rename to RD --