#!/bin/bash
# chkconfig: - 85 15
# description: Nginx server control script (multiple instance)
# processname: nginx
# config file: ./conf/nginx.conf
# pid file: ./logs/nginx.pid
# 
# 

# source function library
#. /etc/rc.d/init.d/functions
[ -f /etc/init.d/functions ] && . /etc/init.d/functions

NGINX_NAME="nginx"
NGINX_PROG="/opt/nginx/sbin/nginx"

DIR="$( cd "$( dirname "$0"  )" && pwd  )" # 脚本所在目录http://tinyurl.com/wfkmepm
#多实例的特征是启动脚本和conf文件不在prefix中
NGINX_PID_FILE="${DIR}/logs/nginx.pid"
NGINX_CONF_FILE="${DIR}/conf/nginx.conf"

NGINX_PID=0
[ -f $NGINX_PID_FILE ] && NGINX_PID=$(cat $NGINX_PID_FILE)

#USER_NAME="job"
USER_NAME=$USER
NGINX_LOCK_FILE="/var/lock/subsys/nginx_${USER_NAME}.lock"

# check current user
[ "$USER" != "root" ] && exit 1

start() {
    status
        if [[ $? -eq 0 ]]; then
            echo $"Nginx (PID $(cat $NGINX_PID_FILE)) already started."
            return 1
        fi
    echo -n $"Starting $NGINX_NAME: "
        daemon $NGINX_PROG -c $NGINX_CONF_FILE -p $DIR
        retval=$?
        echo
    [ $retval -eq 0 ] && touch $NGINX_LOCK_FILE
    $NGINX_PID=$(cat $NGINX_PID_FILE)
    return $retval
}

stop() {
    status
        if [[ $? -eq 1 ]]; then
            echo "Nginx server already stopped."
            return 1
        fi
    echo -n $"Stoping $NGINX_NAME: "
        #killproc $NGINX_PROG
        #killproc -p $NGINX_PID_FILE -INT
        kill -TERM $NGINX_PID > /dev/null 2>&1 #http://tinyurl.com/vzx3q35
        retval=$?
        echo
    [ $retval -eq 0 ] && rm -f $NGINX_LOCK_FILE
    return $retval
}

quit() {
    echo -n $"graceful shutdown $NGINX_NAME: "
        #killproc $NGINX_PROG -HUP
        #killproc -p $NGINX_PID_FILE -QUIT
        kill -QUIT $NGINX_PID > /dev/null 2>&1
        retval=$?
        echo
    return $retval
}

reopen() {
    echo -n $"re-opening log files $NGINX_NAME: "
        #killproc $NGINX_PROG -HUP
        #killproc -p $NGINX_PID_FILE -USR1
        kill -USR1 $NGINX_PID > /dev/null 2>&1
        retval=$?
        echo
    return $retval
}

restart() {
    stop
        sleep 1
    start
    retval=$?
    return $retval
}

reload() {
    echo -n $"Reloading $NGINX_NAME: "
        #killproc $NGINX_PROG -HUP
        #killproc -p $NGINX_PID_FILE -HUP
        kill -HUP $NGINX_PID > /dev/null 2>&1
        retval=$?
        echo
    return $retval
}

status() {
    #netstat -anpt | grep "/nginx" | awk '{print $6}' &> /dev/null
    ps aux | grep "$NGINX_PROG" | grep -v grep &> /dev/null
        if [[ $? -eq 0 ]]; then
            if [[ -f $NGINX_LOCK_FILE ]]; then
                return 0
            else
                return 1
            fi
        fi
    return 1
}

_status() {
    status
        if [[ $? -eq 0 ]]; then
            echo $"Nginx (PID $(cat $NGINX_PID_FILE)) already started."
            state=`netstat -anpt | grep "/nginx" | awk '{ print $6 }'`
            echo $"Nginx server status is: $state"
        else
            echo "Nginx server is not running"
        fi
}

test() {
    $NGINX_PROG -t -c $NGINX_CONF_FILE -p $DIR
        retval=$?
    return $retval
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    quit)
	quit
	;;
    reopen)
	reopen
	;;
    reload)
        reload
        ;;
    restart)
        restart
        ;;
    status)
        _status
        ;;
    test)
        test
        ;;
    *)
        echo "Usage: { start | stop | quit | reopen | reload | restart | status | test }"
        exit 1
esac
