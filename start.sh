#!/bin/bash
#Set the root password as root if not set as an ENV variable
export PASSWD=${PASSWD:=root}
#Set the root password
echo "root:$PASSWD" | chpasswd

echo "Starting client"

redis-server &
echo "Redis is ok"

rotctld &
echo "rotctld is ok"

echo "Starting poller"
satnogs-poller
echo "poller failed"
