# set_io_constraints.tcl
# 设置 IO 引脚位置和电平标准约束
# Set IO pin location and voltage standard constraints
#
# 用法 / Usage:
#   在 Tcl Console 中，或添加到 XDC 文件中
#   In the Tcl Console, or add to an XDC file
#
# 注意: 以下示例针对 Artix-7 (xc7a35t) 开发板，请根据实际板卡修改引脚编号和标准
# Note: The examples below target an Artix-7 board; modify pin numbers and
#       standards to match your actual board

# ---- 时钟引脚 / Clock pin ----
set_property PACKAGE_PIN W5  [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]

# ---- 复位引脚 / Reset pin ----
set_property PACKAGE_PIN V17 [get_ports rst_n]
set_property IOSTANDARD LVCMOS33 [get_ports rst_n]

# ---- LED 输出引脚示例 / LED output pin example ----
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]

set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]

# ---- 按键输入引脚示例 / Button input pin example ----
set_property PACKAGE_PIN T18 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[0]}]

puts "IO 约束已设置 / IO constraints set."
