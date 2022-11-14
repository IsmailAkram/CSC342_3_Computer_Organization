LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY Akram_10_15_2021_Lab_6_Register_File IS
	PORT
	(
		-- Akram_Op					: IN STD_LOGIC; -- Operator
		Akram_clock				: IN STD_LOGIC  := '1';
		-- Akram_data				: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- data-write
		
		-- Akram_wraddress		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		-- Akram_rdaddress_a		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);	
		-- Akram_rdaddress_b		: IN STD_LOGIC_VECTOR (4 DOWNTO 0); 
		
		Akram_wren				: IN STD_LOGIC  := '0';						
		Akram_rden				: IN STD_LOGIC  := '1';
		q_a						: OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- data1
		q_b						: OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- data2
		Akram_Sum_rd			: OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- rd
		
		Akram_IR					: IN STD_LOGIC_VECTOR (31 DOWNTO 0) -- Instruction Register
	);
END Akram_10_15_2021_Lab_6_Register_File;


ARCHITECTURE SYN OF Akram_10_15_2021_Lab_6_Register_File IS

	SIGNAL sub_wire0			: STD_LOGIC_VECTOR (31 DOWNTO 0); -- q_a
	SIGNAL sub_wire1			: STD_LOGIC_VECTOR (31 DOWNTO 0); -- q_b
	SIGNAL Signal_Sum			: STD_LOGIC_VECTOR (31 DOWNTO 0); -- output from ADDER, data-write for a 3rd raddress rd
	SIGNAL Signal_Cf, Signal_Ovf, Signal_Negf, Signal_ZeroF 	: STD_LOGIC; -- flags
	
	SIGNAL Akram_IR_OP 				: STD_LOGIC; -- IR Operator, Instruction Register Opcode Bits [26:31] = 	000000 encode addition operation, 000001 encode subtraction operation
	SIGNAL Akram_IR_wraddress		: STD_LOGIC_VECTOR (4 DOWNTO 0); -- 1 write, Instruction	Register	Bits	[21:25]	=	destination	register	index	ranging	from	{00000}	to	{11111}
	SIGNAL Akram_IR_rdaddress_a	: STD_LOGIC_VECTOR (4 DOWNTO 0); -- read1, Instruction	Register	Bits	[16:20]	=	source	register	index	ranging	from	{00000}	to	{11111}
	SIGNAL Akram_IR_rdaddress_b	: STD_LOGIC_VECTOR (4 DOWNTO 0); -- read2, Instruction	Register	Bits	[11:15]	=	source	register	index	ranging	from	{00000}	to	{11111}
	
	COMPONENT Akram_9_19_2021_N_Bit_Add_Sub_Flags is -- add/sub unit
		GENERIC (n : integer := 32);
		port (A, B 						: in std_logic_vector (n-1 downto 0);
			Op 						: in std_logic; -- Operator
			Sum 						: inout std_logic_vector (n-1 downto 0);
			Cf, Ovf, Negf, ZeroF : inout std_logic); -- carry flag, overflow, Negative, Zero
	END COMPONENT;
	
	COMPONENT Akram_Register_N_VHDL is
		generic (N : integer := 32);
		port (
			AKRA_clk : in std_logic; -- clock --
			AKRA_wren : in std_logic; -- write enable --
			AKRA_rden : in std_logic; -- read enable --
			AKRA_chen : in std_logic; -- chip enable --
			AKRA_data : in std_logic_vector (N-1 downto 0); -- data input --
			AKRA_q : out std_logic_vector (N-1 downto 0)); -- output --
	END COMPONENT;
	
BEGIN
	q_a    <= sub_wire0(31 DOWNTO 0); -- data1
	q_b    <= sub_wire1(31 DOWNTO 0); -- data2
	Akram_Sum_rd    <= Signal_Sum(31 DOWNTO 0);
	
	Akram_IR_Op <= AKRAM_IR(26); -- 0: addition or 1: subtraction
	Akram_IR_wraddress <=Akram_IR(25 DOWNTO 21);
	Akram_IR_rdaddress_a <= Akram_IR(20 DOWNTO 16);
	Akram_IR_rdaddress_b <= Akram_IR(15 DOWNTO 11);
	
	altsyncram_component : altsyncram
	GENERIC MAP (
		address_aclr_b => "NONE",
		address_reg_b => "CLOCK0",
		clock_enable_input_a => "BYPASS",
		clock_enable_input_b => "BYPASS",
		clock_enable_output_b => "BYPASS",
		init_file => "Akram_10_15_2021_Lab_6_Register_File.mif", -- MIF
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
		width_a => 32,
		width_b => 32,
		width_byteena_a => 1
	)
	PORT MAP (
		address_a => Akram_IR_wraddress,
		address_b => Akram_IR_rdaddress_a,
		clock0 => Akram_clock,
		data_a => Signal_Sum, -- sum from ADDER, signal
		wren_a => Akram_wren,
		rden_a => Akram_rden,
		q_b => sub_wire0 -- signal
	);

addsub: Akram_9_19_2021_N_Bit_Add_Sub_Flags port map (
	A => sub_wire0, -- data1, q_a
	B => sub_wire1, -- data2, q_b
	Op => Akram_IR_Op, 
	Sum => Signal_Sum,
	Cf => Signal_Cf, 
	Ovf => Signal_Ovf, 
	Negf => Signal_Negf, 
	ZeroF	=> Signal_ZeroF
);	
	
altsyncram_component_Two : altsyncram
	GENERIC MAP (
		address_aclr_b => "NONE",
		address_reg_b => "CLOCK0",
		clock_enable_input_a => "BYPASS",
		clock_enable_input_b => "BYPASS",
		clock_enable_output_b => "BYPASS",
		init_file => "Akram_10_15_2021_Lab_6_Register_File.mif", -- MIF
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
		width_a => 32,
		width_b => 32,
		width_byteena_a => 1
	)
	PORT MAP (
		address_a => Akram_IR_wraddress,
		address_b => Akram_IR_rdaddress_b,
		clock0 => Akram_clock,
		data_a => Signal_Sum, -- sum from ADDER, signal
		wren_a => Akram_wren,
		rden_a => Akram_rden,
		q_b => sub_wire1 -- signal
	);
	

END SYN;