#!/bin/bash
web_id=$1
log_path=$2
mysql_host=$3
mysql_port=$4
mysql_user=$5
mysql_pass=$6
mysql_db=$7
#web_id=
# log_path='/server/httpd/logs/eu.qa.cn_access_20160817.log'
# mysql_host=''
# mysql_port='3306'
# mysql_user=''
# mysql_pass=''
# mysql_db='lepus'
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
cur_date=$(date +%Y-%m-%d)
start=`date +"%Y-%m-%d %H:%M:%S"`
echo "start time:{$start}"
gawk -v web_id=$web_id -v mysql_host=$mysql_host -v mysql_port=$mysql_port -v mysql_user=$mysql_user -v mysql_pass=$mysql_pass -v dbname=$mysql_db -v cur_date=$cur_date '{
	if($6 !~"^/$|/*.html*|/static/|*?ac=*|/upfiles*|/uploads/|/editor*|/zj/ueditor/|/favicon.ico|/images/|/css/")
	{
		ip[$1" " ,$2" " ,$3" "$4" ",$6]++;
	}
}END{
	for(k in ip )
	{
		split(k,c," ");
		client_ip=c[1];        
		uv=c[2];
        if(client_ip == "-")
        {
            continue;
        }
		yy=substr(c[3],2);
		response_time=yy" "c[4];
		url=substr(c[5],2,100);
        if(url == "GET")
        {
            continue;
        }
		sql="insert into web_log (web_id,ip,uv,url,response_time,cur_date) values('\''"web_id"'\'' ,'\''"client_ip"'\'','\''"uv"'\'','\''"url"'\'','\''"response_time"'\'','\''"cur_date"'\'')";
		system("mysql -h" mysql_host "   -P" mysql_port "  -u"mysql_user "  -p"mysql_pass " " dbname " -e " "\"" sql "\"");

	}
}' $log_path
end=`date +"%Y-%m-%d %H:%M:%S"`
echo "end time:{$end}"

