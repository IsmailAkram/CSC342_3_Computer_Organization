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
-- CREATED		"Wed Sep 29 15:02:42 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Akram_D_FlipFlop_Master_Slave_VHDL IS 
	PORT
	(
		AKRA_PRN :  IN  STD_LOGIC;
		AKRA_D :  IN  STD_LOGIC;
		AKRA_CLK :  IN  STD_LOGIC;
		AKRA_CLRN :  IN  STD_LOGIC;
		AKRA_Q :  OUT  STD_LOGIC
	);
END Akram_D_FlipFlop_Master_Slave_VHDL;

ARCHITECTURE bdf_type OF Akram_D_FlipFlop_Master_Slave_VHDL IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_0 <= NOT(AKRA_CLK);



PROCESS(AKRA_CLRN,AKRA_PRN,SYNTHESIZED_WIRE_0,AKRA_D)
BEGIN
IF (AKRA_CLRN = '0') THEN
	SYNTHESIZED_WIRE_1 <= '0';
ELSIF (AKRA_PRN = '0') THEN
	SYNTHESIZED_WIRE_1 <= '1';
ELSIF (SYNTHESIZED_WIRE_0 = '1') THEN
	SYNTHESIZED_WIRE_1 <= AKRA_D;
END IF;
END PROCESS;


PROCESS(AKRA_CLRN,AKRA_PRN,AKRA_CLK,SYNTHESIZED_WIRE_1)
BEGIN
IF (AKRA_CLRN = '0') THEN
	AKRA_Q <= '0';
ELSIF (AKRA_PRN = '0') THEN
	AKRA_Q <= '1';
ELSIF (AKRA_CLK = '1') THEN
	AKRA_Q <= SYNTHESIZED_WIRE_1;
END IF;
END PROCESS;


END bdf_type;