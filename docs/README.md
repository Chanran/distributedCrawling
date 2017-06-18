# 项目文档

## 安装指引

1. [下载ubuntu-14.04.5-server-amd64.iso ](http://releases.ubuntu.com/14.04/ubuntu-14.04.5-server-amd64.iso)
2. [使用virtualbox安装ubuntu-14.04.5-server-amd64.iso](http://www.linuxidc.com/Linux/2016-08/134583.htm)
    > 主机名命名为master,用户名命名为blue,密码命名为123456
3. 复制镜像
    > 在virtualbox面板上复制安装好的master为新主机(复制3台，命名分别为slave1,slave2,database)
    > 分别进入slave1,slave2,database
    > 修改/etc/hostname里的文字为slave1(哪台主机就命名成什么名字)
    > 修改/etc/hosts里的127.0.1.1为slave1(哪台主机就命名成什么名字)
    > 重启虚拟机

## 主机连接虚拟机
    1. 主机的/etc/hosts 里加上
    
    ```
    master的ip master
    database的ip database
    slave1的ip slave1
    slave2的ip slave2
    ```
    
    2. 连接master
    
    ```
    ssh blue@master
    ```
    
    3. master连接database、slave1、slave2
        1. 给master的hosts加上
            ```
            master的ip master
            database的ip database
            slave1的ip slave1
            slave2的ip slave2
            ```
        2. 在master生成ssh key然后复制到database、slave1、slave2，[参考](http://blog.csdn.net/leexide/article/details/17252369)
    
## 帮助
- [本机终端SSH连接VirtualBox中的Linux虚拟机](https://itbilu.com/linux/management/4Jy8JsAIM.html)
- [ssh登录失败:’Too many authentication failures for root’](http://bbs.iosre.com/t/ssh-too-many-authentication-failures-for-root/306)
- [实现scrapy-redis分布式网络爬虫例子](http://yanyan0108.blog.163.com/blog/static/173747928201591524728727/)