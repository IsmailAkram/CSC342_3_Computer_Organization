library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Akram_11_14_2021_Instruction_Register is  
    port(
        signal clk, memwrite, rdaddress, wraddress 		: in std_logic;
		  signal OP          										: in std_logic_vector(3 downto 0);
        signal RD, RS, RT  										: in std_logic_vector(31 downto 0);
		  signal IMM         										: in std_logic_vector(31 downto 0);
        signal INSTRUCTION 										: out std_logic_vector(67 downto 0)
    );
end entity Akram_11_14_2021_Instruction_Register;


architecture behavior of Akram_11_14_2021_Instruction_Register is
    type memory is array(47 downto 0) of std_logic_vector(31 downto 0);
    signal IR : memory;
    
    begin
        writeMem : process(clk, wraddress, memwrite, RS, RT, RD, IMM, OP)
            begin
                if rising_edge(clk) and memwrite = '1' then
                    case OP is
                        when "0000" =>
                            IR(0)(3 downto 0) <= OP(3 downto 0);
									 IR(0)(31 downto 4) <= (others => '0');
                            IR(1) <= RS(31 downto 0);
                            IR(2) <= RT(31 downto 0);

                        when "0001" =>
                            IR(3)(3 downto 0) <= OP(3 downto 0);
									 IR(3)(31 downto 4) <= (others => '0');
                            IR(4) <= RS(31 downto 0);
                            IR(5) <= IMM(31 downto 0);

                        when "0010" =>
                           IR(6)(3 downto 0) <= OP(3 downto 0);
									 IR(6)(31 downto 4) <= (others => '0');
                            IR(7) <= RS(31 downto 0);
                            IR(8) <= IMM(31 downto 0);
								
								when "0011" =>
                            IR(9)(3 downto 0) <= OP(3 downto 0);
									 IR(9)(31 downto 4) <= (others => '0');
                            IR(10) <= RS(31 downto 0);
                            IR(11) <= RT(31 downto 0);
								when "0100" =>
                            IR(12)(3 downto 0) <= OP(3 downto 0);
									 IR(12)(31 downto 4) <= (others => '0');
                            IR(13) <= RS(31 downto 0);
                            IR(14) <= RT(31 downto 0);
								
								when "0101" =>
                            IR(15)(3 downto 0) <= OP(3 downto 0);
									 IR(15)(31 downto 4) <= (others => '0');
                            IR(16) <= RS(31 downto 0);
                            IR(17) <= RT(31 downto 0);
								
								when "0110" =>
                            IR(18)(3 downto 0) <= OP(3 downto 0);
									 IR(18)(31 downto 4) <= (others => '0');
                            IR(19) <= RS(31 downto 0);
                            IR(20) <= RT(31 downto 0);
								
								when "0111" =>
                            IR(21)(3 downto 0) <= OP(3 downto 0);
									 IR(21)(31 downto 4) <= (others => '0');
                            IR(22) <= RS(31 downto 0);
                            IR(23) <= IMM(31 downto 0);
                        
								when "1000" =>
                            IR(24)(3 downto 0) <= OP(3 downto 0);
									 IR(24)(31 downto 4) <= (others => '0');
                            IR(25) <= RS(31 downto 0);
                            IR(26) <= RT(31 downto 0);
								
								when "1001" =>
                            IR(27)(3 downto 0) <= OP(3 downto 0);
									 IR(27)(31 downto 4) <= (others => '0');
                            IR(28) <= RS(31 downto 0);
                            IR(29) <= RT(31 downto 0);
									 
								when "1010" =>
                            IR(30)(3 downto 0) <= OP(3 downto 0);
									 IR(30)(31 downto 4) <= (others => '0');
                            IR(31) <= RS(31 downto 0);
                            IR(32) <= IMM(31 downto 0);
								
								when "1011" =>
                            IR(33)(3 downto 0) <= OP(3 downto 0);
									 IR(33)(31 downto 4) <= (others => '0');
                            IR(34) <= RS(31 downto 0);
                            IR(35) <= IMM(31 downto 0);
								
								when "1100" =>
                            IR(36)(3 downto 0) <= OP(3 downto 0);
									 IR(36)(31 downto 4) <= (others => '0');
                            IR(37) <= RS(31 downto 0);
                            IR(38) <= IMM(31 downto 0);
									 
								when "1101" =>
                            IR(39)(3 downto 0) <= OP(3 downto 0);
									 IR(39)(31 downto 4) <= (others => '0');
                            IR(40) <= RS(31 downto 0);
                            IR(41) <= IMM(31 downto 0);
									 
								when "1110" =>
                            IR(42)(3 downto 0) <= OP(3 downto 0);
									 IR(42)(31 downto 4) <= (others => '0');
                            IR(43) <= RS(31 downto 0);
                            IR(44) <= IMM(31 downto 0);
									 
								when "1111" =>
                            IR(45)(3 downto 0) <= OP(3 downto 0);
									 IR(45)(31 downto 4) <= (others => '0');
                            IR(46) <= RS(31 downto 0);
                            IR(47) <= IMM(31 downto 0);
								
                        when others => null;
                    end case;
                end if;
        end process;

        readMem : process(CLK, OP)
            begin
                case OP is
                    when "0000" =>
                        INSTRUCTION(67 downto 64) 	<= IR(0)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(1);
								INSTRUCTION(31 downto 0) 	<= IR(2); 

                    when "0001" =>
                        INSTRUCTION(67 downto 64) 	<= IR(3)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(4);
								INSTRUCTION(31 downto 0) 	<= IR(5);

                    when "0010" =>
                        INSTRUCTION(67 downto 64) 	<= IR(6)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(7);
								INSTRUCTION(31 downto 0) 	<= IR(8);

                    when "0011" =>
                        INSTRUCTION(67 downto 64) 	<= IR(9)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(10);
								INSTRUCTION(31 downto 0) 	<= IR(11);
								
						  when "0100" =>
                        INSTRUCTION(67 downto 64) 	<= IR(12)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(13);
								INSTRUCTION(31 downto 0) 	<= IR(14);
						  
						  when "0101" =>
                        INSTRUCTION(67 downto 64) 	<= IR(15)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(16);
								INSTRUCTION(31 downto 0) 	<= IR(17);
								
						  when "0110" =>
                        INSTRUCTION(67 downto 64) 	<= IR(18)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(19);
								INSTRUCTION(31 downto 0) 	<= IR(20);
								
						  when "0111" =>
                        INSTRUCTION(67 downto 64) 	<= IR(21)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(22);
								INSTRUCTION(31 downto 0) 	<= IR(23);
								
						  when "1000" =>
                        INSTRUCTION(67 downto 64) 	<= IR(24)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(25);
								INSTRUCTION(31 downto 0) 	<= IR(26);
								
						  when "1001" =>
                        INSTRUCTION(67 downto 64) 	<= IR(27)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(28);
								INSTRUCTION(31 downto 0) 	<= IR(29);
								
						  when "1010" =>
                        INSTRUCTION(67 downto 64) 	<= IR(30)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(31);
								INSTRUCTION(31 downto 0) 	<= IR(32);
								
						  when "1011" =>
                        INSTRUCTION(67 downto 64) 	<= IR(33)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(34);
								INSTRUCTION(31 downto 0) 	<= IR(35);
								
						  when "1100" =>
                        INSTRUCTION(67 downto 64) 	<= IR(36)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(37);
								INSTRUCTION(31 downto 0) 	<= IR(38);
								
						  when "1101" =>
                        INSTRUCTION(67 downto 64) 	<= IR(39)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(40);
								INSTRUCTION(31 downto 0) 	<= IR(41);
							
						  when "1110" =>
                        INSTRUCTION(67 downto 64) 	<= IR(42)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(43);
								INSTRUCTION(31 downto 0) 	<= IR(44);
								
						  when "1111" =>
                        INSTRUCTION(67 downto 64) 	<= IR(45)(3 downto 0);
								INSTRUCTION(63 downto 32) 	<= IR(46);
								INSTRUCTION(31 downto 0) 	<= IR(47);

                    when others => null;
                end case;
        end process;
end architecture behavior;