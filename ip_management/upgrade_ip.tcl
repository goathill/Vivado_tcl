# upgrade_ip.tcl
# 升级当前工程中所有过时的 IP 核到最新版本
# Upgrade all out-of-date IP cores in the current project to the latest version
#
# 用法 / Usage:
#   在 Tcl Console 中: source upgrade_ip.tcl

# 检查工程中过时的 IP / Check for out-of-date IPs in the project
set outdated_ips [get_ips -filter {UPGRADE_VERSIONS != ""}]

if {[llength $outdated_ips] == 0} {
    puts "没有需要升级的 IP 核 / No IP cores need upgrading."
} else {
    puts "发现 [llength $outdated_ips] 个过时的 IP 核 / Found [llength $outdated_ips] out-of-date IP core(s):"
    foreach ip $outdated_ips {
        puts "  - [get_property NAME $ip]  当前版本 / current: [get_property VERSION $ip]  \
可升级至 / can upgrade to: [get_property UPGRADE_VERSIONS $ip]"
    }

    # 执行升级 / Perform upgrade
    upgrade_ip $outdated_ips

    # 重新生成输出产品 / Regenerate output products
    foreach ip $outdated_ips {
        generate_target all [get_files -of_objects $ip]
    }

    puts "所有 IP 核升级完成 / All IP cores upgraded."
}
