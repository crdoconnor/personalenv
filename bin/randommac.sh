#!/bin/bash
PREVMAC=$(ifconfig | grep ether | awk '{print $2}')
nmcli r wifi off
echo Previous MAC : $PREVMAC
CODE1=$(printf '%x' $(( ( RANDOM % 256 ) )))
CODE2=$(printf '%x' $(( ( RANDOM % 256 ) )))
CODE3=$(printf '%x' $(( ( RANDOM % 256 ) )))
CODE4=$(printf '%x' $(( ( RANDOM % 256 ) )))
CODE5=$(printf '%x' $(( ( RANDOM % 256 ) )))
CODE6=$(printf '%x' $(( ( RANDOM % 256 ) )))
NEWMAC=$CODE1:$CODE2:$CODE3:$CODE4:$CODE5:$CODE6
echo $1
#sudo /etc/init.d/networking stop
sleep 1
sudo ifconfig wlp58s0 hw ether $NEWMAC
#/etc/init.d/networking start
nmcli r wifi on
CALCNEWMAC=$(ifconfig | grep ether | awk '{print $2}')
echo New MAC : $CALCNEWMAC
