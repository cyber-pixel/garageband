相对于ftrace和perf，eBPF更加灵活，可以通过脚本自由扩展

eBPF就是linux版的DTrace，可以通过C语言自由扩展(这些扩展通过LLVM转换为BPF字节码后，加载到内核中执行)。

在eBPF的执行过程中，需要编译、加载还有maps等操作，对所有的跟踪程序来说多是通用的。
把这些过程通过Python抽象起来，也就诞生了BCC（BPF Compiler Collection）。
但是因为需要和内核交互，所以真正的核心事件还是需要用C来编写。


yum -y install bss-tools

eBPF和BCC的使用，其实比ftrace和perf有更高的门槛。想用BCC开发自己的动态耿总程序，至少要熟悉C语言、Python语言、被跟踪事件或函数的特征以及eBPF提供的各种数据操作方法。

BCC内置了很多已经开发号的使用工具，默认安装到/usr/share/bcc/tools/目录中！
