除了缓存命中率。pcstat 可以查看文件在内存中的缓存大小以及缓存比例。

pcstat 基于go语言

pcstat：https://github.com/tobert/pcstat
安装go：https://golang.org/dl/


--------------------------------
安装go：
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz

tar -xzvf go1.12.5.linux-amd64.tar.gz -C /usr/local/

mkdir -p /home/gopath

cat >> /etc/profile <<EOF
export GOROOT=/usr/local/go
export GOPATH=/home/gopath
export PATH=\$PATH:\$GOROOT/bin
EOF

source /etc/profile



-----------------------
安装pcstat
if [ $(uname -m) == "x86_64" ] ; then
    curl -L -o pcstat https://github.com/tobert/pcstat/raw/2014-05-02-01/pcstat.x86_64
else
    curl -L -o pcstat https://github.com/tobert/pcstat/raw/2014-05-02-01/pcstat.x86_32
fi
chmod 755 pcstat
./pcstat /var/lib/cassandra/data/*/*/*-Data.db
