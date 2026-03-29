# setup_simulation.tcl
# 配置仿真设置，包括顶层模块、仿真时间和波形记录
# Configure simulation settings including top-level module, run time, and waveform logging
#
# 用法 / Usage:
#   在 Tcl Console 中: source setup_simulation.tcl

# ---- 用户配置 / User Configuration ----
set sim_top     "tb_top"       ;# 仿真顶层模块名 / Simulation top-level module name
set sim_time    "1000ns"       ;# 仿真运行时间 / Simulation run time
set wave_db     "./wave.wcfg"  ;# 波形配置文件路径 / Waveform config file path
# ----------------------------------------

# 设置仿真顶层 / Set simulation top
set_property top $sim_top [get_filesets sim_1]
set_property top_lib {} [get_filesets sim_1]
update_compile_order -fileset sim_1

# 设置仿真运行时间 / Set simulation runtime
set_property -name {xsim.simulate.runtime} -value $sim_time -objects [get_filesets sim_1]

# 启用波形记录（仅 Vivado XSim）/ Enable waveform logging (Vivado XSim only)
set_property -name {xsim.simulate.log_all_signals} -value true -objects [get_filesets sim_1]

puts "仿真已配置: 顶层='$sim_top', 运行时间='$sim_time'"
puts "Simulation configured: top='$sim_top', runtime='$sim_time'"
