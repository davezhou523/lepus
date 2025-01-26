#!/bin/env python
#-*-coding:utf-8-*-
import os
import sys
import time
import string
import urllib
import urllib2
reload(sys) 
sys.setdefaultencoding('utf8')
import ConfigParser


def send_sms(sms_to_list,sms_msg,db_type,application,host,port,level,alarm_item,alarm_value,message):
    '''
    sms_to_list:发给谁
    sms_msg:短信内容
    sms_msg='['+level+'] '+db_type+'-'+tags+'-'+server+' '+message+' Time:'+create_time.strftime('%Y-%m-%d %H:%M:%S')
    '''
    '''
    sms_to_list_comma:多个短信接收者，用逗号拼接
    sms_to_list_semicolon:多个短信接收者，用分号拼接
    '''
    sms_to_list_comma = ",".join(sms_to_list)
    sms_to_list_semicolon = ";".join(sms_to_list)
    try:
        ######### you send sms code here ##############
        
        ###############################################
        URL = 'http://121.199.16.178/webservice/sms.php?method=Submit&account=cf_fuka&password=fuka123'
        mobile_list=sms_to_list_semicolon.split(';')
        for mobile_line in mobile_list:        
            content = '服务器预警:[%s] %s' % (time.strftime('%Y%m%d %H:%M:%S'),sms_msg)+',请及时关注!'
            data = {'mobile':mobile_line,'content':content}
            body = urllib.urlencode(data)
            request = urllib2.Request(URL,body)
            urldata = urllib2.urlopen(request)
            print urldata.read()       
            return True
    except Exception, e:
        print str(e)
        return False
