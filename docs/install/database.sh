#!/bin/bash

# apt source list
echo "650751" | sudo -S cp /etc/apt/sources.list /etc/apt/sources.list_backup
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

sudo mv ./sources.list /etc/apt/
sudo apt-get update
echo "export LC_ALL=C" >> ~/.bash_profile

sudo apt-get upgrade -y

sudo apt-get install -y git

sudo apt-get install -y redis-server
sudo sed -i -e 's|bind 127.0.0.1|#bind 127.0.0.1|' /etc/redis/redis.conf
sudo service redis restart

sudo apt-get install -y mysql-server
