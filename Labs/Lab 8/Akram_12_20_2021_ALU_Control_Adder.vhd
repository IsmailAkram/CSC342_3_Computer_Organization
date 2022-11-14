library ieee;
use ieee.std_logic_1164.all;

entity Akram_12_20_2021_ALU_Control_Adder is
    port(
        Akram_ALU_Control_Main: out std_logic_vector(2 downto 0); -- ALU Control
        Akram_ALU_OP: in std_logic_vector(1 downto 0); -- operation
		  Akram_ALU_func: in std_logic_vector(2 downto 0)); -- function
end Akram_12_20_2021_ALU_Control_Adder;

architecture arch of Akram_12_20_2021_ALU_Control_Adder is

    begin
        process(Akram_ALU_OP, Akram_ALU_func)
            begin
                case Akram_ALU_OP is
                    when "00" =>
                        Akram_ALU_Control_Main <= Akram_ALU_func(2 downto 0);
                    when "01" =>
                        Akram_ALU_Control_Main <= "001";
                    when "10" =>
                        Akram_ALU_Control_Main <= "100";
                    when "11" =>
                        Akram_ALU_Control_Main <= "000";
                    when others =>
                        Akram_ALU_Control_Main <= "000";
                end case;
            end process;
end arch;