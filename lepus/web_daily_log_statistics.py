#!/bin/env python
#-*-coding:utf-8-*-
##crond 每天5:00统计当日ip、pv、uv访问量到web_daily_pv表
import datetime
import MySQLdb
host='61.145.190.140'
user='lepus_user'
passwd='f00k11_admin'
port=3306
dbname='lepus'
def getYesterday(): 
    today=datetime.date.today() 
    oneday=datetime.timedelta(days=1) 
    yesterday=today-oneday  
    return yesterday
yesterday=getYesterday()
#today = datetime.date.today()
#yesterday='2016-11-20'
now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
print "开始统计时间:"+now
start_time=str(yesterday)+' 00:00:00'
end_time=str(yesterday)+' 23:59:59'
conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=10,charset='utf8')
conn.select_db(dbname)
curs = conn.cursor()
sql="SELECT GROUP_CONCAT(id) AS web_id ,domain FROM db_servers_web  WHERE is_delete =0 GROUP BY domain"
try:
    curs.execute(sql)
    results=curs.fetchall()
    for row in results:
        web_ids=row[0]
        domain=row[1]
        sql="select  id  from web_daily_pv  where domain='"+str(domain)+"' and cur_date='"+str(yesterday)+"'" 
        curs.execute(sql)
        cur_status=curs.fetchone()
        if cur_status is  None:            
            sql="SELECT  COUNT(id) AS pv  FROM web_log WHERE response_time between '"+str(start_time)+"' and  '"+str(end_time)+"'  AND web_id IN("+str(web_ids)+")"
            curs.execute(sql)
            pv_res=curs.fetchone()
            if pv_res is None  or pv_res[0] <=0:
                continue
            sql="SELECT  COUNT(DISTINCT(ip)) AS ip  FROM web_log WHERE response_time between '"+str(start_time)+"' and  '"+str(end_time)+"'  AND web_id IN("+str(web_ids)+")"
            curs.execute(sql)
            ip_res=curs.fetchone()
            sql="SELECT  COUNT(DISTINCT(uv)) AS ip  FROM web_log WHERE response_time between '"+str(start_time)+"' and  '"+str(end_time)+"'  AND web_id IN("+str(web_ids)+")"
            curs.execute(sql)
            uv_res=curs.fetchone()
            sql="INSERT INTO web_daily_pv (domain,pv,uv,ip,cur_date)VALUES('"+str(domain)+"',"+str(pv_res[0])+","+str(uv_res[0])+","+str(ip_res[0])+",'"+str(yesterday)+"');"
            curs.execute(sql)
            conn.commit()
except Exception,e:
    conn.rollback()
    print "mysql execute: " + str(e)
conn.close()
now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
print "完成统计时间:"+now
