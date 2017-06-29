#!/bin/bash

# apt source list
echo "123456" | sudo -S cp /etc/apt/sources.list /etc/apt/sources.list_backup
sudo echo "deb http://cn.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
deb http://cn.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
deb http://cn.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse
deb http://cn.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
deb http://cn.archive.ubuntu.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb-src http://cn.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
deb-src http://cn.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
deb-src http://cn.archive.ubuntu.com/ubuntu/ xenial-updates main restricted universe multiverse
deb-src http://cn.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://cn.archive.ubuntu.com/ubuntu/ xenial-proposed main restricted universe multiverse
deb http://archive.canonical.com/ubuntu/ xenial partner
deb http://extras.ubuntu.com/ubuntu/ xenial main" > sources.list

sudo ufw allow 22

sudo mv ./sources.list /etc/apt/
sudo apt-get update --fix-missing
echo "export LC_ALL=C" >> ~/.bash_profile

sudo apt-get upgrade -y

sudo apt-get install openssh-server

sudo apt-get install -y python-pip

sudo apt-get install -y python-redis

sudo apt-get install -y git

sudo apt-get install -y python-lxml

sudo apt-get install -y python-twisted-web

sudo apt-get install -y libxml2-dev

sudo apt-get install -y libxslt1-dev

sudo apt-get install -y zlib1g-dev

sudo apt-get install -y libffi-dev

sudo apt-get install -y libssl-dev

sudo pip install -i https://mirrors.ustc.edu.cn/pypi/web/simple scrapy
sudo pip install -i https://mirrors.ustc.edu.cn/pypi/web/simple scrapy-redis
sudo pip install redis
sudo mkdir -p /web/python
sudo chmod -R 777 /web/python
cd /web/python
git clone https://github.com/Chanran/distributedCrawling.git

