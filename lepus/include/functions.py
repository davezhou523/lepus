#!/bin/env python
#-*-coding:utf-8-*-

import MySQLdb
import string
import time  
import datetime
import sys 
import paramiko
import json
import os
reload(sys) 
sys.setdefaultencoding('utf8')
import ConfigParser
import smtplib
from email.mime.text import MIMEText
from email.message import Message
from email.header import Header
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
from email.utils import COMMASPACE,formatdate

def get_item(data_dict,item):
    try:
       item_value = data_dict[item]
       return item_value
    except:
       return '-1'

def get_config(group,config_name):
    config = ConfigParser.ConfigParser()
    config.readfp(open('./etc/config.ini','rw'))
    config_value=config.get(group,config_name).strip(' ').strip('\'').strip('\"')
    return config_value

def filters(data):
    return data.strip(' ').strip('\n').strip('\br')

host = get_config('monitor_server','host')
port = get_config('monitor_server','port')
user = get_config('monitor_server','user')
passwd = get_config('monitor_server','passwd')
dbname = get_config('monitor_server','dbname')

def mysql_exec(sql,param=''):
    try:
        conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
        conn.select_db(dbname)
        curs = conn.cursor()
        if param <> '':
            curs.execute(sql,param)            
        else:
            curs.execute(sql)
        conn.commit()
        curs.close()
        
    except Exception,e:
        conn.rollback()
        print "mysql execute: " + str(e)
    conn.close()


def mysql_query(sql):
    conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
    conn.select_db(dbname)
    cursor = conn.cursor()
    count=cursor.execute(sql)
    if count == 0 :
        result=0
    else:
        result=cursor.fetchall()    
    cursor.close()
    conn.close()
    return result

def add_alarm(server_id,tags,db_host,db_port,create_time,db_type,alarm_item,alarm_value,level,message,send_mail,send_mail_to_list,send_sms,send_sms_to_list,attach=''):
   try: 
       conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
       conn.select_db(dbname)
       curs = conn.cursor()
       sql="insert into alarm(server_id,tags,host,port,create_time,db_type,alarm_item,alarm_value,level,message,send_mail,send_mail_to_list,send_sms,send_sms_to_list,attach) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);"
       
       param=(server_id,tags,db_host,db_port,create_time,db_type,alarm_item,alarm_value,level,message,send_mail,send_mail_to_list,send_sms,send_sms_to_list,attach)
       print sql,param
       curs.execute(sql,param)

       if send_mail == 1:
           temp_sql = "insert into alarm_temp(server_id,ip,db_type,alarm_item,alarm_type) values(%s,%s,%s,%s,%s);"
           temp_param = (server_id,db_host,db_type,alarm_item,'mail')
           curs.execute(temp_sql,temp_param)
       if send_sms == 1:
           temp_sql = "insert into alarm_temp(server_id,ip,db_type,alarm_item,alarm_type) values(%s,%s,%s,%s,%s);"
           temp_param = (server_id,db_host,db_type,alarm_item,'sms')
           curs.execute(temp_sql,temp_param)
       if (send_mail ==0 and send_sms==0):
           temp_sql = "insert into alarm_temp(server_id,ip,db_type,alarm_item,alarm_type) values(%s,%s,%s,%s,%s);"
           temp_param = (server_id,db_host,db_type,alarm_item,'none')
           curs.execute(temp_sql,temp_param)
       conn.commit()
       curs.close()
       conn.close()
   except Exception,e:
       print "Add alarm: " + str(e)     


def check_if_ok(server_id,tags,db_host,db_port,create_time,db_type,alarm_item,alarm_value,message,send_mail,send_mail_to_list,send_sms,send_sms_to_list):
    conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
    conn.select_db(dbname)
    curs = conn.cursor()
    if db_type=='os':
        alarm_count=curs.execute("select id from alarm_temp where ip='%s' and alarm_item='%s' ;" %(db_host,alarm_item))
        mysql_exec("delete from alarm_temp where ip='%s'  and alarm_item='%s' ;" %(db_host,alarm_item),'')
    else:
        alarm_count=curs.execute("select id from alarm_temp where server_id=%s and db_type='%s' and alarm_item='%s' ;" %(server_id,db_type,alarm_item))                    
        mysql_exec("delete from alarm_temp where server_id=%s and db_type='%s' and alarm_item='%s' ;" %(server_id,db_type,alarm_item),'')

    if int(alarm_count) > 0 :
        sql="insert into alarm(server_id,tags,host,port,create_time,db_type,alarm_item,alarm_value,level,message,send_mail,send_mail_to_list,send_sms,send_sms_to_list) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);"
        param=(server_id,tags,db_host,db_port,create_time,db_type,alarm_item,alarm_value,'ok',message,send_mail,send_mail_to_list,send_sms,send_sms_to_list)
        mysql_exec(sql,param)

    curs.close()
    conn.close()
    
    
def update_send_mail_status(server,db_type,alarm_item,send_mail,send_mail_max_count):
    conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
    conn.select_db(dbname)
    curs = conn.cursor()
    if db_type == "os":
        alarm_count=curs.execute("select id from alarm_temp where ip='%s' and db_type='%s' and alarm_item='%s' and alarm_type='mail' ;" %(server,db_type,alarm_item))
    else:
        alarm_count=curs.execute("select id from alarm_temp where server_id=%s and db_type='%s' and alarm_item='%s' and alarm_type='mail' ;" %(server,db_type,alarm_item)) 
    if int(alarm_count) >= int(send_mail_max_count) :
        send_mail = 0
    else:
        send_mail = send_mail
    return send_mail
    curs.close()
    conn.close()

def update_send_sms_status(server,db_type,alarm_item,send_sms,send_sms_max_count):
    conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
    conn.select_db(dbname)
    curs = conn.cursor()
    if db_type == "os":
        alarm_count=curs.execute("select id from alarm_temp where ip='%s' and db_type='%s' and alarm_item='%s' and alarm_type='sms' ;" %(server,db_type,alarm_item))
    else:
        alarm_count=curs.execute("select id from alarm_temp where server_id=%s and db_type='%s' and alarm_item='%s' and alarm_type='sms' ;" %(server,db_type,alarm_item))

    if int(alarm_count) >= int(send_sms_max_count) :
        send_sms = 0
    else:
        send_sms = send_sms
    return send_sms
    curs.close()
    conn.close()
    
    
def check_db_status(server_id,db_host,db_port,tags,db_type):
    try:
        conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
        conn.select_db(dbname)
        curs = conn.cursor()
        sql="select id from db_status where host=+'"+db_host+"'  and port='"+db_port+"' "
        count=curs.execute(sql) 
        if count ==0:
             if db_type=='mysql':
                sort=1
             elif db_type=='oracle':
                sort=2
             elif db_type=='mongodb':            
                sort=3
             elif db_type=='redis':
                sort=4
             else:
                sort=0

             sql="insert into db_status(server_id,host,port,tags,db_type,db_type_sort) values(%s,%s,%s,%s,%s,%s);"
             param=(server_id,db_host,db_port,tags,db_type,sort)
             curs.execute(sql,param)
             conn.commit()
             
    except Exception,e:
        print "Check db status table: " + str(e) 
    finally:
        curs.close()
        conn.close()          
        

def update_db_status_init(role,version,db_host,db_port,tags):
    try:
        conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
        conn.select_db(dbname)
        curs = conn.cursor()
        curs.execute("update db_status set role='%s',version='%s',tags='%s' where host='%s' and port='%s';" %(role,version,tags,db_host,db_port))
        conn.commit()
    except Exception, e:
        print "update db status init: " + str(e)
    finally:
      curs.close()
      conn.close()


def update_db_status(field,value,db_host,db_port,alarm_time,alarm_item,alarm_value,alarm_level):
    try:
        field_tips=field+'_tips'
        if value==-1:
            value_tips='no data'
        else:
            value_tips="""
                          item: %s\n<br/>
                         value: %s\n<br/> 
                          level: %s\n<br/>
                          time: %s\n<br/> 
                    """ %(alarm_item,alarm_value,alarm_level,alarm_time)

        conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
        conn.select_db(dbname)
        curs = conn.cursor()
        if db_port:
            curs.execute("update db_status set %s='%s',%s='%s' where host='%s' and port='%s';" %(field,value,field_tips,value_tips,db_host,db_port))
        else:
            curs.execute("update db_status set %s='%s',%s='%s' where host='%s';" %(field,value,field_tips,value_tips,db_host))
        conn.commit()
    except Exception, e:
        print "update db status: " + str(e)
    finally:
      curs.close()
      conn.close()
def update_web_status(id):
    #sql="delete from  web_status  where id ="+str(id)
    sql="update   web_status set is_alarm=0   where id ="+str(id)
    mysql_exec(sql,'')


def update_check_time():
    try:
        conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
        conn.select_db(dbname)
        curs = conn.cursor()
        localtime = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())
        curs.execute("update lepus_status set lepus_value='%s'  where lepus_variables='lepus_checktime';" %(localtime))
        conn.commit()
    except Exception, e:
        print "update check time: " + str(e)
    finally:
      curs.close()
      conn.close()



def get_option(key):
    conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
    conn.select_db(dbname)
    cursor = conn.cursor()
    sql="select value from options where name=+'"+key+"'"
    count=cursor.execute(sql)
    if count == 0 :
        result=0
    else:
        result=cursor.fetchone()
    return result[0]
    cursor.close()
    conn.close()


def flush_hosts():
    conn=MySQLdb.connect(host=host,user=user,passwd=passwd,port=int(port),connect_timeout=5,charset='utf8')
    conn.select_db(dbname)
    cursor = conn.cursor()
    cursor.execute('flush hosts;');

def get_mysql_status(cursor):
    data=cursor.execute('show global status;');
    data_list=cursor.fetchall()
    data_dict={}
    for item in data_list:
        data_dict[item[0]] = item[1]
    return data_dict

def get_mysql_variables(cursor):
    data=cursor.execute('show global variables;');
    data_list=cursor.fetchall()
    data_dict={}
    for item in data_list:
        data_dict[item[0]] = item[1]
    return data_dict

def get_mysql_version(cursor):
    cursor.execute('select version();');
    return cursor.fetchone()[0]



#上传脚本到服务器
def sftp_upload(host,port,user,password,rsa,local_path,remote_path,logger=''):
    #logger.info('准备RSA方式连接'+host)
    #key=paramiko.RSAKey.from_private_key_file(rsa)
    print host,port,user,password,rsa,local_path,remote_path
    transport=paramiko.Transport((host,int(port)))    
    #transport.connect(user=user,pkey=key)
    transport.connect(username=user,password=password)
    print transport
    sftp=paramiko.SFTPClient.from_transport(transport)
    logger.info('连接'+host+'成功')
    logger.info('准备推送脚本'+local_path+'到'+host+'服务器下'+remote_path)  
    sftp.put(local_path,remote_path)
    sftp.close()
    transport.close()
    logger.info('推送脚本成功')
#下载脚本到服务器  
def sftp_get(host,port,user,password,rsa,local_path,remote_path):
    #key=paramiko.RSAKey.from_private_key_file(rsa)
    transport=paramiko.Transport((host,int(port)))
    #transport.connect(user=user,pkey=key)
    transport.connect(username=user,password=password)
    sftp=paramiko.SFTPClient.from_transport(transport)
    sftp.get(remote_path,local_path)
    sftp.close()
    transport.close()    
#执行远程服务器脚本        
def exec_command(host,port,user,password,rsa,script,logger=''):
    #key=paramiko.RSAKey.from_private_key_file(rsa)
    s=paramiko.SSHClient()
    s.load_system_host_keys()
    s.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    #s.connect(host,int(port),user,pkey=key)
    s.connect(host,port=port,username=user,password=password,timeout=180)
    logger.info('远程执行 '+host+'服务器脚本:'+script)            
    stdin,stdout,stderr=s.exec_command(script)    
    logger.info('远程执行 '+host+'服务器脚本:'+script+'完毕')
    r=stdout.read()
    s.close()
    return r


##################################### mail ##############################################
mail_host = get_option('smtp_host')
mail_port = int(get_option('smtp_port'))
mail_user = get_option('smtp_user')
mail_pass = get_option('smtp_pass')
mail_send_from = get_option('mailfrom')
def send_mail(to_list,sub,content,attach_file=''):
    '''
    to_list:发给谁
    sub:主题
    content:内容
    send_mail("aaa@126.com","sub","content")
    '''
    #me=mail_user+"<</span>"+mail_user+"@"+mail_postfix+">"
    me=mail_send_from
    #msg = MIMEText(content, _subtype='html', _charset='utf-8')
    msg=MIMEMultipart()
    msg['Subject'] = Header(sub,'utf-8')
    msg['From'] = Header(me,'utf-8')
    msg['To'] = ";".join(to_list)
    print msg['To']
    msg['Date']=formatdate(localtime=True)
    msg.attach(MIMEText(content,_subtype='html', _charset='utf-8'))
     
    if len(attach_file) >0:
        for file in attach_file:
            print file            
            part = MIMEText(open('/tmp/'+str(file),'rb').read(),'base64','utf-8')  
            part["Content-Type"]='application/octet-stream'
            part['Content-Disposition']= 'attachment; filename='+file
            msg.attach(part)
            
        
    try:        
        smtp = smtplib.SMTP_SSL(mail_host,mail_port)
        smtp.set_debuglevel(1)       
        smtp.ehlo("smtp.163.com")
        smtp.login(mail_user,mail_pass)
        smtp.sendmail(me,to_list, msg.as_string())
        smtp.close()
        return True
    except Exception, e:
        print str(e)
        return False
