# generate_ip_output.tcl
# 为工程中的所有 IP 核生成输出产品
# Generate output products for all IP cores in the project
#
# 用法 / Usage:
#   在 Tcl Console 中: source generate_ip_output.tcl

set all_ips [get_ips]

if {[llength $all_ips] == 0} {
    puts "工程中没有 IP 核 / No IP cores found in the project."
} else {
    puts "为 [llength $all_ips] 个 IP 核生成输出产品 / Generating output products for [llength $all_ips] IP core(s)..."

    foreach ip $all_ips {
        set ip_name [get_property NAME $ip]
        puts "  处理 / Processing: $ip_name"
        generate_target all [get_files -of_objects $ip]
    }

    # 导出仿真脚本 / Export simulation scripts
    export_ip_user_files -of_objects $all_ips -no_script -sync -force -quiet

    puts "所有 IP 核输出产品已生成 / All IP core output products generated."
}
