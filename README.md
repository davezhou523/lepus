Lepus系统监控OS性能、MySql、Oracle、MongoDB、Redis
需要开发环境：
centos7+php5.6+mysql5.6+apache+python2.7

二次开发新增:
1、WEB进程数、进程内存监控、TCP连接数监控、PV、UV、IP值统计、web错误日志及时提醒
2、升级操作系统配置界面、WEB配置界面,使用ztree树显示服务器节点、flexigrid表格显示服务器节点信息;后续全面替换

示例配置：
监控WEB服务器IP:192.168.3.59
监控DB服务器IP:192.168.3.60
脚本存放在目录:/data/www/
客户端IP：192.168.3.15
一、后台python配置
yum install -y  python-devel MySQL-python python-paramiko mysql python2-pip
pip install redis
pip install redis-py-cluster
pip install cx_oracle pymongo pymssql

配置数据库IP、用户、密码路径:cd /data/www/lepus/lepus/etc
1、cd /data/www/lepus/lepus
vim lepus
修改目录路径：basedir="/data/www/lepus/lepus" 
2、启动
./lepus start

二、前端WEB配置
cd /data/www/lepus/web/application/config
配置config.php文件下 $config['base_url']     = 'http://xxxx/;
配置database.php下连接db信息

备注：
登陆用户admin 密码123abc
修改密码sql:
UPDATE admin_user SET `password`=MD5('123ab') WHERE username='admin';

升级用户更新sql,只执行sql/update_web.sql
全新用户更新sql顺序:sql/lepus_table.sql, lepus_data.sql , update_web.sql

三、获得web服务器客户SSH秘钥
由于获取web服务器访问日志、pv、uv信息，所以需要ssh密钥登陆
在客户端192.168.3.15
用ssh-keygen 的-f和-P参数，生成密钥不需要交互
ssh-keygen -t rsa -f ~/.ssh/id_rsa -P ''
cp ~/.ssh/id_rsa.pub   ~/.ssh/authorized_keys
复制id_rsa内容界面：配置中心->操作系统->新增或修改对应主机下RSA框里

四、配置web日志、PV、IP、UV
1、安装日志分隔工具：yum install -y cronolog

2、apache日志格式：

添加UV值
vim httpd.conf
启用mod_usertrack模块
LoadModule usertrack_module libexec/mod_usertrack.so
<IfModule usertrack_module>
CookieExpires “1 weeks”
CookieStyle cookie
CookieName your_cookie_name
CookieTracking on
</IfModule>

访问日志中记录真实的客户 IP 地址
SetEnvIf X-Forwarded-For "^.*\..*\..*\..*" forwarded
在日志LogFormat最后增加%{cookie}n字段
LogFormat "%{X-Forwarded-For}i %{cookie}n %{%Y-%m-%d %H:%m:%S}t %r %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" common
X-Forwarded-For 客户端IP
cookie 是指UV值 
%Y-%m-%d %H:%m:%S 访问日期时间
%r 请求的行对应格式为”%m %U%q %H”，即”请求方法/访问路径/协议”
注意：日志格式顺序与参数不要变动，否则你需要更改/data/www/lepus/lepus/check_web_log.sh 脚本文件；
当然还得修改check_web_log.sh脚本排除web访问的非动态URL，如css、image、upfile目录

配置web访问日志格式：

CustomLog "|/usr/sbin/cronolog /data/server/httpd/logs/xx.com-access_%Y%m%d.log" common env=forwarded
xx.com-access_%Y%m%d.log按天分隔%Y%m%d,对应界面:配置中心->操作系统->新增或修改对应“访问日志规则”

3、nginx 日志格式配置
nginx 添加uv
http {
     log_format  main  '$http_x_forwarded_for $uid $http_x_cookie $time_iso8601 $request $remote_addr - $remote_user [$time_local] "$request" $st
atus $body_bytes_sent "$http_referer" "$http_user_agent" "$http_x_forwarded_for"';
}

server {
        set $uid "-";
        if ( $http_cookie ~* "uid=(\S+)(;.*|$)")
        {
                set $uid $1;
        }
}
注意：日志格式顺序与参数不要变动，否则你需要更改/data/www/lepus/lepus/check_nginx_web_log.sh  脚本文件；

如需要帮助请加QQ:271416962
