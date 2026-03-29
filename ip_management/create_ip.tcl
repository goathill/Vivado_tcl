# create_ip.tcl
# 在当前工程中创建并自定义一个 IP 核
# Create and customize an IP core in the current project
#
# 用法 / Usage:
#   在 Tcl Console 中: source create_ip.tcl
#
# 以下示例创建一个 Block Memory Generator IP 核
# The example below creates a Block Memory Generator IP core

# ---- 用户配置 / User Configuration ----
set ip_name    "blk_mem_gen_0"
set ip_vlnv    "xilinx.com:ip:blk_mem_gen:8.4"
set output_dir "./ip_cores"
# ----------------------------------------

# 创建 IP / Create IP
create_ip -name blk_mem_gen \
          -vendor xilinx.com \
          -library ip \
          -version 8.4 \
          -module_name $ip_name

# 配置 IP 属性 / Configure IP properties
# 双端口 RAM，深度 1024，宽度 32 / Dual-port RAM, depth 1024, width 32
set_property -dict {
    CONFIG.Memory_Type          {Simple_Dual_Port_RAM}
    CONFIG.Write_Width_A        {32}
    CONFIG.Write_Depth_A        {1024}
    CONFIG.Read_Width_A         {32}
    CONFIG.Write_Width_B        {32}
    CONFIG.Read_Width_B         {32}
    CONFIG.Enable_32bit_Address {false}
    CONFIG.Use_Byte_Write_Enable {false}
    CONFIG.Register_PortB_Output_of_Memory_Primitives {true}
} [get_ips $ip_name]

# 生成 IP 输出产品 / Generate IP output products
generate_target {instantiation_template} [get_files ${ip_name}.xci]
generate_target all [get_files ${ip_name}.xci]

puts "IP 核 '$ip_name' 已创建并生成 / IP core '$ip_name' created and generated."
