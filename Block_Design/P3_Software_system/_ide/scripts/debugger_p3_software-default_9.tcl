# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\Materiale_pentru_facultate\Anul_4\Semestrul_1\P3\Block_Design\P3_Software_system\_ide\scripts\debugger_p3_software-default_9.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\Materiale_pentru_facultate\Anul_4\Semestrul_1\P3\Block_Design\P3_Software_system\_ide\scripts\debugger_p3_software-default_9.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Arty S7 - 50 210352A6C662A" && level==0 && jtag_device_ctx=="jsn-Arty S7 - 50-210352A6C662A-0362f093-0"}
fpga -file D:/Materiale_pentru_facultate/Anul_4/Semestrul_1/P3/Block_Design/P3_Software/_ide/bitstream/Block_Design_wrapper2.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw D:/Materiale_pentru_facultate/Anul_4/Semestrul_1/P3/Block_Design/Block_Design_wrapper/export/Block_Design_wrapper/hw/Block_Design_wrapper2.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow D:/Materiale_pentru_facultate/Anul_4/Semestrul_1/P3/Block_Design/P3_Software/Debug/P3_Software.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
