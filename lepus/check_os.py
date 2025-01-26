#!//bin/env python
#coding:utf-8
import os
import sys
import string
import time
import datetime
import MySQLdb
import logging
import logging.config
logging.config.fileConfig("etc/logger.ini")
logger = logging.getLogger("lepus")
path='./include'
sys.path.insert(0,path)
import functions as func
import thread
from multiprocessing import Process;

dbhost = func.get_config('monitor_server','host')
dbport = func.get_config('monitor_server','port')
dbuser = func.get_config('monitor_server','user')
dbpasswd = func.get_config('monitor_server','passwd')
dbname = func.get_config('monitor_server','dbname')

def check_os(ip,community,filter_os_disk,tags):

    func.mysql_exec("insert into os_status_history select *, LEFT(REPLACE(REPLACE(REPLACE(create_time,'-',''),' ',''),':',''),12) from os_status where ip='%s';" %(ip),'')
    func.mysql_exec("insert into os_disk_history select *, LEFT(REPLACE(REPLACE(REPLACE(create_time,'-',''),' ',''),':',''),12) from os_disk where ip='%s';" %(ip),'')
    func.mysql_exec("insert into os_diskio_history select *, LEFT(REPLACE(REPLACE(REPLACE(create_time,'-',''),' ',''),':',''),12) from os_diskio where ip='%s';" %(ip),'')
    func.mysql_exec("insert into os_net_history select *, LEFT(REPLACE(REPLACE(REPLACE(create_time,'-',''),' ',''),':',''),12) from os_net where ip='%s';" %(ip),'')
    func.mysql_exec("delete from os_status where ip='%s'" %(ip),'')
    func.mysql_exec("delete from os_disk where ip='%s'" %(ip),'')
    func.mysql_exec("delete from os_diskio where ip='%s'" %(ip),'')
    func.mysql_exec("delete from os_net where ip='%s'" %(ip),'')

    command="/bin/bash check_os.sh"    
    try :
        #print command,ip,dbhost,dbport,dbuser,dbpasswd,dbname,community,tags,filter_os_disk
        os.system("%s %s %s %s %s %s %s %s %s %s"%(command,ip,dbhost,dbport,dbuser,dbpasswd,dbname,community,tags,filter_os_disk))
   
    except Exception, e:
            print e
            sys.exit(1)
    finally:
            sys.exit(1)


def main():

    #get os servers list
    
    cur_time = time.time()
    servers=func.mysql_query("select host,community,filter_os_disk,tags,exclude_start_time,exclude_end_time  from db_servers_os where is_delete=0 and monitor=1;")    
    logger.info("check os controller started.")
    if servers:
         plist = []
         for row in servers:
             host=row[0]
             community=row[1]
             filter_os_disk=row[2]
             tags=row[3]
             exclude_start_time=row[4]
             exclude_end_time=row[5]             
             if host <> '' :
                if exclude_start_time>0 and exclude_start_time is not None and exclude_end_time >0 and exclude_end_time is not None:
                    now = datetime.datetime.now()
                    create_time = now.strftime("%Y-%m-%d")
                    exclude_start_time=str(create_time)+' '+str(exclude_start_time)
                    exclude_end_time=str(create_time)+' '+str(exclude_end_time)
                    exclude_start_time=time.mktime(time.strptime(exclude_start_time,'%Y-%m-%d %H:%M:%S'))
                    exclude_end_time=time.mktime(time.strptime(exclude_end_time,'%Y-%m-%d %H:%M:%S'))
                    
                    if cur_time >= exclude_start_time and  cur_time <= exclude_end_time:                    
                        logger.info(str(host)+":不在监控时间内")
                        continue
                Process(target=check_os,args=(host,community,filter_os_disk,tags)).start()
                #thread.start_new_thread(check_os,(host,community,filter_os_disk,tags))
                #time.sleep(1)
		 #p = Process(target = check_os, args=(host,filter_os_disk))
                 #plist.append(p)
                 #p.start()

         #for p in plist:
         #    p.join()

    else: 
         logger.warning("check os: not found any servers")

    logger.info("check os controller finished.")

if __name__=='__main__':
     main()
