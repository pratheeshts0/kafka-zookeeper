FROM ubuntu:14.04

MAINTAINER pratheesh


run apt-get update
run apt-get upgrade -y
run apt-get install -y  software-properties-common
run add-apt-repository ppa:openjdk-r/ppa -y
run  apt-get update -y
run apt-get install openjdk-8-jdk -y


workdir /opt
run apt-get install wget -y
run apt-get install nano -y
run wget http://mirror.nus.edu.sg/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
run tar -xzf zookeeper-3.4.6.tar.gz
add zoo.cfg  /opt/zookeeper-3.4.6/conf/


workdir /var/lib/zookeeper/data/
run echo "2" > /var/lib/zookeeper/data/myid
expose 2181


entrypoint /opt/zookeeper-3.4.6/bin/zkServer.sh start && bash



