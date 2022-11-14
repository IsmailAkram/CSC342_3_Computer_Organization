library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.all;


entity Akram_12_20_2021_ALU is
    port(
        Akram_a, Akram_b: in std_logic_vector(31 downto 0);
        Akram_ALU_Control: in std_logic_vector(2 downto 0); -- 3 bits for the ALU Control for our +, -, and, or operations
        Akram_result: out std_logic_vector(31 downto 0);
        Akram_Z_Flag: out std_logic); -- zero flag
end Akram_12_20_2021_ALU;

architecture arch of Akram_12_20_2021_ALU is
    signal Akram_signal_result: std_logic_vector(31 downto 0);
    
    begin
    
    process(Akram_ALU_Control, Akram_a, Akram_b)
    
        begin
            case Akram_ALU_Control is
            when "000" =>
                Akram_signal_result <= Akram_a + Akram_b;
            when "001" =>
                Akram_signal_result <= Akram_a - Akram_b;
            when "010" =>
                Akram_signal_result <= Akram_a and Akram_b;
            when "011" =>
                Akram_signal_result <= Akram_a or Akram_b;
            when "100" =>
                if(Akram_a < Akram_b) then
                    Akram_signal_result <= x"00000001";
                else
                    Akram_signal_result <= x"00000000";
                end if;
            when others => Akram_signal_result <= Akram_a + Akram_b;
            end case;
        end process;
        
        Akram_Z_Flag <= '1' when Akram_signal_result=x"00000000" else '0';
        Akram_result <= Akram_signal_result;
end arch;