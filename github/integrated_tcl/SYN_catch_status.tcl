reset_run synth_1
launch_runs synth_1 -jobs 12
# 导入 http 库
package require http

# 定义一个函数来检查运行状态
proc check_run_status_Syn {runName} {
    # 获取当前综合进程的状态
    set runStatus [get_property status [get_run $runName]]
    
    # 输出当前运行状态
    puts "Current status of $runName: $runStatus"
    
    # 根据状态执行相应的操作
    if {$runStatus == "Running synth_design..."|| $runStatus == "Queued..."} {
        puts "The synthesis is still running. Waiting 10 seconds..."
        
        # 等待10秒后再次检查状态
        after 10000 [list check_run_status_Syn $runName]
    } elseif {$runStatus == "synth_design ERROR"} {
        puts "Synthesis failed. Executing error_SYN.tcl..."
        
        # 执行 error_SYN.tcl 错误处理脚本
        # 设置目标 URL
        set url ""
        # 发送 GET 请求
        set response [http::geturl $url]

        # 输出返回内容
        puts "Response: $response"

        # 关闭连接
        http::cleanup $response
    } elseif {$runStatus == "synth_design Complete!"} {
        puts "Synthesis completed successfully. Executing Synthesis.tcl..."
        
        # 执行 error_SYN.tcl 错误处理脚本
        # 设置目标 URL
        set url ""
        # 发送 GET 请求
        set response [http::geturl $url]

        # 输出返回内容
        puts "Response: $response"

        # 关闭连接
        http::cleanup $response 
    } else {
        puts "Unknown status: $runStatus"
    }
}

# 初始调用，开始检查运行状态
check_run_status_Syn "synth_1"
