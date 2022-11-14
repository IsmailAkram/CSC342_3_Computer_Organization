library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Akram_11_14_2021_Data_Memory is  
    port(
        signal clk, MEMREAD, MEMWRITE : in std_logic;
        signal MAR, WRDATA : in std_logic_vector(31 downto 0);
        signal MDR : out std_logic_vector(31 downto 0)
    );
end entity Akram_11_14_2021_Data_Memory;


architecture behavior of Akram_11_14_2021_Data_Memory is
    type memory is array(3 downto 0) of std_logic_vector(7 downto 0);
    signal data_Memory : memory;
    
    begin

        writeMem : process(CLK, MAR, MEMWRITE, WRDATA)
            begin
                if rising_edge(clk) and MEMWRITE = '1' then
                    case MAR(7 downto 0) is
                        when X"00" =>
                            data_Memory(0) <= WRDATA(31 downto 24);
                            data_Memory(1) <= WRDATA(23 downto 16);
                            data_Memory(2) <= WRDATA(15 downto 8);
                            data_Memory(3) <= WRDATA(7 downto 0);
                            
                        when others => null;
                    end case;
                end if;
        end process;

        readMem : process(clk, MAR, MEMREAD)
            begin
                if MEMREAD = '1' then
                    case MAR(7 downto 0) is
                        when X"00" =>
                            MDR <= data_Memory(0) & data_Memory(1) & data_Memory(2) & data_Memory(3);

                        when others => null;
                    end case;
                end if;
        end process;
end architecture behavior;