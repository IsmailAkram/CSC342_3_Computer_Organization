library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;
use IEEE.numeric_std.all;

entity Akram_11_14_2021_ALU is
	generic(N: integer := 32);
	port(
		Akram_clk													: in std_logic;
		Akram_RS_i, Akram_RT_i, Akram_MDR_i					: in std_logic_vector (N-1 downto 0); 		-- 32 bit register inputs
		Akram_imm													: in std_logic_vector (15 downto 0); 		-- 16 bit immediate
		Akram_op														: in std_logic_vector(3 downto 0); 			-- Operation Code
		Akram_RD_i													: out std_logic_vector (N-1 downto 0); 	-- 32 bit register output
		Akram_RD_out												: out std_logic_vector (N-1 downto 0); 	-- 32 bit register output
		Akram_Z														: out std_logic := '0'; 						-- Zero flag
		Akram_N														: out std_logic := '0'; 						-- Negative flag 
		Akram_O														: out std_logic := '0'); 						-- Overflow flag 
end Akram_11_14_2021_ALU;

architecture arch of Akram_11_14_2021_ALU is
	signal cout, z_temp0, n_temp0, o_temp0, z_temp1, n_temp1, o_temp1, z_temp2, n_temp2, o_temp2, z_temp3, n_temp3, o_temp3,
				z_temp4, n_temp4, o_temp4, z_temp5, n_temp5, o_temp5, z_temp6, n_temp6, o_temp6, mar_wren, mdr_wren 					: std_logic := '0'; 						-- signals for zero, negative, overflow flags
	signal temp0, temp1, temp2, temp3, temp4, temp5, temp6																							: std_logic_vector (N-1 downto 0);
	signal RS_o, RT_o, RT_out, RD_i, ext_o, MAR_o, MDR_o																								: std_logic_vector (N-1 downto 0);
	signal imm_o																																					: std_logic_vector (15 downto 0);
	
	component Akram_11_14_2021_RD is
    generic (Akram_dw: integer := 32); -- data width; 32-bit RS Register
    port (
        Akram_clk, Akram_wren, Akram_rden, Akram_chen						: in std_logic;
        Akram_content																: in std_logic_vector(Akram_dw-1 downto 0); -- 32-bit input
        Akram_result																	: out std_logic_vector(Akram_dw-1 downto 0)); -- 32-bit output
	end component;

	component Akram_11_14_2021_RT is
    generic (Akram_dw: integer := 32); -- data width; 32-bit RS Register
    port (
        Akram_clk, Akram_wren, Akram_rden, Akram_chen						: in std_logic;
        Akram_content																: in std_logic_vector(Akram_dw-1 downto 0); -- 32-bit input
        Akram_result																	: out std_logic_vector(Akram_dw-1 downto 0)); -- 32-bit output
	end component;

	component Akram_11_14_2021_RS is
    generic (Akram_dw: integer := 32); -- data width; 32-bit RS Register
    port (
        Akram_clk, Akram_wren, Akram_rden, Akram_chen						: in std_logic;
        Akram_content																: in std_logic_vector(Akram_dw-1 downto 0); -- 32-bit input
        Akram_result																	: out std_logic_vector(Akram_dw-1 downto 0)); -- 32-bit output
	end component;

	component Akram_11_14_2021_IMM16 is
    generic (Akram_imm_size: integer := 16); -- 16-bit IMM16 as specified by instruction; accessed in IR
	 
    port (
        Akram_clock, Akram_write, Akram_read, Akram_enable				: in std_logic;
        Akram_input																	: in std_logic_vector(Akram_imm_size-1 downto 0); -- 16-bit
        Akram_out																		: out std_logic_vector(Akram_imm_size-1 downto 0)); -- 16-bit
	end component;
	
	component Akram_11_14_2021_Sign_Extend is
    port(Akram_input									: in std_logic_vector(15 downto 0); -- extending from 16-bit 
          Akram_out									: out std_logic_vector(31 downto 0)); -- to 32-bit
	end component;
	
	component Akram_11_14_2021_MAR is
    generic (Akram_dw: integer := 32); -- data width
    port (
        Akram_clk, Akram_wren, Akram_rden, Akram_chen						: in std_logic;
        Akram_content																: in std_logic_vector(Akram_dw-1 downto 0);
        Akram_ext																		: in std_logic_vector(Akram_dw-1 downto 0);
        Akram_result																	: out std_logic_vector(Akram_dw-1 downto 0));
	end component;
	
	component Akram_11_14_2021_MDR is
    generic (Akram_dw: integer := 32); -- data width
    port (
        Akram_clk, Akram_wren, Akram_rden, Akram_chen						: in std_logic;
        Akram_content																: in std_logic_vector(Akram_dw-1 downto 0);
        Akram_result																	: out std_logic_vector(Akram_dw-1 downto 0));
	end component;
	
	component Akram_9_19_2021_N_Bit_Add_Sub_Flags is
    generic(n: natural := 16);
	 
    port(Akram_a, Akram_b					: in std_logic_vector(n-1 downto 0);
        Akram_sum								: out std_logic_vector(n-1 downto 0);
        Akram_op								: in std_logic;
        Akram_ovf, Akram_n, Akram_z		: out std_logic); -- carry flag, overflow, Negative, Zero
	end component;
	
	component Akram_11_14_2021_Bitwise_OP is
    generic(n: integer := 32);
    port(
        Akram_input_1, Akram_input_2, Akram_ext				: in std_logic_vector(n-1 downto 0);
        Akram_imm														: in std_logic_vector(15 downto 0); -- 16-bit
        Akram_op														: in std_logic_vector(3 downto 0); -- 4-bit
        Akram_out														: out std_logic_vector(n-1 downto 0));
	end component;
	
	begin
		-- Registers
		RD: Akram_11_14_2021_RD generic map (Akram_dw => 32) port map (Akram_clk, '1', '1', '1', RD_i, Akram_RD_i);
		RS: Akram_11_14_2021_RS generic map (Akram_dw => 32) port map (Akram_clk, '1', '1', '1', Akram_RS_i, RS_o);		
		RT: Akram_11_14_2021_RT generic map (Akram_dw => 32) port map (Akram_clk, '1', '1', '1', Akram_RT_i, RT_o);
		
		imm: Akram_11_14_2021_IMM16 generic map (Akram_imm_size => 16) port map (Akram_clk, '1', '1', '1', Akram_imm, imm_o);
		ext: Akram_11_14_2021_Sign_Extend port map (Akram_imm, ext_o);
		
		MAR: Akram_11_14_2021_MAR generic map (Akram_dw => 32) port map (Akram_clk, '1', '1', '1', RS_o, ext_o, MAR_o);
		MDR: Akram_11_14_2021_MDR generic map (Akram_dw => 32) port map (Akram_clk, '1', '1', '1', Akram_MDR_i, MDR_o);
		
		-- Operations
		add: 		Akram_9_19_2021_N_Bit_Add_Sub_Flags generic map (n => 32) port map (RS_o, RT_o, 	temp0, '0', 	o_temp0, z_temp0, n_temp0);
		addi: 	Akram_9_19_2021_N_Bit_Add_Sub_Flags generic map (n => 32) port map (RS_o, ext_o, temp1, '0', 	o_temp1, z_temp1, n_temp1);
		addiu: 	Akram_9_19_2021_N_Bit_Add_Sub_Flags generic map (n => 32) port map (RS_o, ext_o, temp2, '0', 	o_temp2, z_temp2, n_temp2);
		addu: 	Akram_9_19_2021_N_Bit_Add_Sub_Flags generic map (n => 32) port map (RS_o, RT_o, 	temp3, '0', 	o_temp3, z_temp3, n_temp3);
		sub: 		Akram_9_19_2021_N_Bit_Add_Sub_Flags generic map (n => 32) port map (RS_o, RT_o, 	temp4, '1', 	o_temp4, z_temp4, n_temp4);
		subu: 	Akram_9_19_2021_N_Bit_Add_Sub_Flags generic map (n => 32) port map (RS_o, RT_o, 	temp5, '1',  	o_temp5, z_temp5, n_temp5);
		
		bit_op: 	Akram_11_14_2021_Bitwise_OP generic map (N => 32) port map (RS_o, RT_o, ext_o, imm_o, Akram_op, temp6);
		
		-- Assign results
		P1: process(temp0, temp1, temp2, temp3, temp4, temp5, temp6)
			begin
				case Akram_op is
					when "0000"=> Akram_RD_out <= temp0; Akram_O <= o_temp0; Akram_N <= n_temp0; Akram_Z <= z_temp0;
					when "0001"=> RT_out <= temp1; Akram_O <= o_temp1; Akram_N <= n_temp1; Akram_Z <= z_temp1;
					when "0010"=> RT_out <= temp2; Akram_O <= '0'; Akram_N <= n_temp2; Akram_Z <= z_temp2;
					when "0011"=> Akram_RD_out <= temp3; Akram_O <= '0'; Akram_N <= n_temp3; Akram_Z <= z_temp3;
					when "0100"=> Akram_RD_out <= temp4; Akram_O <= o_temp4; Akram_N <= n_temp4; Akram_Z <= z_temp4;
					when "0101"=> Akram_RD_out <= temp5; Akram_O <= '0'; Akram_N <= n_temp5; Akram_Z <= z_temp5;
					when "0110" | "1000" | "1001"| "1011" | "1100" | "1101" => Akram_RD_out <= temp6; Akram_O <= o_temp6; Akram_N <= n_temp6; Akram_Z <= z_temp6;
					when "0111" | "1010" => RT_out <= temp6; Akram_O <= o_temp6; Akram_N <= n_temp6; Akram_Z <= z_temp6;
					when "1110" => RT_out <= MAR_o; 
					when "1111" => RT_out <= MDR_o;
					when others => Akram_RD_out <= x"00000000";
				end case;
			end process;
end arch;