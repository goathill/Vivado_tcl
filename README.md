# Vivado_tcl

汇总归纳各种 Vivado 中的 TCL 脚本。  
This repository summarizes and categorizes various TCL scripts used in Xilinx Vivado.

## 目录结构 / Directory Structure

| 目录 / Directory | 说明 / Description |
|---|---|
| [`project/`](project/README.md) | 项目创建与管理脚本 / Project creation and management scripts |
| [`synthesis_impl/`](synthesis_impl/README.md) | 综合与实现脚本 / Synthesis and implementation scripts |
| [`constraints/`](constraints/README.md) | 约束文件管理脚本 / Constraint file management scripts |
| [`ip_management/`](ip_management/README.md) | IP 核管理脚本 / IP core management scripts |
| [`simulation/`](simulation/README.md) | 仿真脚本 / Simulation scripts |
| [`reporting/`](reporting/README.md) | 报告与分析脚本 / Reporting and analysis scripts |

## 使用说明 / Usage

在 Vivado Tcl Console 或批处理模式下，使用以下方式运行脚本：  
Run scripts in the Vivado Tcl Console or in batch mode:

```tcl
# 在 Tcl Console 中运行 / Run in Tcl Console
source <script_path>.tcl

# 批处理模式 / Batch mode
vivado -mode batch -source <script_path>.tcl
```

## 贡献 / Contributing

欢迎提交新的 TCL 脚本或改进现有脚本。  
Contributions of new TCL scripts or improvements to existing ones are welcome.
