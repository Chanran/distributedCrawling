#!/bin/bash

# apt source list
echo "123546" | sudo -S cp /etc/apt/sources.list /etc/apt/sources.list_backup
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
#export LC_ALL="en_US.UT

# apt package
sudo apt-get update
sudo apt-get install -y git

# locale
#export LC_ALL="en_US.UTF-8"
#export LC_CTYPE="en_US.UTF-8"
#sudo dpkg-reconfigure locales

# redis
cd /tmp
wget http://download.redis.io/releases/redis-3.2.9.tar.gz
tar xzf redis-3.2.9.tar.gz
cd redis-3.2.9
sudo make
src/redis-server redis.conf
