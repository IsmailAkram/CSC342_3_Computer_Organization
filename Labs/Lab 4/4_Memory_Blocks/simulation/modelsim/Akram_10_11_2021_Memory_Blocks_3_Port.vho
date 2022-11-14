-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"

-- DATE "10/13/2021 12:10:50"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ram32x4_port_3 IS
    PORT (
	clock : IN std_logic;
	data : IN std_logic_vector(3 DOWNTO 0);
	rdaddress_a : IN std_logic_vector(4 DOWNTO 0);
	rdaddress_b : IN std_logic_vector(4 DOWNTO 0);
	rden : IN std_logic;
	wraddress : IN std_logic_vector(4 DOWNTO 0);
	wren : IN std_logic;
	q_a : OUT std_logic_vector(3 DOWNTO 0);
	q_b : OUT std_logic_vector(3 DOWNTO 0)
	);
END ram32x4_port_3;

-- Design Ports Information
-- rden	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_a[0]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_a[1]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_a[2]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_a[3]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_b[0]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_b[1]	=>  Location: PIN_AK23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_b[2]	=>  Location: PIN_AK28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q_b[3]	=>  Location: PIN_AK24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wren	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[0]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[1]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[2]	=>  Location: PIN_AJ25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[3]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[4]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress_a[0]	=>  Location: PIN_AK27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress_a[1]	=>  Location: PIN_AJ26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress_a[2]	=>  Location: PIN_AJ27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress_a[3]	=>  Location: PIN_AC20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress_a[4]	=>  Location: PIN_AK26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_AJ24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_Y18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress_b[0]	=>  Location: PIN_AK29,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress_b[1]	=>  Location: PIN_AD20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress_b[2]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress_b[3]	=>  Location: PIN_AJ22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress_b[4]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ram32x4_port_3 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_data : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_rdaddress_a : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_rdaddress_b : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_rden : std_logic;
SIGNAL ww_wraddress : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_wren : std_logic;
SIGNAL ww_q_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_q_b : std_logic_vector(3 DOWNTO 0);
SIGNAL \altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \altsyncram_component_Two|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \altsyncram_component_Two|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \altsyncram_component_Two|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \altsyncram_component_Two|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \rden~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \wren~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \data[0]~input_o\ : std_logic;
SIGNAL \wraddress[0]~input_o\ : std_logic;
SIGNAL \wraddress[1]~input_o\ : std_logic;
SIGNAL \wraddress[2]~input_o\ : std_logic;
SIGNAL \wraddress[3]~input_o\ : std_logic;
SIGNAL \wraddress[4]~input_o\ : std_logic;
SIGNAL \rdaddress_a[0]~input_o\ : std_logic;
SIGNAL \rdaddress_a[1]~input_o\ : std_logic;
SIGNAL \rdaddress_a[2]~input_o\ : std_logic;
SIGNAL \rdaddress_a[3]~input_o\ : std_logic;
SIGNAL \rdaddress_a[4]~input_o\ : std_logic;
SIGNAL \data[1]~input_o\ : std_logic;
SIGNAL \data[2]~input_o\ : std_logic;
SIGNAL \data[3]~input_o\ : std_logic;
SIGNAL \rdaddress_b[0]~input_o\ : std_logic;
SIGNAL \rdaddress_b[1]~input_o\ : std_logic;
SIGNAL \rdaddress_b[2]~input_o\ : std_logic;
SIGNAL \rdaddress_b[3]~input_o\ : std_logic;
SIGNAL \rdaddress_b[4]~input_o\ : std_logic;
SIGNAL \altsyncram_component|auto_generated|q_b\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \altsyncram_component_Two|auto_generated|q_b\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_clock <= clock;
ww_data <= data;
ww_rdaddress_a <= rdaddress_a;
ww_rdaddress_b <= rdaddress_b;
ww_rden <= rden;
ww_wraddress <= wraddress;
ww_wren <= wren;
q_a <= ww_q_a;
q_b <= ww_q_b;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd
& gnd & gnd & gnd & gnd & gnd & \data[3]~input_o\ & \data[2]~input_o\ & \data[1]~input_o\ & \data[0]~input_o\);

\altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\wraddress[4]~input_o\ & \wraddress[3]~input_o\ & \wraddress[2]~input_o\ & \wraddress[1]~input_o\ & \wraddress[0]~input_o\);

\altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\rdaddress_a[4]~input_o\ & \rdaddress_a[3]~input_o\ & \rdaddress_a[2]~input_o\ & \rdaddress_a[1]~input_o\ & \rdaddress_a[0]~input_o\);

\altsyncram_component|auto_generated|q_b\(0) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\altsyncram_component|auto_generated|q_b\(1) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\altsyncram_component|auto_generated|q_b\(2) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\altsyncram_component|auto_generated|q_b\(3) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);

\altsyncram_component_Two|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & 
gnd & gnd & gnd & gnd & gnd & gnd & \data[3]~input_o\ & \data[2]~input_o\ & \data[1]~input_o\ & \data[0]~input_o\);

\altsyncram_component_Two|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\wraddress[4]~input_o\ & \wraddress[3]~input_o\ & \wraddress[2]~input_o\ & \wraddress[1]~input_o\ & \wraddress[0]~input_o\);

\altsyncram_component_Two|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\rdaddress_b[4]~input_o\ & \rdaddress_b[3]~input_o\ & \rdaddress_b[2]~input_o\ & \rdaddress_b[1]~input_o\ & \rdaddress_b[0]~input_o\);

\altsyncram_component_Two|auto_generated|q_b\(0) <= \altsyncram_component_Two|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\altsyncram_component_Two|auto_generated|q_b\(1) <= \altsyncram_component_Two|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\altsyncram_component_Two|auto_generated|q_b\(2) <= \altsyncram_component_Two|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\altsyncram_component_Two|auto_generated|q_b\(3) <= \altsyncram_component_Two|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);

-- Location: IOOBUF_X82_Y0_N59
\q_a[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(0),
	devoe => ww_devoe,
	o => ww_q_a(0));

-- Location: IOOBUF_X70_Y0_N2
\q_a[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(1),
	devoe => ww_devoe,
	o => ww_q_a(1));

-- Location: IOOBUF_X70_Y0_N19
\q_a[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(2),
	devoe => ww_devoe,
	o => ww_q_a(2));

-- Location: IOOBUF_X80_Y0_N2
\q_a[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(3),
	devoe => ww_devoe,
	o => ww_q_a(3));

-- Location: IOOBUF_X72_Y0_N19
\q_b[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component_Two|auto_generated|q_b\(0),
	devoe => ww_devoe,
	o => ww_q_b(0));

-- Location: IOOBUF_X72_Y0_N36
\q_b[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component_Two|auto_generated|q_b\(1),
	devoe => ww_devoe,
	o => ww_q_b(1));

-- Location: IOOBUF_X82_Y0_N76
\q_b[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component_Two|auto_generated|q_b\(2),
	devoe => ww_devoe,
	o => ww_q_b(2));

-- Location: IOOBUF_X72_Y0_N53
\q_b[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component_Two|auto_generated|q_b\(3),
	devoe => ww_devoe,
	o => ww_q_b(3));

-- Location: IOIBUF_X78_Y0_N52
\wren~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wren,
	o => \wren~input_o\);

-- Location: IOIBUF_X89_Y23_N21
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G11
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: IOIBUF_X74_Y0_N41
\data[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(0),
	o => \data[0]~input_o\);

-- Location: IOIBUF_X70_Y0_N35
\wraddress[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(0),
	o => \wraddress[0]~input_o\);

-- Location: IOIBUF_X78_Y0_N18
\wraddress[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(1),
	o => \wraddress[1]~input_o\);

-- Location: IOIBUF_X74_Y0_N92
\wraddress[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(2),
	o => \wraddress[2]~input_o\);

-- Location: IOIBUF_X80_Y0_N18
\wraddress[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(3),
	o => \wraddress[3]~input_o\);

-- Location: IOIBUF_X78_Y0_N35
\wraddress[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(4),
	o => \wraddress[4]~input_o\);

-- Location: IOIBUF_X80_Y0_N52
\rdaddress_a[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress_a(0),
	o => \rdaddress_a[0]~input_o\);

-- Location: IOIBUF_X76_Y0_N35
\rdaddress_a[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress_a(1),
	o => \rdaddress_a[1]~input_o\);

-- Location: IOIBUF_X80_Y0_N35
\rdaddress_a[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress_a(2),
	o => \rdaddress_a[2]~input_o\);

-- Location: IOIBUF_X76_Y0_N1
\rdaddress_a[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress_a(3),
	o => \rdaddress_a[3]~input_o\);

-- Location: IOIBUF_X76_Y0_N52
\rdaddress_a[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress_a(4),
	o => \rdaddress_a[4]~input_o\);

-- Location: IOIBUF_X74_Y0_N75
\data[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(1),
	o => \data[1]~input_o\);

-- Location: IOIBUF_X74_Y0_N58
\data[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(2),
	o => \data[2]~input_o\);

-- Location: IOIBUF_X72_Y0_N1
\data[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(3),
	o => \data[3]~input_o\);

-- Location: M10K_X76_Y1_N0
\altsyncram_component|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "altsyncram:altsyncram_component|altsyncram_u714:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 40,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 4,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 40,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 4,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \wren~input_o\,
	portbre => VCC,
	clk0 => \clock~inputCLKENA0_outclk\,
	clk1 => \clock~inputCLKENA0_outclk\,
	ena0 => \wren~input_o\,
	portadatain => \altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: IOIBUF_X82_Y0_N92
\rdaddress_b[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress_b(0),
	o => \rdaddress_b[0]~input_o\);

-- Location: IOIBUF_X82_Y0_N41
\rdaddress_b[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress_b(1),
	o => \rdaddress_b[1]~input_o\);

-- Location: IOIBUF_X78_Y0_N1
\rdaddress_b[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress_b(2),
	o => \rdaddress_b[2]~input_o\);

-- Location: IOIBUF_X70_Y0_N52
\rdaddress_b[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress_b(3),
	o => \rdaddress_b[3]~input_o\);

-- Location: IOIBUF_X76_Y0_N18
\rdaddress_b[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress_b(4),
	o => \rdaddress_b[4]~input_o\);

-- Location: M10K_X76_Y2_N0
\altsyncram_component_Two|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "altsyncram:altsyncram_component_Two|altsyncram_u714:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 40,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 32,
	port_a_logical_ram_width => 4,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 5,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 40,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 31,
	port_b_logical_ram_depth => 32,
	port_b_logical_ram_width => 4,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \wren~input_o\,
	portbre => VCC,
	clk0 => \clock~inputCLKENA0_outclk\,
	clk1 => \clock~inputCLKENA0_outclk\,
	ena0 => \wren~input_o\,
	portadatain => \altsyncram_component_Two|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \altsyncram_component_Two|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \altsyncram_component_Two|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \altsyncram_component_Two|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: IOIBUF_X12_Y81_N52
\rden~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rden,
	o => \rden~input_o\);

-- Location: LABCELL_X35_Y79_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


