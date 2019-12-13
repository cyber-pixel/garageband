nginx-1.14.0的详细安装教程
http://tinyurl.com/wsxbu7a

一、安装依赖：
	yum -y install gcc gcc-c++ make automake autoconf pcre pcre-devel zlib zlib-devel openssl openssl-devel libtool

包的作用可以查看教程

二、下载nginx：
	wget http://nginx.org/download/nginx-1.14.0.tar.gz

三、编译安装
	./configure --prefix=/opt/nginx --with-http_ssl_module
	make && make install
	

	采用多实例的运行策略：
		nginx：/opt/nginx/sbin/nginx
		
		multi-user1:/opt/runtime/nginx-username1
		multi-user2:/opt/runtime/nginx-username2
		
		配置文件：从/opt/nginx复制:
			conf/ html/ logs/ nginx.sh

	nginx.sh 是一个简单的管理脚本，只对当前目录的nginx起作用
