#!/bin/bash
web_id=$1
log_path=$2
mysql_host=$3
mysql_port=$4
mysql_user=$5
mysql_pass=$6
mysql_db=$7

#web_id='111'
#server_id='167'
#server_host='192.168.3.17'
#domain='.com'
#log_path='/foocaa_data/server/nginx/logs/www.com-access.log'
#client_id='192.168.3.15'
#mysql_host=''
#mysql_port='3306'
#mysql_user=''
#mysql_pass=''
#mysql_db='lepus'
query="select 1 ";
mysql_query=$(mysql -h${mysql_host}  -P${mysql_port}  -u${mysql_user}  -p${mysql_pass} -e "$query")
for list in $mysql_query
do
	if [ $list != '1' ]; then
		exit
	fi
done
if [ $# -ne 7 ]
then
    echo "usage:$0 server_id log_path mysql_host mysql_port  mysql_user mysql_pass mysql_db "
    exit
fi
if [ ! -f "$log_path" ];then
    echo "this $log_path files is not exist"
    exit
fi
chmod 755 $log_path


gawk -v web_id=$web_id -v mysql_host=$mysql_host -v mysql_port=$mysql_port -v mysql_user=$mysql_user -v mysql_pass=$mysql_pass -v dbname=$mysql_db 'BEGIN {}{
	if($5 !~"^/$|/*.html*|/static/|*?ac=*|/upfiles*|/uploads/|/editor*|/zj/ueditor/")
	{
		ip[$1" " ,$2" " ,$3" "$5]++;
	}
}END{

	if( length(ip)<1)
	{
		exit;
	}	
	for(k in ip )
	{
		split(k,c," ");
		client_ip=c[1];
		uv=c[2];
		split(c[3],time_arr,"+");
		ymd=substr(time_arr[1],2);
		"date '\''+%Y-%m-%d %H:%M:%S'\'' -d " ymd|getline response_time;
		close("date");
		url=c[4];
		sql="insert into web_log (web_id,ip,uv,url,response_time) values('\''"web_id"'\'' ,'\''"client_ip"'\'','\''"uv"'\'','\''"url"'\'','\''"response_time"'\'')";
		print sql;
		system("mysql -h" mysql_host "   -P" mysql_port "  -u"mysql_user "  -p"mysql_pass " " dbname " -e " "\"" sql "\"");

	}
}' $log_path

