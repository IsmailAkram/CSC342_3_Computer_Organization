library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity Akram_11_14_2021_Sign_Extend is
    port(Akram_input									: in std_logic_vector(15 downto 0); -- extending from 16-bit 
          Akram_out									: out std_logic_vector(31 downto 0)); -- to 32-bit
end Akram_11_14_2021_Sign_Extend;

architecture arch of Akram_11_14_2021_Sign_Extend is

    signal Akram_extended: std_logic_vector(31 downto 0);
    
    begin
        Akram_out <= std_logic_vector(resize(signed(Akram_input), Akram_extended'length)); -- extension        
end arch;