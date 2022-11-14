library IEEE;
use IEEE.std_logic_1164.all;

entity Akram_11_14_2021_RD is
    generic (Akram_dw: integer := 32); -- data width; 32-bit RS Register
    port (
        Akram_clk, Akram_wren, Akram_rden, Akram_chen				: in std_logic;
        Akram_content																: in std_logic_vector(Akram_dw-1 downto 0); -- 32-bit input
        Akram_result																	: out std_logic_vector(Akram_dw-1 downto 0)); -- 32-bit output
end Akram_11_14_2021_RD;

architecture arch of Akram_11_14_2021_RD is

    signal Akram_memory																: std_logic_vector(Akram_dw-1 downto 0); -- 32-bit
    
    begin
        P1: process(Akram_clk, Akram_wren)
        begin
            if(rising_edge(Akram_clk) and Akram_wren = '1')
                then Akram_memory <= Akram_content; -- writing to memory
            end if;
        end process P1;
        
        P2: process(Akram_rden, Akram_chen, Akram_memory)
        begin
            if(Akram_rden = '1' and Akram_chen = '1')
                then Akram_result <= Akram_memory; -- outputting value in memory
            elsif(Akram_chen = '0')
                then Akram_result <= (others => '0'); -- else 0
            end if;
        end process P2;
end arch;