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
-- CREATED		"Sun Oct 03 19:53:41 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Akram_10_3_2021_DFF_VHDL IS 
	PORT
	(
		PRN :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC;
		EDGE :  IN  STD_LOGIC;
		CLRN :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC
	);
END Akram_10_3_2021_DFF_VHDL;

ARCHITECTURE bdf_type OF Akram_10_3_2021_DFF_VHDL IS 



BEGIN 



PROCESS(EDGE,CLRN,PRN)
BEGIN
IF (CLRN = '0') THEN
	Q <= '0';
ELSIF (PRN = '0') THEN
	Q <= '1';
ELSIF (RISING_EDGE(EDGE)) THEN
	Q <= D;
END IF;
END PROCESS;


END bdf_type;