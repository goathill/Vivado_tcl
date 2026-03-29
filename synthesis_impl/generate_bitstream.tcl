# generate_bitstream.tcl
# 生成比特流文件并将其导出到指定目录
# Generate the bitstream and export it to a specified directory
#
# 用法 / Usage:
#   在 Tcl Console 中（需实现已完成）:
#   source generate_bitstream.tcl

# ---- 用户配置 / User Configuration ----
set output_dir "./output_files"
# ----------------------------------------

# 创建输出目录（如不存在）/ Create output directory if it does not exist
if {![file exists $output_dir]} {
    file mkdir $output_dir
}

puts "开始生成比特流 / Starting bitstream generation..."
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# 复制比特流到输出目录 / Copy bitstream to output directory
set project_name [get_property NAME [current_project]]
set bit_file [glob -nocomplain \
    "[get_property DIRECTORY [current_project]]/${project_name}.runs/impl_1/*.bit"]

if {[llength $bit_file] == 0} {
    error "未找到比特流文件 / Bitstream file not found."
}

file copy -force $bit_file $output_dir
puts "比特流已复制至 '$output_dir' / Bitstream copied to '$output_dir'"

# 同时导出硬件描述文件（XSA）/ Also export hardware description file (XSA)
set xsa_path "${output_dir}/${project_name}.xsa"
write_hw_platform -fixed -force -file $xsa_path
puts "XSA 文件已导出至 '$xsa_path' / XSA file exported to '$xsa_path'"
