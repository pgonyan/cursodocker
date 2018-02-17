#!/bin/bash


PASS=$(echo $PASSWORD | openssl passwd -1 -stdin)
useradd -m -s /bin/bash -p $PASS $USUARIO 
/etc/init.d/ssh start

while true; do sleep 1; done
