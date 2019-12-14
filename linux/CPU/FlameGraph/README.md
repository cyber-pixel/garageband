FlameGraph 火焰图：git clone https://github.com/brendangregg/FlameGraph.git

------------------------------------------

使用perf + FlameGraph生成火焰图：http://tinyurl.com/st3kej5

# perf record表示记录
# -F 99表示每秒99次
# -p 13204是进程号，即对哪个进程进行分析
# -g表示记录调用栈
# sleep 30则是持续30秒
perf record -F 99 -p 13204 -g -- sleep 30

#perf可以直接读取结果
#perf report

perf script > /tmp/13204.perf

# 处理perf script
./FlameGraph/stackcollapse-perf.pl /tmp/13204.perf > 13204.folded

# 绘制SVG
./FlameGraph/flamegraph.pl 13204.folded > 13204.svg


火焰图局限性
	调用栈不完整：调用栈过深时，某些系统只返回一部分
	函数名缺失：有些函数名没有名字，编译器只用内存地址来表示
