Visual Studios:
Open Intel x86 (VS) > Dot_Product > Dot_Product > Dot_Product.sln

To disable optimization:
Project > Properties > C/C++ > Optimization > Optimization [Disabled (/Od)]
                             > Code Generation > Basic Runtime Checks [Default]
					       > Enable Parallel Code Generation [No (/Qpar-)]
					       > Enable Enhanced Instruction Set [Not Set]
_______________________________________________________________________________________________________________________________
To enable optimization:
Project > Properties > C/C++ > Optimization > Optimization [Maximum Optimization (Favor Speed) (/O2)]
                             > Code Generation > Basic Runtime Checks [Default]
					       > Enable Parallel Code Generation [Yes (/Qpar)]
					       > Enable Enhanced Instruction Set [Advanced Vector Extensions 2 (/arch:AVX2)]
_______________________________________________________________________________________________________________________________

Open Intel x86 (VS) > Dot_Product > Optimized_Dot_Product > Optimized_Dot_Product > Optimized_Dot_Product.sln
Open Intel x86 (VS) > Dot_Product > VDPPS_Dot_Product > VDPPS_Dot_Product > VDPPS_Dot_Product.sln
_______________________________________________________________________________________________________________________________

And run local Windows Debugger and note the execution time.

For Linux:
Open command line and navigate to:
Intel x64 (Linux) and run the following command in GCC:
`g++ -o0 Source.cpp Dot_Prod_Pntr.cpp -o run` for no optimization
`g++ -o1 Source.cpp Dot_Prod_Pntr.cpp -o runOP1` for LV1 optimization
`g++ -o2 Source.cpp Dot_Prod_Pntr.cpp -o runOP2` for LV2 optimization
`g++ -o3 Source.cpp Dot_Prod_Pntr.cpp -o runOP3` for LV3 optimization

And then use `./run`, `./runOP1`, `./runOP2`, `./runOp3` to run the program and note the execution time.
