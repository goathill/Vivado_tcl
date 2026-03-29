# 使用 curl 发送 HTTP 请求

# 设置目标 URL
set url ""

# 发送 GET 请求
if {[catch {exec curl -s --max-time 15 $url} response]} {
    # 输出失败信息
    puts "Notify failed: $response"
} else {
    # 输出返回内容
    puts "Notify success: $response"
}
