#!/bin/env python
#coding:utf-8
import os,sys
import MySQLdb
import string
import time
import datetime
import paramiko
import json
import logging
import logging.config
logging.config.fileConfig("etc/logger.ini")
logger = logging.getLogger("lepus")
path='./include'
sys.path.insert(0,path)
import functions as func
import lepus_mysql as mysql
import thread
import multiprocessing
from multiprocessing import Process

dbhost = func.get_config('monitor_server','host')
dbport = func.get_config('monitor_server','port')
dbuser = func.get_config('monitor_server','user')
dbpasswd = func.get_config('monitor_server','passwd')
dbname = func.get_config('monitor_server','dbname')

 
def web_log(host,ssh_port,user,password,rsa_file,log_path,web_id,dbhost,dbport,dbuser,dbpasswd,dbname,frequency_monitor,web_name):
    if frequency_monitor==86400:
            hour=str(20)
            miniute=str(30)
            cur_hour=(time.strftime('%H',time.localtime(time.time())))
            cur_minite=(time.strftime('%M',time.localtime(time.time())))
            now = datetime.datetime.now()
            create_time = now.strftime("%Y-%m-%d")
            print create_time
            #create_time ='2016-11-16'
            if cur_hour  >= hour and cur_minite  >= miniute:
                sql="SELECT id FROM web_log WHERE web_id= "+str(web_id)+" AND cur_date='"+str(create_time)+"' LIMIT 1"
                print sql
                is_exist=func.mysql_query(sql)
                print is_exist
                if is_exist==0 or is_exist is  None:
                    cur_dir=os.getcwd()               
                    #远程推送
                    if web_name=='nginx':
                        script_file='check_nginx_web_log.sh'
                    else:
                        script_file='check_web_log.sh'
                    local_path=cur_dir+'/'+script_file
                    remote_path='/tmp/'+script_file
                    func.sftp_upload(host,ssh_port,user,password,rsa_file,local_path,remote_path,logger)
                    ##执行远程脚本
                    args=str(web_id)+' '+str(log_path)+' ' +str(dbhost)+' '+str(dbport)+' '+str(dbuser)+' '+str(dbpasswd)+' '+str(dbname)
                    script='chmod 700 '+remote_path+'&&'+remote_path+' '+args
                    func.exec_command(host,ssh_port,user,password,rsa_file,script,logger)
            else:
                logger.info(host+'按天收集日志信息时间:'+hour+':'+miniute)
def web_status(host,ssh_port,user,password,rsa_file,web_id,dbhost,dbport,dbuser,dbpasswd,dbname,web_name,web_port):    
    cur_dir=os.getcwd()
    script_file='check_web_status.sh'
    local_path=cur_dir+'/'+script_file
    remote_path='/tmp/'+script_file
    print local_path,remote_path
    func.sftp_upload(host,ssh_port,user,password,rsa_file,local_path,remote_path,logger)
    ##执行远程脚本       
    args=str(web_id)+' ' +str(web_port)+' ' +str(web_name)+' ' +str(dbhost)+' '+str(dbport)+' '+str(dbuser)+' '+str(dbpasswd)+' '+str(dbname)
    script='chmod 700 '+ remote_path +'&&'+'/bin/bash '+remote_path+' '+args    
    print script
    func.exec_command(host,ssh_port,user,password,rsa_file,script,logger)
    
#web错误日志信息   
def web_error_log(host,ssh_port,user,password,rsa_file,web_name,send_mail_to_list,log_error_path,web_id,tags,web_port,send_mail):
    now = datetime.datetime.now()
    create_time = now.strftime("%Y-%m-%d %H:%M:%S")
    curTime = now.strftime("%Y%m%d%H%M%S")
    #执行错误日志    
    script='test -e '+log_error_path+' && wc -c < '+log_error_path
    file_size=func.exec_command(host,ssh_port,user,password,rsa_file,script,logger)
    print "file_size:"+file_size
    if  file_size !='' and int(file_size)>2:
            logger.info(host+":log_error_path:"+file_size)
            script='cp -a ' +log_error_path + ' '+log_error_path+curTime+'.bak'
            func.exec_command(host,ssh_port,user,password,rsa_file,script,logger)
            #错误日志下载到本地/tmp
            local_error_web_name=host+'_'+web_name+'_error'+curTime+'.log'
            remote_path=log_error_path
            local_path='/tmp/'+local_error_web_name
            func.sftp_get(host,ssh_port,user,password,rsa_file,local_path,remote_path)
            ##清空web日志#
            script='cat /dev/null > ' +log_error_path
            func.exec_command(host,ssh_port,user,password,rsa_file,script,logger)
            #附件为json格式存储
            attach_list=[]
            attach_list.append(local_error_web_name)
            attach_list_json=json.dumps(attach_list)
            #添加到告警表
            msg='系统检测到web服务器错误日志,请查收附件。千里之堤，溃于蚁穴，服务器稳定性需要靠大家共同努力!'
            func.add_alarm(web_id,tags,host,web_port,create_time,'web','web_error_log',1,'critical',msg,send_mail,send_mail_to_list,0,'',attach_list_json)
    
                
    else:
        logger.error(host+'日志路径'+log_error_path+'不存在或者文件大小为空')
#远程分析进程异常
def web_process_status(host,ssh_port,user,password,rsa_file,web_name,alarm_process_mem,send_mail_to_list,send_mail,send_sms,send_sms_to_list,web_id,tags,web_port):
    now = datetime.datetime.now()
    create_time = now.strftime("%Y-%m-%d %H:%M:%S")
    script=''
    script='pidof '+ str(web_name)    
    pids_obj=func.exec_command(host,ssh_port,user,password,rsa_file,str(script),logger)
    pids=pids_obj.split() 
    remark=''
    mem_MB=0
    cur_mem=0
    cur_warn_mem=0
    if len(pids) >0:
        attach_list=[]        
        for pid in pids:            
            script="cat /proc/"+pid+"/status |grep VmRSS |awk '{print $2}'"            
            cur_mem=func.exec_command(host,ssh_port,user,password,rsa_file,str(script),logger)            
            if cur_mem !='':                
                mem_MB=int(cur_mem)/1024 
                #当前web进程内存值大于警告值，并且警告值大于0时,获取进程调用的文件、kill该进程、发送email
                if mem_MB >= int(alarm_process_mem) and int(alarm_process_mem) > 0:
                    #print "mem_MB:"+str(mem_MB)+" alarm_process_mem:"+str(alarm_process_mem)
                    cur_warn_mem=mem_MB
                    attach_file=pid+'.txt'
                    #获得进程文件
                    #script="strace -tt -f -s 2048 -e trace=file -p "+pid +" -o /tmp/"+attach_file                
                    #Process(target=func.exec_command,args=(host,ssh_port,user,rsa_file,str(script),logger)).start()

                    #收集进程文件60秒后，kill掉进程
                    #time.sleep(60)
                    #script="kill -9 `ps -ef |grep "+pid+"|grep -Ev grep |awk '{print $2}'`"                    
                    #Process(target=func.exec_command,args=(host,ssh_port,user,rsa_file,str(script),logger)).start()

                    #进程下载到本地/tmp
                    #local_path='/tmp/'+attach_file
                    #remote_path='/tmp/'+attach_file
                    #func.sftp_get(host,ssh_port,user,rsa_file,local_path,remote_path)
                    #attach_list.append(attach_file)
                    remark=remark+str(pid)+','
        #if remark !='' and len(attach_list)>0 and cur_warn_mem>0:   
        if remark !=''  and cur_warn_mem>0:
            #remark='检测'+str(web_name)+'进程大于阈值:'+str(alarm_process_mem)+'MB，监控系统自动结束该进程(kill '+ str(remark)+'),并捕获该进程所调用哪些文件,缩小问题范围,请查收附件'
            remark='检测'+str(web_name)+'进程大于阈值:'+str(alarm_process_mem)+'MB，捕获该进程所调用哪些文件,缩小问题范围,请查收附件'
            #attach_list_json=json.dumps(attach_list)            
            #添加到告警表
            #func.add_alarm(web_id,tags,host,web_port,create_time,'web','web_process_mem',cur_warn_mem,'critical',remark,send_mail,send_mail_to_list,send_sms,send_sms_to_list,attach_list_json)
            func.add_alarm(web_id,tags,host,web_port,create_time,'web','web_process_mem',cur_warn_mem,'critical',remark,send_mail,send_mail_to_list,send_sms,send_sms_to_list)
    else:
        pass
    

def main():
    func.mysql_exec("insert into web_status_history SELECT *,LEFT(REPLACE(REPLACE(REPLACE(create_time,'-',''),' ',''),':',''),12) from web_status",'')
    func.mysql_exec('delete from web_status where is_alarm=0;','')
    logger.info("check web controller started.")
    cur_dir=os.getcwd()
    rsa_dir=cur_dir+'/rsa'
    os.system("mkdir -p "+rsa_dir)
    sql="""SELECT 
    db_servers_web.id,    
    db_servers_os.host,
    db_servers_os.port as ssh_port,
    db_servers_os.user,    
    db_servers_os.rsa,
    frequency_monitor, 
    domain,
    web_access_path, 
    web_access_name, 
    web_log_rules,
    log_extend_name,
    web_name,
    db_servers_web.web_port,
    alarm_process_mem,
    alarm_process,
    db_servers_web.send_mail,
    db_servers_web.send_mail_to_list,
    db_servers_web.web_error_path,
    db_servers_web.web_error_name,
    db_servers_web.web_error_log_rules,
    db_servers_web.log_error_extend_name,
    db_servers_web.tags,
    db_servers_web.send_sms,
    db_servers_web.send_sms_to_list,
    db_servers_os.password
    FROM db_servers_web LEFT JOIN db_servers_os 
    ON db_servers_web.os_id = db_servers_os.id
    WHERE db_servers_web.is_delete=0 and db_servers_web.monitor=1 
    ORDER BY db_servers_web.id asc"""
    servers = func.mysql_query(sql)
    if servers:
        plist = []
        for row in servers:
            web_id=row[0]
            host=row[1]
            ssh_port=row[2]
            user=row[3]
            rsa=row[4]
            frequency_monitor=row[5]
            domain=row[6]
            web_access_path=row[7]
            web_access_name=row[8]
            web_log_rules=row[9]
            log_extend_name=row[10]
            web_name=row[11]
            web_port=row[12]
            alarm_process_mem=row[13]
            alarm_process=row[14]
            send_mail=row[15]
            send_mail_to_list=row[16]
            web_error_path=row[17]
            web_error_name=row[18]
            web_error_log_rules=row[19]
            log_error_extend_name=row[20]
            tags=row[21]
            send_sms=row[22]
            send_sms_to_list=row[23]
            password=row[24]
            web_log_rules=time.strftime(web_log_rules,time.localtime(time.time()))
            log_path=web_access_path+'/'+web_access_name+web_log_rules+log_extend_name 
            web_error_log_rules=time.strftime(web_error_log_rules,time.localtime(time.time()))
            log_error_path=web_error_path+'/'+web_error_name+web_error_log_rules+log_error_extend_name 
            if (rsa =="" or rsa is None )  and (password =="" or password is None):
                continue
            elif(rsa !="" or rsa is not None ):
                rsa_file=str(rsa_dir)+'/'+str(host)+'.rsa'
                os.system("touch "+rsa_file)
                f=open(rsa_file,'w')
                f.write(rsa)
                f.close()
                os.system("chmod 400 "+ rsa_file)
            web_name = func.get_config('web_name',str(web_name))
            ##日志收集
            Process(target = web_log, args = (host,ssh_port,user,password,rsa_file,log_path,web_id,dbhost,dbport,dbuser,dbpasswd,dbname,frequency_monitor,web_name)).start()
            #web连接状态检测
            Process(target = web_status, args = (host,ssh_port,user,password,rsa_file,web_id,dbhost,dbport,dbuser,dbpasswd,dbname,web_name,web_port)).start()
            if send_mail_to_list:
                mail_to_list=send_mail_to_list.split(';')
            else:
                send_mail=0
            
            if send_mail==1:
                #分析远程进程异常
                print '分析远程进程异常'
                Process(target=web_process_status,args=(host,ssh_port,user,password,rsa_file,web_name,alarm_process_mem,send_mail_to_list,send_mail,send_sms,send_sms_to_list,web_id,tags,web_port)).start()
                #获取远程web错误日志
                print '获取远程web错误日志'
                Process(target=web_error_log,args=(host,ssh_port,user,password,rsa_file,web_name,send_mail_to_list,log_error_path,web_id,tags,web_port,send_mail)).start()

    else:
        logger.warning("check web: not found any servers")
        
                
    
if __name__=='__main__':
     main()