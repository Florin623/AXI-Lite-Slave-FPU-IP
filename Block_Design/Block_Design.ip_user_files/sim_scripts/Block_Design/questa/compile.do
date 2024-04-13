vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/blk_mem_gen_v8_4_6

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap blk_mem_gen_v8_4_6 questa_lib/msim/blk_mem_gen_v8_4_6

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/30ef" "+incdir+../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/ec67/hdl" \
"D:/Vivado/2023.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/Vivado/2023.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"D:/Vivado/2023.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/30ef" "+incdir+../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/ec67/hdl" \
"d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_dlmb_v10_0/Block_Design_dlmb_v10_0_sim_netlist.v" \
"d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_ilmb_v10_0/Block_Design_ilmb_v10_0_sim_netlist.v" \
"d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_dlmb_bram_if_cntlr_0/Block_Design_dlmb_bram_if_cntlr_0_sim_netlist.v" \
"d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_ilmb_bram_if_cntlr_0/Block_Design_ilmb_bram_if_cntlr_0_sim_netlist.v" \

vlog -work blk_mem_gen_v8_4_6  -incr -mfcu  "+incdir+../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/30ef" "+incdir+../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/ec67/hdl" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/bb55/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/30ef" "+incdir+../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/ec67/hdl" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_lmb_bram_0/sim/Block_Design_lmb_bram_0.v" \
"d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_mdm_1_0/Block_Design_mdm_1_0_sim_netlist.v" \
"d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_rst_clk_wiz_0_100M_0/Block_Design_rst_clk_wiz_0_100M_0_sim_netlist.v" \
"d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_axi_uartlite_0_0/Block_Design_axi_uartlite_0_0_sim_netlist.v" \
"d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_clk_wiz_0_0/Block_Design_clk_wiz_0_0_sim_netlist.v" \
"d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_microblaze_0_0/Block_Design_microblaze_0_0_sim_netlist.v" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/2dd0/src/Add Div Normaliser.v" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/2dd0/src/Adder.v" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/2dd0/src/Divider.v" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/2dd0/src/FPU.v" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/2dd0/hdl/FPU_IP_Slave_v1_0_S00_AXI.v" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/2dd0/src/Multiplier Normaliser.v" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/2dd0/src/Multiplier.v" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ipshared/2dd0/hdl/FPU_IP_Slave_v1_0.v" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_FPU_IP_Slave_0_0/sim/Block_Design_FPU_IP_Slave_0_0.v" \
"d:/Materiale_pentru_facultate/Licenta/Anul_4/Semestrul_1/P3/Block_Design/Block_Design.gen/sources_1/bd/Block_Design/ip/Block_Design_xbar_0/Block_Design_xbar_0_sim_netlist.v" \
"../../../../Block_Design.gen/sources_1/bd/Block_Design/sim/Block_Design.v" \

vlog -work xil_defaultlib \
"glbl.v"

