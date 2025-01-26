#!/bin/env python
#-*-coding:utf-8-*-

import string
import sys
import os
reload(sys) 
sys.setdefaultencoding('utf8')
import ConfigParser
import json
import smtplib
from email.mime.text import MIMEText
from email.message import Message
from email.header import Header
from email.mime.application import MIMEApplication
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
from email.utils import COMMASPACE,formatdate
import functions as func


mail_host = func.get_option('smtp_host')
mail_port = int(func.get_option('smtp_port'))
mail_user = func.get_option('smtp_user')
mail_pass = func.get_option('smtp_pass')
mail_send_from = func.get_option('mailfrom')


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
        attach_obj=json.loads(attach_file)
        for file in attach_obj:
            part = MIMEText(open('/tmp/'+str(file),'rb').read(),'base64','utf-8')  
            part["Content-Type"]='application/octet-stream'
            part['Content-Disposition']= 'attachment; filename='+file
            msg.attach(part)
            #os.system('chmod 755 /tmp/*.log && rm -rf /tmp/'+str(file))
        
    try:
        smtp = smtplib.SMTP_SSL(mail_host,mail_port)
        smtp.set_debuglevel(1)
        smtp.login(mail_user,mail_pass)
        smtp.sendmail(me,to_list, msg.as_string())
        smtp.close()
        
        return True
    except Exception, e:
        print str(e)
        return False
