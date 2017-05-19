#!/bin/bash

echo "650751" | sudo -S cp /etc/apt/sources.list /etc/apt/sources.list_backup
sudo mkdir -p /home/blue
cd /home/blue
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse" > sources.list
sudo mv ./sources.list /etc/apt/
sudo apt update
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales
sudo apt install -y python-pip
sudo apt install -y git
sudo pip install scrapy
sudo pip install scrapy-redis
sudo mkdir -p /web/python
sudo chmod -R 755 /web/python
cd /web/python
git clone https://github.com/Chanran/distributedCrawling.git

