systemtap和火焰图：http://tinyurl.com/t33dhun
官方安装文档：http://tinyurl.com/rfdytzf
下载rpm包一定要用官方的，不然会出错：http://tinyurl.com/qlolfdu

一、安装systemtap

查看内核版本和系统版本
# uname -r
# cat /etc/redhat-release

yum 安装 systemtap systemtap-runtime

安装内核信息包 stap-prep：
	需要安装match当前内核版本，yum一般会安装失败
	原因是源内没有对应的rpm，可以下载对应的rpm，
	下载地址:http://tinyurl.com/wabryv6

	kernel-debuginfo-version
	kernel-debuginfo-common-version
	kernel-devel-version

	测试：stap -v -e 'probe vfs.read {printf("read performed\n"); exit()}'

=========================
动态追踪技术漫谈:https://openresty.org/posts/dynamic-tracing/
SystemTap使用技巧:https://segmentfault.com/a/1190000010774974
使用火焰图做性能分析:http://tinyurl.com/rhnxnfd
Off-CPU Analysis:http://www.brendangregg.com/offcpuanalysis.html
内核探测工具systemtap简介:http://tinyurl.com/wc8bo3s
Linux 下的一个全新的性能测量和调式诊断工具 Systemtap:http://tinyurl.com/tc3a8db
Java火焰图:http://tinyurl.com/sftzyha

