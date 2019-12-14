Linux系统性能和使用活动监控工具 sysstat：http://tinyurl.com/vxb5xsb
stress和sysstat模拟性能调优：http://tinyurl.com/v6zp3x3


sysstat：
	https://github.com/sysstat/sysstat
	iostat mpstat pidstat tapestat cifsiostat
	
	yum安装的pidstat没有%wait项，原因是centos默认的sysstat版本较老
	使用github的源码安装

	git clone git://github.com/sysstat/sysstat
	./configure --help
	./configure
	make && make install
