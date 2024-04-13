#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=D:/Vivado/2022.1/ids_lite/ISE/bin/nt64;D:/Vivado/2022.1/ids_lite/ISE/lib/nt64:D:/Vivado/2022.1/bin
else
  PATH=D:/Vivado/2022.1/ids_lite/ISE/bin/nt64;D:/Vivado/2022.1/ids_lite/ISE/lib/nt64:D:/Vivado/2022.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='d:/materiale pentru facultate/anul 4/semestrul 1/p3/fpu/fpu.tmp/fpu_ip_slave_v1_0_project/FPU_IP_Slave_v1_0_project.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log FPU_IP_Slave_v1_0.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source FPU_IP_Slave_v1_0.tcl -notrace


