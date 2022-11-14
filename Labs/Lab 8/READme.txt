Instructions on how to run final lab: Simplified CPU

Open Qar file: Akram_12_20_2021_Simplified_CPU.qar in Quartus

Assign Akram_12_20_2021_Simplified_CPU.vhdl as Top-Level_Entity (by right clicking the vhdl).

Ensure that the project compiles correctly (it does).

Then open ModelSim
>Add the vhdl files in ModelSim and run the simulation.

Set Akram_CLK = 250ps falling and Akram_reset = 0

Run Simulation

Then change Akram_reset = 1 and keep running the simulation until we get Akram_ALU_Result = 15 (which is 1+2+3+4+5)

Running MIPS
Open up VM and open the command line
> navigate to where MARS is stored (in my case, it's the Desktop)
> run "java -jar Mars4_5.jar" to open MARS

open Akram_12_20_2021_Simplified_CPU.asm on MIPS and run the assemble
verify that register $t3 = F (15)

And we done!

Thank you.