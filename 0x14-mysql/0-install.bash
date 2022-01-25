#!/usr/bin/env bash
# Installs MySQL server version 5.7.x
sudo apt-key add './mysql-5.7_signature.key'
sudo /bin/bash -c 'echo "deb http://repo.mysql.com/apt/ubuntu bionic mysql-5.7" >> /etc/apt/sources.list.d/mysql.list'
sudo apt-get update
sudo apt install -f mysql-client=5.7* mysql-community-server=5.7* mysql-server=5.7*
# password: ubuntu_user_pwd
