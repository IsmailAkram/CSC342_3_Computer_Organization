library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

entity Akram_12_20_2021_Register_File is
    port(
        Akram_CLK, Akram_reset, Akram_reg_wren: in std_logic; -- clock, reset, register write enable
        Akram_reg_wr_dest: in std_logic_vector(2 downto 0); -- register write destination
        Akram_write_data: in std_logic_vector(31 downto 0);
		  
        Akram_read_addr_1, Akram_read_addr_2: in std_logic_vector(2 downto 0);
        Akram_read_data_1, Akram_read_data_2: out std_logic_vector(31 downto 0));
end Akram_12_20_2021_Register_File;

architecture arch of Akram_12_20_2021_Register_File is

    type Akram_registers is array (0 to 31) of std_logic_vector(31 downto 0);
    signal reg_array: Akram_registers;
    
    begin
        process(Akram_CLK, Akram_reset)
            begin
                if(Akram_reset='1') then
                    reg_array(0) <= x"00000001";
                    reg_array(1) <= x"00000002";
                    reg_array(2) <= x"00000003";
                    reg_array(3) <= x"00000003";
                    reg_array(4) <= x"00000006";
                    reg_array(5) <= x"00000004";
                    reg_array(6) <= x"0000000A";
                    reg_array(7) <= x"00000005";
                    reg_array(8) <= x"00000009";
                    reg_array(9) <= x"0000000A";
                    reg_array(10) <= x"0000000B";
                    reg_array(11) <= x"0000000C";
                    reg_array(12) <= x"0000000D";
                    reg_array(13) <= x"0000000E";
                    reg_array(14) <= x"0000000F";
                    reg_array(15) <= x"00000010";
                    reg_array(16) <= x"00000011";
                    reg_array(17) <= x"00000012";
                    reg_array(18) <= x"00000013";
                    reg_array(19) <= x"00000014";
                    reg_array(20) <= x"00000015";
                    reg_array(21) <= x"00000016";
                    reg_array(22) <= x"00000017";
                    reg_array(23) <= x"00000018";
                    reg_array(24) <= x"00000019";
                    reg_array(25) <= x"0000001A";
                    reg_array(26) <= x"0000001B";
                    reg_array(27) <= x"0000001C";
                    reg_array(28) <= x"0000001D";
                    reg_array(29) <= x"0000001E";
                    reg_array(30) <= x"0000001F";
                    reg_array(31) <= x"00000020";
                elsif(rising_edge(Akram_CLK))then
                    if(Akram_reg_wren='1') then
                        reg_array(to_integer(unsigned(Akram_reg_wr_dest))) <= Akram_write_data;
                    end if;
                end if;
        end process;
        
        Akram_read_data_1 <= x"00000000" when Akram_read_addr_1 = "111" else reg_array(to_integer(unsigned(Akram_read_addr_1)));
        Akram_read_data_2 <= x"00000005" when Akram_read_addr_2 = "111" else reg_array(to_integer(unsigned(Akram_read_addr_2)));
end arch;