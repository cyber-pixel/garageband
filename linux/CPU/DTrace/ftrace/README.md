ftrace动态追踪工具

通过debugfs/tracefs，以普通文件的形式，向用户空间提工访问接口。

以ls命令为例：

1.切换到debugfs的挂载点
cd /sys/kernel/debug/tracing
如果目录不存在，需要挂载
mount -t debugfs nodev /sys/kernel/debug

2.跟踪器类型
 cat available_tracers

使用跟踪器之前，还需要确认跟踪目标，包括内核函数和内核事件。
函数就是内核中的函数名

查询支持的函数和事件
 cat available_filter_functions
 cat available_events

3.第一步，设置要跟踪的函数
echo do_sus_open > set_graph_function

4.第二步，配置跟踪选项
echo function_graph > current_tracer
echo funcgraph-proc > trace_options

5.第三步，开启跟踪
echo 1 > tracing_on

6.第四步，执行ls命令，关闭跟踪
ls
echo 0 > tracing_on

7。第五步，查看跟踪结果
cat trace

=======================
以上步骤实在太麻烦，trace-cmd 帮你把这些步骤封装在一起
yum -y install trace-cmd


trace-cmd record -p function_graph -g do_sys_open -O funcgraph-proc ls
trace-cmd report
