# run_implementation.tcl
# 运行实现（布局布线）并检查时序收敛
# Run implementation (place and route) and check timing closure
#
# 用法 / Usage:
#   在 Tcl Console 中（需已打开工程，且综合已完成）:
#   source run_implementation.tcl

# ---- 用户配置 / User Configuration ----
set impl_strategy "Vivado Implementation Defaults"
# ----------------------------------------

# 设置实现策略 / Set implementation strategy
set_property strategy $impl_strategy [get_runs impl_1]

puts "开始实现 / Starting implementation..."
launch_runs impl_1 -jobs 4
wait_on_run impl_1

# 检查实现状态 / Check implementation status
set impl_status [get_property STATUS [get_runs impl_1]]
if {$impl_status ne "route_design Complete!"} {
    error "实现失败，状态: $impl_status / Implementation failed, status: $impl_status"
}

# 检查时序是否满足 / Check whether timing is met
set wns [get_property STATS.WNS [get_runs impl_1]]
set whs [get_property STATS.WHS [get_runs impl_1]]
puts "最差负裕量 WNS: ${wns} ns  最差保持裕量 WHS: ${whs} ns"

if {$wns < 0} {
    puts "警告: 时序未收敛 (WNS = ${wns} ns) / Warning: Timing not met (WNS = ${wns} ns)"
} else {
    puts "时序满足要求 / Timing requirements met."
}

puts "实现完成 / Implementation complete."
