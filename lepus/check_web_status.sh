#!/bin/bash
#set -x
web_id=$1
web_port=$2
web_name=$3
mysql_host=$4
mysql_port=$5
mysql_user=$6
mysql_pass=$7
mysql_db=$8

if [ $# -ne 8 ]
then
    echo "usage:$0 web_id web_port web_name mysql_host mysql_port  mysql_user mysql_pass mysql_db"
    exit
fi
query="select 1 ";
mysql_query=$(mysql -h${mysql_host}  -P${mysql_port}  -u${mysql_user}  -p${mysql_pass} -e "$query")
for list in $mysql_query
do
        if [ $list != '1' ]; then
                echo "无法连接数据库，检查数据库连接配置"
                exit
        fi
done
process_num=`ps -ef | grep $web_name |grep -Ev "grep|cronolog"|wc -l`

listen=`netstat -nta|grep $web_port |grep "LISTEN" |wc -l`
time_wait=`netstat -nta|grep $web_port |grep "TIME_WAIT" |wc -l`
established=`netstat -nta|grep $web_port |grep "ESTABLISHED" |wc -l`
remark=''
create_time=`date +"%Y-%m-%d %H:%M:%S"`

#echo $process_num,$listen,$time_wait,$established,
if test  "$process_num" = '' && test "$listen" = '';then
        echo "/etc/init.d/$web_name start"   
        /etc/init.d/$web_name start
        remark="检测$web_name停止服务,监控系统尝试自动启动(/etc/init.d/$web_name start)"
fi

sql="($web_id,$process_num,$listen,$established,$time_wait,'"${create_time}"','"${remark}"')"
query="INSERT INTO ${mysql_db}.web_status (web_id,process_num,listen, established, time_wait, create_time, remark)VALUES ${sql}"
mysql_query=$(mysql -h${mysql_host}  -P${mysql_port}  -u${mysql_user}  -p${mysql_pass} -e "$query")
echo "插入数据成功"

