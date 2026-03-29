# report_power.tcl
# 生成功耗报告并保存到文件
# Generate a power report and save to a file
#
# 用法 / Usage:
#   在实现完成后的 Tcl Console 中: source report_power.tcl
#   In the Tcl Console after implementation: source report_power.tcl

# ---- 用户配置 / User Configuration ----
set output_dir  "./reports"
set report_file "${output_dir}/power.rpt"

# 环境参数 / Environmental parameters
set ambient_temp 25   ;# 环境温度(°C) / Ambient temperature (°C)
set junction_temp_max 85 ;# 最大结温(°C) / Maximum junction temperature (°C)
# ----------------------------------------

# 创建输出目录 / Create output directory
if {![file exists $output_dir]} { file mkdir $output_dir }

# 设置活跃率假设（默认 12.5%，可根据实际调整）
# Set activity rate assumption (default 12.5%; adjust as needed)
set_operating_conditions -ambient_temp $ambient_temp

# 生成功耗报告 / Generate power report
report_power \
    -file $report_file \
    -hierarchical \
    -hierarchical_depth 3

puts "功耗报告已保存至 '$report_file' / Power report saved to '$report_file'"
