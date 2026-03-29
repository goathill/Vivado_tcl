# set_clock_constraints.tcl
# 为设计中的时钟创建时序约束
# Create timing constraints for clocks in the design
#
# 用法 / Usage:
#   在综合或实现前，将本脚本内容添加到 XDC 文件中，或在 Tcl Console 中 source
#   Add the contents of this script to an XDC file before synthesis/implementation,
#   or source it in the Tcl Console prior to running synthesis
#
# 注意: 以下示例约束需根据实际设计修改端口名和频率
# Note: Modify port names and frequencies to match your actual design

# ---- 主时钟约束示例 / Primary clock constraint example ----
# 100 MHz 主时钟（周期 10 ns）/ 100 MHz primary clock (period 10 ns)
create_clock -period 10.000 -name sys_clk -waveform {0.000 5.000} [get_ports sys_clk]

# ---- 衍生时钟示例 / Generated clock example ----
# 如果使用 MMCM/PLL 生成时钟，Vivado 通常能自动推导，但也可手动指定：
# If a MMCM/PLL generates a clock, Vivado usually infers it automatically,
# but you can also specify it manually:
# create_generated_clock -name clk_50mhz -source [get_pins mmcm_inst/CLKIN1] \
#     -multiply_by 1 -divide_by 2 [get_pins mmcm_inst/CLKOUT0]

# ---- 跨时钟域约束示例 / CDC constraint example ----
# 声明两个异步时钟之间没有时序关系 / Declare no timing relationship between two async clocks
# set_clock_groups -asynchronous -group [get_clocks sys_clk] \
#                                -group [get_clocks clk_50mhz]

puts "时钟约束已设置 / Clock constraints set."
