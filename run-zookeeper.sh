#!/bin/bash

# USAGE: run-zookeeper.sh [brokerid]

#server.xx=xx:2888:3888
#initLimit=5
#syncLimit=2

sed -i '/^server\..*/d' /etc/kafka/zookeeper.properties
echo "server.11=192.168.32.11:2888:3888" >> /etc/kafka/zookeeper.properties
echo "server.12=192.168.32.12:2888:3888" >> /etc/kafka/zookeeper.properties
echo "server.13=192.168.32.13:2888:3888" >> /etc/kafka/zookeeper.properties

sed -i '/^initLimit=/d' /etc/kafka/zookeeper.properties
echo "initLimit=5" >> /etc/kafka/zookeeper.properties
sed -i '/^syncLimit=/d' /etc/kafka/zookeeper.properties
echo "syncLimit=2" >> /etc/kafka/zookeeper.properties

mkdir -p /var/lib/zookeeper
echo $1 > /var/lib/zookeeper/myid

zookeeper-server-start -daemon /etc/kafka/zookeeper.properties
