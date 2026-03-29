# report_utilization.tcl
# 生成资源利用率报告并保存到文件
# Generate a resource utilization report and save to a file
#
# 用法 / Usage:
#   在综合或实现完成后的 Tcl Console 中: source report_utilization.tcl
#   In the Tcl Console after synthesis or implementation: source report_utilization.tcl

# ---- 用户配置 / User Configuration ----
set output_dir  "./reports"
set report_file "${output_dir}/utilization.rpt"
# ----------------------------------------

# 创建输出目录 / Create output directory
if {![file exists $output_dir]} { file mkdir $output_dir }

# 生成利用率报告 / Generate utilization report
report_utilization \
    -hierarchical \
    -file $report_file

puts "资源利用率报告已保存至 '$report_file' / Utilization report saved to '$report_file'"
