#include "stdio.h"
#include "xuartlite.h"
#include "FPU_IP_Slave.h"
#include "platform.h"
#include "xparameters.h"
#include "xil_io.h"


#define uart_id XPAR_UARTLITE_0_DEVICE_ID


int main() {
	XUartLite uart;
    XUartLite_Initialize(&uart, uart_id);
    print("Let's go!\n\r");


    int A, B, Q;

    A = 1092825907;  // 32'b0_10000010_01000110011001100110011    10.20
    B = 1073909596;  // 32'b0_10000000_00000101000111101011100    2.04

    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 4, A);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 8, B);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 12, 0);   // opcode = add
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 0, 1);	   // start = 1

    for (int i = 0; i < 2500; ++i);

    Q = FPU_IP_SLAVE_mReadReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 16);       // output

    printf("Q = %d", Q);

    A = 1089566933;  // 32'b0_10000001_11100010111100011010101      7.546
    B = 3234311700;  // 32'b1_10000001_10001111010111000010100      -6.24

    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 4, A);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 8, B);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 12, 1);   // opcode = sub
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 0, 1);	   // start = 1

    for (int i = 0; i < 2500; ++i);

    Q = FPU_IP_SLAVE_mReadReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 16);       // output

    printf("Q = %d", Q);

    A = 3226013270;  // 32'b1_10000000_10010010000111001010110		-3.1415
    B = 1120401752;  // 32'b0_10000101_10001111111100101011000		99.987

    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 4, A);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 8, B);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 12, 2);   // opcode = mul
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 0, 1);	   // start = 1

    for (int i = 0; i < 2500; ++i);

    Q = FPU_IP_SLAVE_mReadReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 16);       // output

    printf("Q = %d", Q);

    A = 1123946496;  // 32'b0_10000101_11111100001000000000000		127.03125
    B = 1099399168;  // 32'b0_10000011_00001111000000000000000		16.9375

    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 4, A);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 8, B);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 12, 3);   // opcode = div
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 0, 1);	   // start = 1

    for (int i = 0; i < 2500; ++i);

    Q = FPU_IP_SLAVE_mReadReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 16);       // output

    printf("Q = %d", Q);

    A = 2139095055;  // 32'b0_11111111_00000000000000000001111		NaN
    B = 2139095040;  // 32'b0_11111111_00000000000000000000000		inf

    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 4, A);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 8, B);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 12, 3);   // opcode = div
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 0, 1);	   // start = 1

    for (int i = 0; i < 2500; ++i);

    Q = FPU_IP_SLAVE_mReadReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 16);       // output

    printf("Q = %d", Q);

    A = 2139095040;  // 32'b0_11111111_00000000000000000000000		+inf
    B = 1064833122;  // 32'b0_01111110_11110000001000001100010      0.969

    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 4, A);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 8, B);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 12, 2);   // opcode = mul
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 0, 1);	   // start = 1

    for (int i = 0; i < 2500; ++i);

    Q = FPU_IP_SLAVE_mReadReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 16);       // output

    printf("Q = %d", Q);

    A = 4286578688;  // 32'b1_11111111_00000000000000000000000      -inf
    B = 2139095040;  // 32'b0_11111111_00000000000000000000000      +inf

    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 4, A);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 8, B);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 12, 1);   // opcode = sub
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 0, 1);	   // start = 1

    for (int i = 0; i < 2500; ++i);

    Q = FPU_IP_SLAVE_mReadReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 16);       // output

    printf("Q = %d", Q);

    A = 3247364899;  // 32'b1_10000011_00011101101101100100011      -17.857
    B = 3276240781;  // 32'b1_10000110_10001110111011110001101      -199.467

    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 4, A);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 8, B);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 12, 0);   // opcode = add
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 0, 1);	   // start = 1

    for (int i = 0; i < 2500; ++i);

    Q = FPU_IP_SLAVE_mReadReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 16);       // output

    printf("Q = %d", Q);

    A = 1116430664;  // 32'b0_10000101_00010110110000101001000      69.69
    B = 3292688826;  // 32'b1_10001000_10000100111000110111010      -777.777

    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 4, A);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 8, B);
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 12, 1);   // opcode = sub
    FPU_IP_SLAVE_mWriteReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 0, 1);	   // start = 1

    for (int i = 0; i < 2500; ++i);

    Q = FPU_IP_SLAVE_mReadReg(XPAR_FPU_IP_SLAVE_0_S00_AXI_BASEADDR, 16);       // output

    printf("Q = %d", Q);

    return 0;
}
