library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

entity Akram_12_20_2021_IR is
    port(
        Akram_PC: in std_logic_vector(31 downto 0); -- Program Counter, 32 bits
        Akram_instruction: out std_logic_vector(31 downto 0)); -- 32 bits
end Akram_12_20_2021_IR;


architecture arch of Akram_12_20_2021_IR is

    signal Akram_rom_addr: std_logic_vector(3 downto 0);
    
    type Akram_rom is array (0 to 15) of std_logic_vector(31 downto 0); -- read only instruction index of array
    constant Akram_rom_data: Akram_rom :=(
        "10000101000000000000000000000000",
        "10000000100000000000000000000000",
        "10100000110000000000000000000000",
        "10001001100000000000000000000000",
        "10100001000000000000000000000000",
        "10010010100000000000000000000000",
        "10011011100000000000000000000000",
        "11000000011110110000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000"
    );
    
    begin
    
        Akram_rom_addr <= Akram_PC(4 downto 1);
        Akram_instruction <= Akram_rom_data(to_integer(unsigned(Akram_rom_addr))) when Akram_PC < x"00000020" else x"00000000";
        
end arch;