-- megafunction wizard: %RAM: 2-PORT%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: altsyncram 

-- ============================================================
-- File Name: ram32x4_port_3.vhd
-- Megafunction Name(s):
-- 			altsyncram
--
-- Simulation Library Files(s):
-- 			altera_mf
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 16.0.0 Build 211 04/27/2016 SJ Lite Edition
-- ************************************************************


--Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
--Your use of Altera Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Altera Program License 
--Subscription Agreement, the Altera Quartus Prime License Agreement,
--the Altera MegaCore Function License Agreement, or other 
--applicable license agreement, including, without limitation, 
--that your use is for the sole purpose of programming logic 
--devices manufactured by Altera and sold by Altera or its 
--authorized distributors.  Please refer to the applicable 
--agreement for further details.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

-- Modified version of a 2-port RAM (1 read, 1 write) to turn this into a 3-port RAM (2 read and 1 write).
ENTITY ram32x4_port_3 IS
	PORT
	(
		AKRAM_clock				: IN STD_LOGIC  := '1';
		data				: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		rdaddress_a		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		rdaddress_b		: IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- added the additional read
		
		rden				: IN STD_LOGIC  := '1';
		wraddress		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		wren				: IN STD_LOGIC  := '0';
		q_a				: OUT STD_LOGIC_VECTOR (3 DOWNTO 0); -- feed this into the adder
		q_b				: OUT STD_LOGIC_VECTOR (3 DOWNTO 0)  -- feed this into the adder
		
	);
END ram32x4_port_3;


ARCHITECTURE SYN OF ram32x4_port_3 IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (3 DOWNTO 0); -- added an additional sginal

BEGIN
	q_a    <= sub_wire0(3 DOWNTO 0);
	q_b    <= sub_wire1(3 DOWNTO 0); -- added an additional q output

	altsyncram_component : altsyncram
	GENERIC MAP (
		address_aclr_b => "NONE",
		address_reg_b => "CLOCK0",
		clock_enable_input_a => "BYPASS",
		clock_enable_input_b => "BYPASS",
		clock_enable_output_b => "BYPASS",
		init_file => "ram32x4_3_port.mif", -- save 
		intended_device_family => "Cyclone V",
		lpm_type => "altsyncram",
		numwords_a => 32,
		numwords_b => 32,
		operation_mode => "DUAL_PORT",
		outdata_aclr_b => "NONE",
		outdata_reg_b => "UNREGISTERED",
		power_up_uninitialized => "FALSE",
		ram_block_type => "M10K",
		rdcontrol_reg_b => "CLOCK0",
		read_during_write_mode_mixed_ports => "DONT_CARE",
		widthad_a => 5,
		widthad_b => 5,
		width_a => 4,
		width_b => 4,
		width_byteena_a => 1
	)
	PORT MAP (
		address_a => wraddress,
		address_b => rdaddress_a,
		clock0 => clock,
		data_a => data,
		wren_a => wren,
		q_b => sub_wire0
	);

	altsyncram_component_Two : altsyncram
		GENERIC MAP (
			address_aclr_b => "NONE",
			address_reg_b => "CLOCK0",
			clock_enable_input_a => "BYPASS",
			clock_enable_input_b => "BYPASS",
			clock_enable_output_b => "BYPASS",
			init_file => "ram32x4_3_port.mif",
			intended_device_family => "Cyclone V",
			lpm_type => "altsyncram",
			numwords_a => 32,
			numwords_b => 32,
			operation_mode => "DUAL_PORT",
			outdata_aclr_b => "NONE",
			outdata_reg_b => "UNREGISTERED",
			power_up_uninitialized => "FALSE",
			ram_block_type => "M10K",
			rdcontrol_reg_b => "CLOCK0",
			read_during_write_mode_mixed_ports => "DONT_CARE",
			widthad_a => 5,
			widthad_b => 5,
			width_a => 4,
			width_b => 4,
			width_byteena_a => 1
		)
		PORT MAP (
			address_a => wraddress,
			address_b => rdaddress_b,
			clock0 => clock,
			data_a => data,
			wren_a => wren,
			q_b => sub_wire1
		);

END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: ADDRESSSTALL_A NUMERIC "0"
-- Retrieval info: PRIVATE: ADDRESSSTALL_B NUMERIC "0"
-- Retrieval info: PRIVATE: BYTEENA_ACLR_A NUMERIC "0"
-- Retrieval info: PRIVATE: BYTEENA_ACLR_B NUMERIC "0"
-- Retrieval info: PRIVATE: BYTE_ENABLE_A NUMERIC "0"
-- Retrieval info: PRIVATE: BYTE_ENABLE_B NUMERIC "0"
-- Retrieval info: PRIVATE: BYTE_SIZE NUMERIC "8"
-- Retrieval info: PRIVATE: BlankMemory NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_A NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_INPUT_B NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_A NUMERIC "0"
-- Retrieval info: PRIVATE: CLOCK_ENABLE_OUTPUT_B NUMERIC "0"
-- Retrieval info: PRIVATE: CLRdata NUMERIC "0"
-- Retrieval info: PRIVATE: CLRq NUMERIC "0"
-- Retrieval info: PRIVATE: CLRrdaddress NUMERIC "0"
-- Retrieval info: PRIVATE: CLRrren NUMERIC "0"
-- Retrieval info: PRIVATE: CLRwraddress NUMERIC "0"
-- Retrieval info: PRIVATE: CLRwren NUMERIC "0"
-- Retrieval info: PRIVATE: Clock NUMERIC "0"
-- Retrieval info: PRIVATE: Clock_A NUMERIC "0"
-- Retrieval info: PRIVATE: Clock_B NUMERIC "0"
-- Retrieval info: PRIVATE: IMPLEMENT_IN_LES NUMERIC "0"
-- Retrieval info: PRIVATE: INDATA_ACLR_B NUMERIC "0"
-- Retrieval info: PRIVATE: INDATA_REG_B NUMERIC "0"
-- Retrieval info: PRIVATE: INIT_FILE_LAYOUT STRING "PORT_B"
-- Retrieval info: PRIVATE: INIT_TO_SIM_X NUMERIC "0"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: PRIVATE: JTAG_ENABLED NUMERIC "0"
-- Retrieval info: PRIVATE: JTAG_ID STRING "NONE"
-- Retrieval info: PRIVATE: MAXIMUM_DEPTH NUMERIC "0"
-- Retrieval info: PRIVATE: MEMSIZE NUMERIC "128"
-- Retrieval info: PRIVATE: MEM_IN_BITS NUMERIC "0"
-- Retrieval info: PRIVATE: MIFfilename STRING "ram32x4_3_port.mif"
-- Retrieval info: PRIVATE: OPERATION_MODE NUMERIC "2"
-- Retrieval info: PRIVATE: OUTDATA_ACLR_B NUMERIC "0"
-- Retrieval info: PRIVATE: OUTDATA_REG_B NUMERIC "0"
-- Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "2"
-- Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_MIXED_PORTS NUMERIC "2"
-- Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_A NUMERIC "3"
-- Retrieval info: PRIVATE: READ_DURING_WRITE_MODE_PORT_B NUMERIC "3"
-- Retrieval info: PRIVATE: REGdata NUMERIC "1"
-- Retrieval info: PRIVATE: REGq NUMERIC "1"
-- Retrieval info: PRIVATE: REGrdaddress NUMERIC "1"
-- Retrieval info: PRIVATE: REGrren NUMERIC "1"
-- Retrieval info: PRIVATE: REGwraddress NUMERIC "1"
-- Retrieval info: PRIVATE: REGwren NUMERIC "1"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: USE_DIFF_CLKEN NUMERIC "0"
-- Retrieval info: PRIVATE: UseDPRAM NUMERIC "1"
-- Retrieval info: PRIVATE: VarWidth NUMERIC "0"
-- Retrieval info: PRIVATE: WIDTH_READ_A NUMERIC "4"
-- Retrieval info: PRIVATE: WIDTH_READ_B NUMERIC "4"
-- Retrieval info: PRIVATE: WIDTH_WRITE_A NUMERIC "4"
-- Retrieval info: PRIVATE: WIDTH_WRITE_B NUMERIC "4"
-- Retrieval info: PRIVATE: WRADDR_ACLR_B NUMERIC "0"
-- Retrieval info: PRIVATE: WRADDR_REG_B NUMERIC "0"
-- Retrieval info: PRIVATE: WRCTRL_ACLR_B NUMERIC "0"
-- Retrieval info: PRIVATE: enable NUMERIC "0"
-- Retrieval info: PRIVATE: rden NUMERIC "1"
-- Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
-- Retrieval info: CONSTANT: ADDRESS_ACLR_B STRING "NONE"
-- Retrieval info: CONSTANT: ADDRESS_REG_B STRING "CLOCK0"
-- Retrieval info: CONSTANT: CLOCK_ENABLE_INPUT_A STRING "BYPASS"
-- Retrieval info: CONSTANT: CLOCK_ENABLE_INPUT_B STRING "BYPASS"
-- Retrieval info: CONSTANT: CLOCK_ENABLE_OUTPUT_B STRING "BYPASS"
-- Retrieval info: CONSTANT: INIT_FILE STRING "ram32x4_3_port.mif"
-- Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone V"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "altsyncram"
-- Retrieval info: CONSTANT: NUMWORDS_A NUMERIC "32"
-- Retrieval info: CONSTANT: NUMWORDS_B NUMERIC "32"
-- Retrieval info: CONSTANT: OPERATION_MODE STRING "DUAL_PORT"
-- Retrieval info: CONSTANT: OUTDATA_ACLR_B STRING "NONE"
-- Retrieval info: CONSTANT: OUTDATA_REG_B STRING "UNREGISTERED"
-- Retrieval info: CONSTANT: POWER_UP_UNINITIALIZED STRING "FALSE"
-- Retrieval info: CONSTANT: RAM_BLOCK_TYPE STRING "M10K"
-- Retrieval info: CONSTANT: RDCONTROL_REG_B STRING "CLOCK0"
-- Retrieval info: CONSTANT: READ_DURING_WRITE_MODE_MIXED_PORTS STRING "DONT_CARE"
-- Retrieval info: CONSTANT: WIDTHAD_A NUMERIC "5"
-- Retrieval info: CONSTANT: WIDTHAD_B NUMERIC "5"
-- Retrieval info: CONSTANT: WIDTH_A NUMERIC "4"
-- Retrieval info: CONSTANT: WIDTH_B NUMERIC "4"
-- Retrieval info: CONSTANT: WIDTH_BYTEENA_A NUMERIC "1"
-- Retrieval info: USED_PORT: clock 0 0 0 0 INPUT VCC "clock"
-- Retrieval info: USED_PORT: data 0 0 4 0 INPUT NODEFVAL "data[3..0]"
-- Retrieval info: USED_PORT: q 0 0 4 0 OUTPUT NODEFVAL "q[3..0]"
-- Retrieval info: USED_PORT: rdaddress 0 0 5 0 INPUT NODEFVAL "rdaddress[4..0]"
-- Retrieval info: USED_PORT: rden 0 0 0 0 INPUT VCC "rden"
-- Retrieval info: USED_PORT: wraddress 0 0 5 0 INPUT NODEFVAL "wraddress[4..0]"
-- Retrieval info: USED_PORT: wren 0 0 0 0 INPUT GND "wren"
-- Retrieval info: CONNECT: @address_a 0 0 5 0 wraddress 0 0 5 0
-- Retrieval info: CONNECT: @address_b 0 0 5 0 rdaddress 0 0 5 0
-- Retrieval info: CONNECT: @clock0 0 0 0 0 clock 0 0 0 0
-- Retrieval info: CONNECT: @data_a 0 0 4 0 data 0 0 4 0
-- Retrieval info: CONNECT: @rden_b 0 0 0 0 rden 0 0 0 0
-- Retrieval info: CONNECT: @wren_a 0 0 0 0 wren 0 0 0 0
-- Retrieval info: CONNECT: q 0 0 4 0 @q_b 0 0 4 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL ram32x4_port_3.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ram32x4_port_3.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ram32x4_port_3.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ram32x4_port_3.bsf FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL ram32x4_port_3_inst.vhd FALSE
-- Retrieval info: LIB_FILE: altera_mf
