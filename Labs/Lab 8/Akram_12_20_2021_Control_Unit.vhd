library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Akram_12_20_2021_Control_Unit is
	port(
		Akram_OP: in std_logic_vector(2 downto 0);
		Akram_RST: in std_logic;
		Akram_reg_DST, Akram_mem_to_reg, Akram_ALU_OP: out std_logic_vector(1 downto 0);
		Akram_JMP, Akram_branch, Akram_mem_rden, Akram_mem_wren, Akram_ALU_src, Akram_reg_wr, Akram_ext: out std_logic);
	
end Akram_12_20_2021_Control_Unit;

architecture arch of Akram_12_20_2021_Control_Unit is

begin
	process(Akram_RST,Akram_OP)
		begin
			if(Akram_RST = '1') then
				Akram_reg_DST <= "00";
				Akram_mem_to_reg <= "00"; -- location of register
				Akram_ALU_OP <= "00";
				Akram_JMP <= '0';
				Akram_branch <= '0';
				Akram_mem_rden <= '0'; -- read enabled/disabled ... rden
				Akram_mem_wren <= '0'; -- write enabled/disabled ... wren
				Akram_ALU_src <= '0';
				Akram_reg_wr <= '0';
				Akram_ext <= '1';
			else
				case Akram_OP is
					when "000" => -- addition
						Akram_reg_DST <= "01";
						Akram_mem_to_reg <= "00"; -- location of register
						Akram_ALU_OP <= "00";
						Akram_JMP <= '0';
						Akram_branch <= '0';
						Akram_mem_rden <= '0'; -- read enabled/disabled ... rden
						Akram_mem_wren <= '0'; -- write enabled/disabled ... wren
						Akram_ALU_src <= '0';
						Akram_reg_wr <= '1';
						Akram_ext <= '1';
						
					when "001" => -- Shift Left Immediately Unsigned SLIU
						Akram_reg_DST <= "00";
						Akram_mem_to_reg <= "00"; -- location of register
						Akram_ALU_OP <= "10";
						Akram_JMP <= '0';
						Akram_branch <= '0';
						Akram_mem_rden <= '0'; -- read enabled/disabled ... rden
						Akram_mem_wren <= '0'; -- write enabled/disabled ... wren
						Akram_ALU_src <= '1';
						Akram_reg_wr <= '1';
						Akram_ext <= '0';
					
					when "010" => -- jump
						Akram_reg_DST <= "00";
						Akram_mem_to_reg <= "00"; -- location of register
						Akram_ALU_OP <= "00";
						Akram_JMP <= '1';
						Akram_branch <= '0';
						Akram_mem_rden <= '0'; -- read enabled/disabled ... rden
						Akram_mem_wren <= '0'; -- write enabled/disabled ... wren
						Akram_ALU_src <= '0';
						Akram_reg_wr <= '0';
						Akram_ext <= '1';
					
					when "011" => -- Jump and Link ... JAL
						Akram_reg_DST <= "10";
						Akram_mem_to_reg <= "10"; -- read enabled/disabled ... rden
						Akram_ALU_OP <= "00";
						Akram_JMP <= '1';
						Akram_branch <= '0';
						Akram_mem_rden <= '0'; -- read enabled/disabled ... rden
						Akram_mem_wren <= '0'; -- write enabled/disabled ... wren
						Akram_ALU_src <= '0';
						Akram_reg_wr <= '1';
						Akram_ext <= '1';
						
					when "100" => -- LW
						Akram_reg_DST <= "00";
						Akram_mem_to_reg <= "01"; -- read enabled/disabled ... rden
						Akram_ALU_OP <= "11";
						Akram_JMP <= '0';
						Akram_branch <= '0';
						Akram_mem_rden <= '1'; -- read enabled/disabled ... rden
						Akram_mem_wren <= '0'; -- write enabled/disabled ... wren
						Akram_ALU_src <= '1';
						Akram_reg_wr <= '0';
						Akram_ext <= '1';
						
					when "101" => -- SW
						Akram_reg_DST <= "00";
						Akram_mem_to_reg <= "00"; -- read enabled/disabled ... rden
						Akram_ALU_OP <= "11";
						Akram_JMP <= '0';
						Akram_branch <= '0';
						Akram_mem_rden <= '0'; -- read enabled/disabled ... rden
						Akram_mem_wren <= '1'; -- write enabled/disabled ... wren
						Akram_ALU_src <= '1';
						Akram_reg_wr <= '1';
						Akram_ext <= '1';
					
					when "110" => -- Branch if equal BEQ
						Akram_reg_DST <= "00";
						Akram_mem_to_reg <= "00"; -- read enabled/disabled ... rden
						Akram_ALU_OP <= "01";
						Akram_JMP <= '0';
						Akram_branch <= '1';
						Akram_mem_rden <= '0'; -- read enabled/disabled ... rden
						Akram_mem_wren <= '0'; -- write enabled/disabled ... wren
						Akram_ALU_src <= '0';
						Akram_reg_wr <= '0';
						Akram_ext <= '1';
						
					when "111" => -- ADDI
						Akram_reg_DST <= "00";
						Akram_mem_to_reg <= "00"; -- read enabled/disabled ... rden
						Akram_ALU_OP <= "11";
						Akram_JMP <= '0';
						Akram_branch <= '0';
						Akram_mem_rden <= '0'; -- read enabled/disabled ... rden
						Akram_mem_wren <= '0'; -- write enabled/disabled ... wren
						Akram_ALU_src <= '1';
						Akram_reg_wr <= '1';
						Akram_ext <= '1';
						
					when others =>
						Akram_reg_DST <= "01";
						Akram_mem_to_reg <= "00"; -- read enabled/disabled ... rden
						Akram_ALU_OP <= "00";
						Akram_JMP <= '0';
						Akram_branch <= '0';
						Akram_mem_rden <= '0'; -- read enabled/disabled ... rden
						Akram_mem_wren <= '0'; -- write enabled/disabled ... wren
						Akram_ALU_src <= '0';
						Akram_reg_wr <= '1';
						Akram_ext <= '1';
				end case;
			end if;
		end process;
		
end arch;