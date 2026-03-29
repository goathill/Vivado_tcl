# export_project.tcl
# 将当前 Vivado 工程导出为可移植的 TCL 重建脚本
# Export the current Vivado project as a portable TCL reconstruction script
#
# 用法 / Usage:
#   在 Tcl Console 中（需已打开工程）:
#   source export_project.tcl

# ---- 用户配置 / User Configuration ----
set output_script "./rebuild_project.tcl"
# ----------------------------------------

# 导出工程脚本 / Export project script
write_project_tcl -force $output_script

puts "工程已导出至 '$output_script' / Project exported to '$output_script'"
puts "使用以下命令重建工程 / Use the following command to rebuild the project:"
puts "  vivado -mode batch -source $output_script"
