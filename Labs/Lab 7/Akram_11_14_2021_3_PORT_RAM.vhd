library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Akram_11_14_2021_3_PORT_RAM is -- 3-ported RAM as a REGISTER FILE
    port(
        signal REGWR, CLK : in std_logic;
		  signal OP         : in std_logic_vector(3 downto 0);
        signal RD, RS, RT : in std_logic_vector(31 downto 0);
        signal RDATA1, RDATA2 : out std_logic_vector(31 downto 0)
    );
end entity Akram_11_14_2021_3_PORT_RAM;

architecture behavior of Akram_11_14_2021_3_PORT_RAM is
    type registerFile is array(31 downto 0) of std_logic_vector(31 downto 0);
    signal r : registerFile; 

    begin
        writeReg : process(CLK, OP, REGWR)
            begin
                if rising_edge(CLK) and REGWR = '1' then
                    case OP is
                        when "0000" =>
                            r(0) <= RS;
									 r(1) <= RT;
                        when "0001" =>
                            r(2) <= RS;
									 r(3) <= RT;
                        when "0010" =>
                            r(4) <= RS;
									 r(5) <= RT;
                        when "0011" =>
                            r(6) <= RS;
									 r(7) <= RT;
                        when "0100" =>
                            r(8) <= RS;
									 r(9) <= RT;
                        when "0101" =>
                            r(10) <= RS;
									 r(11) <= RT;
                        when "0110" =>
                            r(12) <= RS;
									 r(13) <= RT;
                        when "0111" =>
                            r(14) <= RS;
									 r(15) <= RT;
                        when "1000" =>
                            r(16) <= RS;
									 r(17) <= RT;
                        when "1001" =>
                            r(18) <= RS;
									 r(19) <= RT;
                        when "1010" =>
                            r(20) <= RS;
									 r(21) <= RT;
                        when "1011" =>
                            r(22) <= RS;
									 r(23) <= RT;
                        when "1100" =>
                            r(24) <= RS;
									 r(25) <= RT;
                        when "1101" =>
                            r(26) <= RS;
									 r(27) <= RT;
								when "1110" =>
                            r(28) <= RS;
									 r(29) <= RT;
							   when "1111" =>
                            r(30) <= RS;
									 r(31) <= RT;
                        when others => null;
                    end case;
                end if;
        end process;

        readReg1 : process(CLK, OP)
            begin
                case OP is
                    when "0000" =>
                        RDATA1 <= r(0);
                    when "0001" =>
                        RDATA1 <= r(2);
                    when "0010" =>
                        RDATA1 <= r(4);
                    when "0011" =>
                        RDATA1 <= r(6);
                    when "0100" =>
                        RDATA1 <= r(8);
                    when "0101" =>
                        RDATA1 <= r(10);
                    when "0110" =>
                        RDATA1 <= r(12);
                    when "0111" =>
                        RDATA1 <= r(14);
                    when "1000" =>
                        RDATA1 <= r(16);
                    when "1001" =>
                        RDATA1 <= r(18);
                    when "1010" =>
                        RDATA1 <= r(20);
                    when "1011" =>
                        RDATA1 <= r(22);
                    when "1100" =>
                        RDATA1 <= r(24);
						  when "1101" =>
                        RDATA1 <= r(26);
						  when "1110" =>
                        RDATA1 <= r(28);
						  when "1111" =>
                        RDATA1 <= r(30);
                    when others => null;
                end case;
        end process;

        readReg2 : process(CLK, OP)
            begin
                case OP is
                    when "0000" =>
                        RDATA2 <= r(1);
                    when "0001" =>
                        RDATA2 <= r(3);
                    when "0010" =>
                        RDATA2 <= r(5);
                    when "0011" =>
                        RDATA2 <= r(7);
                    when "0100" =>
                        RDATA2 <= r(9);
                    when "0101" =>
                        RDATA2 <= r(11);
                    when "0110" =>
                        RDATA2 <= r(13);
                    when "0111" =>
                        RDATA2 <= r(15);
                    when "1000" =>
                        RDATA2 <= r(17);
                    when "1001" =>
                        RDATA2 <= r(19);
                    when "1010" =>
                        RDATA2 <= r(21);
                    when "1011" =>
                        RDATA2 <= r(23);
                    when "1100" =>
                        RDATA2 <= r(25);
						  when "1101" =>
                        RDATA2 <= r(27);
						  when "1110" =>
                        RDATA2 <= r(29);
						  when "1111" =>
                        RDATA2 <= r(31);
                    when others => null;
                end case;
        end process;

       -- r(0) <= X"00000000";   -- zero register
        --r(29) <= X"000000FC";  -- stack pointer
        --RV <= r(1);
end architecture behavior;