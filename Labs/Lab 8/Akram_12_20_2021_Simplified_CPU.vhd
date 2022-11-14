library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_signed.all;

entity Akram_12_20_2021_Simplified_CPU is
	port(
		Akram_CLK, Akram_reset: in std_logic; -- clock and reset
		Akram_PC_out, Akram_ALU_result: out std_logic_vector(31 downto 0));
	
end Akram_12_20_2021_Simplified_CPU;

architecture arch of Akram_12_20_2021_Simplified_CPU is

	signal Akram_PC_current, Akram_PC_next, Akram_PC2: std_logic_vector(31 downto 0);
	signal Akram_instr: std_logic_vector(31 downto 0);
	signal Akram_reg_DST, Akram_mem_to_reg, Akram_ALU_OP: std_logic_vector(1 downto 0);
	signal Akram_JMP, Akram_branch, Akram_mem_rden, Akram_mem_wren, Akram_ALU_src, Akram_reg_wr, Akram_ext: std_logic;
	signal Akram_reg_wr_dest: std_logic_vector(2 downto 0);
	signal Akram_reg_write_data: std_logic_vector(31 downto 0);
	
	signal Akram_reg_read_addr_1: std_logic_vector(2 downto 0);
	signal Akram_reg_read_data_1: std_logic_vector(31 downto 0);
	signal Akram_reg_read_addr_2: std_logic_vector(2 downto 0);
	signal Akram_reg_read_data_2: std_logic_vector(31 downto 0);
	
	signal Akram_sign_ext_imm, Akram_read_data2, Akram_zero_ext_imm, Akram_imm_ext: std_logic_vector(31 downto 0);
	signal JRControl: std_logic;
	signal Akram_ALU_Control: std_logic_vector(2 downto 0);
	signal Akram_ALU_out: std_logic_vector(31 downto 0);
	signal Akram_zero_flag: std_logic;
	
	signal imm_shift_1, PC_j, PC_BEQ, PC_4BEQ, PC_4BEQj,PC_jr: std_logic_vector(31 downto 0);
	signal BEQ_Control: std_logic;
	signal jump_shift_1: std_logic_vector(30 downto 0);
	signal Akram_mem_rden_data: std_logic_vector(31 downto 0);
	signal no_sign_ext: std_logic_vector(31 downto 0);
	signal sign_or_zero: std_logic;
	signal tmp1: std_logic_vector(15 downto 0);
	
	-- Key Components
		component Akram_12_20_2021_ALU is
			port(
				Akram_a, Akram_b: in std_logic_vector(31 downto 0);
				Akram_ALU_Control: in std_logic_vector(2 downto 0); -- 3 bits for the ALU Control for our +, -, and, or operations
				Akram_result: out std_logic_vector(31 downto 0);
				Akram_Z_Flag: out std_logic); -- zero flag
		end component;
		
		component Akram_12_20_2021_ALU_Control_Adder is
			port(
				Akram_ALU_Control_Main: out std_logic_vector(2 downto 0); -- ALU Control
				Akram_ALU_OP: in std_logic_vector(1 downto 0); -- operation
				Akram_ALU_func: in std_logic_vector(2 downto 0)); -- function
		end component;
		
		component Akram_12_20_2021_Control_Unit is
			port(
				Akram_OP: in std_logic_vector(2 downto 0);
				Akram_RST: in std_logic;
				Akram_reg_DST, Akram_mem_to_reg, Akram_ALU_OP: out std_logic_vector(1 downto 0);
				Akram_JMP, Akram_branch, Akram_mem_rden, Akram_mem_wren, Akram_ALU_src, Akram_reg_wr, Akram_ext: out std_logic);
		end component;
		
		component Akram_12_20_2021_Data_Memory is
			port(
				Akram_CLK, Akram_wren, Akram_rden: in std_logic; -- clock, write and read enable
				Akram_mem_address, Akram_write_data: in std_logic_vector(31 downto 0); -- 32 bits
				Akram_data: out std_logic_vector(31 downto 0)); -- 32 bits
		end component;
		
		component Akram_12_20_2021_IR is
			port(
				Akram_PC: in std_logic_vector(31 downto 0); -- Program Counter, 32 bits
				Akram_instruction: out std_logic_vector(31 downto 0)); -- 32 bits
		end component;
		
		component Akram_12_20_2021_Register_File is
			port(
				Akram_CLK, Akram_reset, Akram_reg_wren: in std_logic; -- clock, reset, register write enable
				Akram_reg_wr_dest: in std_logic_vector(2 downto 0); -- register write destination
				Akram_write_data: in std_logic_vector(31 downto 0);
		  
				Akram_read_addr_1, Akram_read_addr_2: in std_logic_vector(2 downto 0);
				Akram_read_data_1, Akram_read_data_2: out std_logic_vector(31 downto 0));
		end component;
	
	begin
		-- Set PC to first instruction
		process(Akram_CLK, Akram_reset)
			begin
				if(Akram_reset = '1') then
					Akram_PC_current <= x"00000000";
				elsif(rising_edge(Akram_CLK)) then
					Akram_PC_current <= Akram_PC_next;
				end if;
		end process;
		
		-- increment PC by 2
		Akram_PC2 <= Akram_PC_current + x"00000001";
		
		-- instantiate Intruction Memory
		Instruction_Memory: Akram_12_20_2021_IR
			port map(
				Akram_PC => Akram_PC_current,
				Akram_instruction => Akram_instr
			);
			
		-- jump shift left
		jump_shift_1 <= Akram_instr(29 downto 0) & '0';
		
		-- Main Control Unit of the processor
		Control: Akram_12_20_2021_Control_Unit
			port map(
				Akram_RST => Akram_reset,
				Akram_OP => Akram_instr(31 downto 29),
				Akram_reg_DST => Akram_reg_DST,
				Akram_mem_to_reg => Akram_mem_to_reg,
				Akram_ALU_OP => Akram_ALU_OP,
				Akram_JMP => Akram_JMP,
				Akram_branch => Akram_branch,
				Akram_mem_rden => Akram_mem_rden,
				Akram_mem_wren => Akram_mem_wren,
				Akram_ALU_src => Akram_ALU_src,
				Akram_reg_wr => Akram_reg_wr,
				Akram_ext => sign_or_zero);
			
			-- Multiplexer reg_dest
			Akram_reg_wr_dest <= "111" when Akram_reg_DST = "10" else
				Akram_instr(24 downto 22) when Akram_reg_DST = "01" else
				Akram_instr(21 downto 19);
				
			-- instantiate Register File
			Akram_reg_read_addr_1 <= Akram_instr(28 downto 26);
			Akram_reg_read_addr_2 <= Akram_instr(25 downto 23);
			
			Register_File: Akram_12_20_2021_Register_File
				port map(
					Akram_CLK => Akram_CLK,
					Akram_reset => Akram_reset,
					Akram_reg_wren => Akram_reg_wr,
					Akram_reg_wr_dest => Akram_reg_wr_dest,
					Akram_write_data => Akram_reg_write_data,
					Akram_read_addr_1 => Akram_reg_read_addr_1,
					Akram_read_data_1 => Akram_reg_read_data_1,
					Akram_read_addr_2 => Akram_reg_read_addr_2,
					Akram_read_data_2 => Akram_reg_read_data_2);
				
			-- sign extend
			tmp1 <= (others => Akram_instr(6));
			Akram_sign_ext_imm <=  tmp1 & Akram_instr(15 downto 0); 
			Akram_zero_ext_imm <= "0000000000000000"& Akram_instr(15 downto 0); 
			Akram_imm_ext <= Akram_sign_ext_imm when sign_or_zero='1' else Akram_zero_ext_imm;
			
			-- JR control
			JRControl <= '1' when ((Akram_ALU_OP="00") and (Akram_instr(3 downto 0)="1000")) else '0';
			
			-- ALU control
			ALU_Control: Akram_12_20_2021_ALU_Control_Adder port map(
				Akram_ALU_OP => Akram_ALU_OP,
				Akram_alu_func => Akram_instr(2 downto 0),
				Akram_ALU_Control_Main => Akram_ALU_Control);
			
			-- Multiplexer for ALU
			Akram_read_data2 <= Akram_imm_ext when Akram_ALU_src = '1' else Akram_reg_read_data_2;
			
			-- instantiate ALU
			ALU: Akram_12_20_2021_ALU port map(
				Akram_a => Akram_reg_read_data_1,
				Akram_b => Akram_reg_read_data_2,
				Akram_ALU_Control => Akram_ALU_Control,
				Akram_result => Akram_ALU_out,
				Akram_Z_Flag => Akram_zero_flag);
				
			-- data memory of the MIPS Processor in VHDL
			Data_Memory: Akram_12_20_2021_Data_Memory port map(
				Akram_CLK => Akram_CLK,
				Akram_mem_address => Akram_ALU_out,
				Akram_write_data => Akram_reg_read_data_2,
				Akram_wren => Akram_mem_wren,
				Akram_rden => Akram_mem_rden,
				Akram_data => Akram_mem_rden_data);
			
			-- immediate shift 1
			imm_shift_1 <= Akram_imm_ext(30 downto 0) & '0';
			no_sign_ext <= (not imm_shift_1) + x"0001";
			-- PC BEQ add
			PC_BEQ <= (Akram_PC2 - no_sign_ext) when imm_shift_1(15) = '1' else (Akram_PC2 +imm_shift_1);
			-- BEQ control
			BEQ_Control <= Akram_branch and Akram_zero_flag;
			-- PC_BEQ
			PC_4BEQ <= PC_BEQ when BEQ_Control='1' else Akram_PC2;
			-- PC_j
			PC_j <= Akram_PC2(15) & jump_shift_1;
			-- PC_4BEQj
			PC_4BEQj <= PC_j when Akram_JMP = '1' else  PC_4BEQ;
			-- PC_jr
			PC_jr <= Akram_reg_read_data_1;
			-- PC_next
			Akram_PC_next <= PC_jr when (JRControl='1') else PC_4BEQj;
			
			-- Writing back data
			Akram_reg_write_data <= Akram_ALU_out;
				
			Akram_PC_out <= Akram_PC_current;
			Akram_ALU_result <= Akram_ALU_out;
end arch;