centos7更新内核，安装bcc-tools：
	http://tinyurl.com/utzgszb
	http://tinyurl.com/s6wcr85

注意这里的更新内核是升级到当前版本的最新内核，谨慎更新
系统版本也更新了，内核版本也更新了

安装 bcc-tools
yum install -y bcc-tools
 
配置 PATH 路径
export PATH=$PATH:/usr/share/bcc/tools
 
验证安装成功
cachestat 
