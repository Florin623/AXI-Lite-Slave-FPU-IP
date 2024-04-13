`timescale 1ns / 1ps


module Block_Design_TB();


reg reset_0;
reg sys_clock;
reg usb_uart_rxd;
wire usb_uart_txd;


initial begin
    sys_clock = 0;
    forever #5 sys_clock = ~sys_clock; // before it was 41.667
end


initial begin
    reset_0 <= 0;
    repeat(38400) @(posedge sys_clock);     // #3200000  3.2 ms

    reset_0 <= 1;
    repeat(4800)  @(posedge sys_clock);     // #400000   0.4 ms

    $stop();
end


Block_Design_wrapper DUT(
    .reset_0(reset_0),
    .sys_clock(sys_clock),
    .usb_uart_rxd(usb_uart_rxd),
    .usb_uart_txd(usb_uart_txd)
);


endmodule
