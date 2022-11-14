LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;

ENTITY Akram_10_13_2021_Lab_5_Integration IS
	PORT
	(
		Akram_Op					: IN STD_LOGIC; -- Operator
		Akram_clock				: IN STD_LOGIC  := '1';
		Akram_data				: IN STD_LOGIC_VECTOR (31 DOWNTO 0); -- data-write
		
		Akram_rdaddress_a		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);	-- read1
		Akram_rdaddress_b		: IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- read2
		Akram_wraddress		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);	-- 1 write
		Akram_wren				: IN STD_LOGIC  := '0';						
		q_a						: OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- data1
		q_b						: OUT STD_LOGIC_VECTOR (31 DOWNTO 0); -- data2
		Akram_Sum_rd				: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END Akram_10_13_2021_Lab_5_Integration;


ARCHITECTURE SYN OF Akram_10_13_2021_lab_5_integration IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (31 DOWNTO 0); -- q_a
	SIGNAL sub_wire1	: STD_LOGIC_VECTOR (31 DOWNTO 0); -- q_b
	SIGNAL Signal_Sum			: STD_LOGIC_VECTOR (31 DOWNTO 0); -- data_write for a 3rd raddress rd
	SIGNAL Signal_Cf, Signal_Ovf, Signal_Negf, Signal_ZeroF 	: STD_LOGIC;
	
	COMPONENT Akram_9_19_2021_N_Bit_Add_Sub_Flags is -- add/sub unit
		GENERIC (n : integer := 32);
		port (A, B 						: in std_logic_vector (n-1 downto 0);
			Op 						: in std_logic; -- Operator
			Sum 						: inout std_logic_vector (n-1 downto 0);
			Cf, Ovf, Negf, ZeroF : inout std_logic); -- carry flag, overflow, Negative, Zero
	END COMPONENT;	
	
BEGIN
	q_a    <= sub_wire0(31 DOWNTO 0); -- data1
	q_b    <= sub_wire1(31 DOWNTO 0); -- data2
	Akram_Sum_rd    <= Signal_Sum(31 DOWNTO 0);

	altsyncram_component : altsyncram
	GENERIC MAP (
		address_aclr_b => "NONE",
		address_reg_b => "CLOCK0",
		clock_enable_input_a => "BYPASS",
		clock_enable_input_b => "BYPASS",
		clock_enable_output_b => "BYPASS",
		init_file => "Akram_10_13_2021_Lab_5_Integration.mif", -- MIF
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
		address_a => Akram_wraddress,
		address_b => Akram_rdaddress_a,
		clock0 => Akram_clock,
		data_a => Akram_data,
		wren_a => Akram_wren,
		q_b => sub_wire0 -- signal
	);

addsub: Akram_9_19_2021_N_Bit_Add_Sub_Flags port map (
	A => sub_wire0, -- data1, q_a
	B => sub_wire1, -- data2, q_b
	Op => Akram_Op, 
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
		init_file => "Akram_10_13_2021_Lab_5_Integration.mif", -- MIF
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
		address_a => Akram_wraddress,
		address_b => Akram_rdaddress_b,
		clock0 => Akram_clock,
		data_a => Akram_data,
		wren_a => Akram_wren,
		q_b => sub_wire1 -- signal
	);
	

END SYN;