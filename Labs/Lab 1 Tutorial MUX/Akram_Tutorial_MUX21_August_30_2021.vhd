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
-- CREATED		"Wed Sep 01 18:04:17 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Akram_Tutorial_MUX21_August_30_2021 IS 
	PORT
	(
		AKRA_A :  IN  STD_LOGIC;
		AKRA_B :  IN  STD_LOGIC;
		AKRA_S :  IN  STD_LOGIC;
		AKRA_Z :  OUT  STD_LOGIC
	);
END Akram_Tutorial_MUX21_August_30_2021;

ARCHITECTURE bdf_type OF Akram_Tutorial_MUX21_August_30_2021 IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_0 <= NOT(AKRA_S);



SYNTHESIZED_WIRE_2 <= AKRA_A AND SYNTHESIZED_WIRE_0;


SYNTHESIZED_WIRE_1 <= AKRA_B AND AKRA_S;


AKRA_Z <= SYNTHESIZED_WIRE_1 OR SYNTHESIZED_WIRE_2;


END bdf_type;