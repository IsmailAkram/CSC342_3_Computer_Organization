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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"
-- CREATED		"Wed Sep 01 11:36:22 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Akram_MUX21 IS 
	PORT
	(
		IN_A :  IN  STD_LOGIC;
		IN_B :  IN  STD_LOGIC;
		IN_S :  IN  STD_LOGIC;
		OUT_Z :  OUT  STD_LOGIC
	);
END Akram_MUX21;

ARCHITECTURE bdf_type OF Akram_MUX21 IS 

COMPONENT akram-tutorial_mux21_august_30_2021
	PORT(AKRA_A : IN STD_LOGIC;
		 AKRA_B : IN STD_LOGIC;
		 AKRA_S : IN STD_LOGIC;
		 AKRA_Z : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_AKRA_21MUX : akram-tutorial_mux21_august_30_2021
PORT MAP(AKRA_A => IN_A,
		 AKRA_B => IN_B,
		 AKRA_S => IN_S,
		 AKRA_Z => OUT_Z);


END bdf_type;