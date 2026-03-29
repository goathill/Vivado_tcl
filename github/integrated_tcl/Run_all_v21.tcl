reset_run synth_1

launch_runs impl_1 -to_step write_bitstream -jobs 12

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

# 定义一个函数来检查运行状态
proc check_run_status_Imp {runName} {
    # 获取当前综合进程的状态
    set runStatus [get_property status [get_run $runName]]
    
    # 输出当前运行状态
    puts "Current status of $runName: $runStatus"
    
    # 根据状态执行相应的操作
    if {$runStatus == "Running Design Initialization..." 
    || $runStatus == "Running opt_design..."
    || $runStatus == "Running place_design..."
    || $runStatus == "Running route_design..."
    || $runStatus == "Running write_bitstream..."
    || $runStatus == "Queued..."
    } {
        puts "The implementation is still running. Waiting 10 seconds..."
        
        # 等待10秒后再次检查状态
        after 10000 [list check_run_status_Imp $runName]
    } elseif {
    $runStatus == "opt_design ERROR"
    || $runStatus == "place_design ERROR"
    || $runStatus == "route_design ERROR"
    || $runStatus == "write_bitstream ERROR"
    } {
        puts "Implementation failed. Executing error_IMP.tcl..."
        
        # 执行 error_IMP.tcl 错误处理脚本
        # 设置目标 URL
        set url ""
        # 发送 GET 请求
        set response [http::geturl $url]

        # 输出返回内容
        puts "Response: $response"

        # 关闭连接
        http::cleanup $response
    } elseif {$runStatus == "route_design Complete!"} {
        puts "route_design completed successfully. Executing Implementation.tcl..."
        
            # 执行 error_IMP.tcl 错误处理脚本
        # 设置目标 URL
        set url ""
        # 发送 GET 请求
        set response [http::geturl $url]

        # 输出返回内容
        puts "Response: $response"

        # 关闭连接
        http::cleanup $response 
    } elseif {$runStatus == "write_bitstream Complete!"} {
        puts "write_bitstream completed successfully. Executing Implementation.tcl..."
        
                # 执行 error_IMP.tcl 错误处理脚本
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
check_run_status_Imp "impl_1"




