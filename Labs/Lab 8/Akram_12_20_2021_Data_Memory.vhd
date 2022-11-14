library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity Akram_12_20_2021_Data_Memory is
    port(
        Akram_CLK, Akram_wren, Akram_rden: in std_logic; -- clock, write and read enable
        Akram_mem_address, Akram_write_data: in std_logic_vector(31 downto 0); -- 32 bits
        Akram_data: out std_logic_vector(31 downto 0)); -- 32 bits
end Akram_12_20_2021_Data_Memory;

architecture arch of Akram_12_20_2021_Data_Memory is

    signal Akram_address: std_logic_vector(7 downto 0);
    type Akram_data_mem is array (0 to 15) of std_logic_vector(31 downto 0);
    signal RAM: Akram_data_mem :=((others=> (others=>'0')));
    
    begin
        Akram_address <= Akram_mem_address(8 downto 1);
        
        process(Akram_CLK)
        begin
            if(rising_edge(Akram_CLK)) then
                if(Akram_wren = '1') then
                    ram(to_integer(unsigned(Akram_address))) <= Akram_write_data; -- write to data on the rising edge of the clock
                end if;
            end if;
        end process;
        Akram_data <= ram(to_integer(unsigned(Akram_address))) when (Akram_rden = '1') else x"00000000";
end arch;