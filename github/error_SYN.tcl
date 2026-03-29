# 导入 http 库
package require http

after 10000
# 设置目标 URL
set url ""

# 发送 GET 请求
set response [http::geturl $url]

# 输出返回内容
puts "Response: $response"

# 关闭连接
http::cleanup $response
