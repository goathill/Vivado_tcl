# create_project.tcl
# 创建一个新的 Vivado 工程
# Create a new Vivado project
#
# 用法 / Usage:
#   vivado -mode batch -source create_project.tcl
#   或在 Tcl Console 中: source create_project.tcl
#
# 修改以下变量以适配您的工程 / Modify the variables below to match your project

# ---- 用户配置 / User Configuration ----
set project_name  "my_project"
set project_dir   "./vivado_proj"
set part          "xc7a35tcpg236-1"   ;# 目标器件 / Target device
# ----------------------------------------

# 创建工程目录（如不存在）/ Create project directory if it does not exist
if {![file exists $project_dir]} {
    file mkdir $project_dir
}

# 新建工程 / Create the project
create_project $project_name $project_dir -part $part

# 设置综合和实现顶层模块 / Set top-level module for synthesis and implementation
# set_property top <top_module_name> [current_fileset]

puts "工程 '$project_name' 已创建于 '$project_dir' / Project '$project_name' created in '$project_dir'"
