READme for take-home test 1 by Ismail Akram CSC343
==========================================================================
To run .asm files on MARS using MIPS in VM:
Open your Ubuntu VM. 

Save the created .asm files (from Visual Studio Code as your main text editor) into a folder (perferably in the Desktop)

Run the Terminal and navigate (using cd command) to the location of your MARS (preferably installed on your Desktop as well).

input the following command in the terminal to open up MIPS simulator on MARS:
java -jar Mars4_5.jar

Then open the .asm files and hit F3 to run the code, navigate the code line by line by using the step next function.

And you will notice the changes in registers and data segments while running each code.

==========================================================================
To run .c files on VS Studio (2019) 32-bit Compiler Intel x86 ISA on Windows:

Open Visual Studios (2019) on Windows
Open .c code in Visual Studios from wherever you saved them (preferably on Desktop)

Insert a breakpoint on your main line and on the last line of the code for each instruction.
Run the debugger (located at the top of the menu as a big green play button)

Then go to:
Debug > Windows > Memory > Memory 1
Debug > Windows > Memory > Memory 2
Debug > Windows > Disassembly
Debug > Windows > Registers

to open up all the required windows for this assignment

Run through each line of code by hitting the F11 key for "Step Into" command

And you will notice the changes in registers, memory windows and disassembly for each line.
==========================================================================

To run .c files on GCC and GDB 64-bit Compiler Intel x86 ISA on Linux:

Using the same .c files as above, go to the terminal and input:
gcc -g -w filename -- to create and a.out file for your code
gdb a.out -- to create a a.out file for your code
list -- to display your code in the terminal
break main -- to insert a breakpoint
run -- to run code

disassemble

The input the following commands to navigate your dissassembly:
print /x $rsp -- to show stack pointer
print /x $rbp -- to show base pointer
print /x $edx -- to show EDX register
print /x $eax -- to show EAX register

print x/8xb <insert your address> -- to see the value stored in this address

And you will notice the changes in registers and disassembly for each line.