# add_xdc.tcl
# 向当前工程中添加 XDC 约束文件
# Add an XDC constraint file to the current project
#
# 用法 / Usage:
#   在 Tcl Console 中: source add_xdc.tcl

# ---- 用户配置 / User Configuration ----
set xdc_file "../constraints/top.xdc"
# ----------------------------------------

if {![file exists $xdc_file]} {
    error "XDC 文件未找到: $xdc_file / XDC file not found: $xdc_file"
}

add_files -fileset constrs_1 -norecurse $xdc_file
set_property PROCESSING_ORDER NORMAL \
    [get_files -of_objects [get_filesets constrs_1] $xdc_file]

puts "XDC 文件已添加: $xdc_file / XDC file added: $xdc_file"
