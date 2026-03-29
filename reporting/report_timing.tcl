# report_timing.tcl
# 生成时序报告并保存到文件
# Generate a timing summary report and save to a file
#
# 用法 / Usage:
#   在实现完成后的 Tcl Console 中: source report_timing.tcl
#   In the Tcl Console after implementation: source report_timing.tcl

# ---- 用户配置 / User Configuration ----
set output_dir  "./reports"
set report_file "${output_dir}/timing_summary.rpt"
# ----------------------------------------

# 创建输出目录 / Create output directory
if {![file exists $output_dir]} { file mkdir $output_dir }

# 生成时序摘要报告 / Generate timing summary report
report_timing_summary \
    -delay_type min_max \
    -report_unconstrained \
    -check_timing_verbose \
    -max_paths 10 \
    -input_pins \
    -routable_nets \
    -file $report_file

puts "时序摘要报告已保存至 '$report_file' / Timing summary report saved to '$report_file'"

# 额外：生成详细时序报告（最差路径）/ Extra: detailed report for the worst path
set detail_file "${output_dir}/timing_worst_paths.rpt"
report_timing \
    -sort_by group \
    -max_paths 20 \
    -path_type summary \
    -file $detail_file

puts "最差路径报告已保存至 '$detail_file' / Worst-path report saved to '$detail_file'"
