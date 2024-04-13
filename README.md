# AXI Lite Slave FPU IP
 FPU that does all the 4 fundamental arithmetic operations. IEEE 754 was used.
 It is made as an AXI-Lite Slave IP in AMD Vivado.
 In the Block Design there is a Microblaze processor as the Master, an AXI Interconnect as the Bridge and the AXI-Lite FPU IP and the AXI-Lite Uartlite IP as Slaves.
 The Microblaze processor is programmed in C using AMD Vitis in order to send data to the FPU and to read data from it.
 Both slaves have been successfully implemented on an Arty S7-50 FPGA board and the data is sent to the FPU using the Uartlite IP and a PC connected to the board.
