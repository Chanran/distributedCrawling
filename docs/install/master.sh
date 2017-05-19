#!/bin/bash

# 650751 is sudo user's password
echo "123456" | sudo -S cp /etc/apt/sources.list /etc/apt/sources.list_backup
sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ trusty main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ trusty-security main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse
##测试版源
deb https://mirrors.ustc.edu.cn/ubuntu/ trusty-proposed main restricted universe multiverse
# 源码
deb-src https://mirrors.ustc.edu.cn/ubuntu/ trusty main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ trusty-security main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ trusty-updates main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ trusty-backports main restricted universe multiverse" > sources.list
sudo mv ./sources.list /etc/apt/
sudo apt-get update
#export LC_ALL="en_US.UTF-8"
#export LC_CTYPE="en_US.UTF-8"
#sudo dpkg-reconfigure locales
sudo apt-get install -y python-pip
sudo apt-get install -y git
sudo apt-get install -y python-lxml
sudo apt-get install -y python-twisted-web
sudo pip install -i https://mirrors.ustc.edu.cn/pypi/web/simple scrapy
sudo pip install -i https://mirrors.ustc.edu.cn/pypi/web/simple scrapy-redis
sudo mkdir -p /web/python
sudo chown -R blue:blue /web/python
sudo chmod -R 755 /web/python
cd /web/python
git clone https://github.com/Chanran/distributedCrawling.git

