# add_sources.tcl
# 向当前打开的 Vivado 工程中添加源文件
# Add source files to the currently open Vivado project
#
# 用法 / Usage:
#   在 Tcl Console 中: source add_sources.tcl
#   或通过批处理并配合 open_project: source add_sources.tcl

# ---- 用户配置 / User Configuration ----
# 设计源文件列表（RTL）/ Design source files (RTL)
set rtl_files {
    "../src/top.v"
    "../src/submodule.v"
}

# XDC 约束文件 / XDC constraint files
set xdc_files {
    "../constraints/top.xdc"
}

# 仿真源文件 / Simulation source files
set sim_files {
    "../sim/tb_top.v"
}
# ----------------------------------------

# 添加 RTL 源文件 / Add RTL source files
if {[llength $rtl_files] > 0} {
    add_files -norecurse $rtl_files
    puts "已添加 RTL 源文件 / RTL source files added."
}

# 添加约束文件 / Add constraint files
if {[llength $xdc_files] > 0} {
    add_files -fileset constrs_1 -norecurse $xdc_files
    puts "已添加约束文件 / Constraint files added."
}

# 添加仿真文件 / Add simulation files
if {[llength $sim_files] > 0} {
    add_files -fileset sim_1 -norecurse $sim_files
    puts "已添加仿真文件 / Simulation files added."
}

# 更新编译顺序 / Update compile order
update_compile_order -fileset sources_1
puts "编译顺序已更新 / Compile order updated."
