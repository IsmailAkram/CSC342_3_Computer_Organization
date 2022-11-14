library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.numeric_std.ALL;

entity Akram_11_14_2021_MDR is
    generic (Akram_dw: integer := 32); -- data width
    port (
        Akram_clk, Akram_wren, Akram_rden, Akram_chen			: in std_logic;
        Akram_content													: in std_logic_vector(Akram_dw-1 downto 0);
        Akram_result														: out std_logic_vector(Akram_dw-1 downto 0));
end Akram_11_14_2021_MDR;

architecture arch of Akram_11_14_2021_MDR is

    signal Akram_memory: std_logic_vector(Akram_dw-1 downto 0);
    
    begin
        P1: process(Akram_clk, Akram_wren)
        begin
            if(rising_edge(Akram_clk) and Akram_wren = '1')
                then Akram_memory <= Akram_content;
            end if;
        end process P1;
        
        P2: process(Akram_rden, Akram_chen, Akram_memory)
        begin
            if(Akram_rden = '1' and Akram_chen = '1')
                then Akram_result <= Akram_memory;
            elsif(Akram_chen = '0')
                then Akram_result <= (others => '0');
            end if;
        end process P2;
end arch;