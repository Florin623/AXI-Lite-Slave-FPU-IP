set_property PACKAGE_PIN F14 [get_ports sys_clock]
create_clock -period 83.333 -name sys_clock [get_ports sys_clock]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clock]


set_property PACKAGE_PIN H14 [get_ports reset_0]
set_property IOSTANDARD LVCMOS33 [get_ports reset_0]


set_property PACKAGE_PIN V12 [get_ports usb_uart_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports usb_uart_rxd]


set_property PACKAGE_PIN R12 [get_ports usb_uart_txd]
set_property IOSTANDARD LVCMOS33 [get_ports usb_uart_txd]

