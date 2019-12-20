sysdig 则是随着容器技术的普及而诞生的，主要用于容器的动态追踪。
sysdig 汇集了一些列性能工具的优势，可以说是集百家之所长。
我习惯用这个公式来表示 sysdig 的特点： 
sysdig = strace + tcpdump + htop + iftop + lsof + docker inspect。

而在最新的版本中（内核版本 >= 4.14），sysdig 还可以通过 eBPF 来进行扩展，
所以，也可以用来追踪内核中的各种函数和事件。`
