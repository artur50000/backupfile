#!/bin/bash
sshpass -p "1" ssh root@172.31.36.141 find /home/ubuntu/ -name "*.txt" -mtime +7 -delete
a=0
sshpass -p "1" ssh root@172.31.36.141 [ -f "/home/ubuntu/textRandom.txt" ] && a=1
if [ $a -eq 1 ]
then
echo 'file exists!'
else
touch /home/ubuntu/textRandom.txt
echo 'file created' > /home/ubuntu/textRandom.txt
date >> /home/ubuntu/textRandom.txt
echo 'file created'  
sshpass -p "1" rsync -avz /home/ubuntu/textRandom.txt  root@172.31.36.141:/home/ubuntu
echo 'file has been transfered' 
rm /home/ubuntu/textRandom.txt 
fi


