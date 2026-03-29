# run_synthesis.tcl
# 运行综合并检查是否存在严重错误
# Run synthesis and check for critical errors
#
# 用法 / Usage:
#   在 Tcl Console 中（需已打开工程）:
#   source run_synthesis.tcl

# ---- 用户配置 / User Configuration ----
set synth_strategy "Vivado Synthesis Defaults"
# ----------------------------------------

# 设置综合策略 / Set synthesis strategy
set_property strategy $synth_strategy [get_runs synth_1]

puts "开始综合 / Starting synthesis..."
launch_runs synth_1 -jobs 4
wait_on_run synth_1

# 检查综合状态 / Check synthesis status
set synth_status [get_property STATUS [get_runs synth_1]]
if {$synth_status ne "synth_design Complete!"} {
    error "综合失败，状态: $synth_status / Synthesis failed, status: $synth_status"
}

puts "综合完成 / Synthesis complete."
