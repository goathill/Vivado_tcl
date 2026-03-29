# run_simulation.tcl
# 编译仿真并运行，随后保存波形
# Compile and run simulation, then save waveforms
#
# 用法 / Usage:
#   在 Tcl Console 中（需先调用 setup_simulation.tcl 或手动配置 sim_1）:
#   source run_simulation.tcl

# ---- 用户配置 / User Configuration ----
set sim_time "1000ns"   ;# 仿真运行时间 / Simulation run time
# ----------------------------------------

puts "启动仿真 / Launching simulation..."
launch_simulation

# 运行仿真 / Run simulation
run $sim_time

puts "仿真已运行 $sim_time / Simulation ran for $sim_time"

# 保存波形数据库 / Save waveform database
if {[catch {save_wave_db} err]} {
    puts "注意: 波形保存失败 ($err) / Note: Could not save waveform ($err)"
} else {
    puts "波形已保存 / Waveform saved."
}

puts "仿真完成 / Simulation complete."
