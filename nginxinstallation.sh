#!/bin/bash

user=$(id -u)
if [ $user -ne 0 ];then 
    echo "ERROR:: please proceed with roo user privelege"
    exit 1
fi
dnf install nginx -y

if [ $? -ne 0 ]; then 
    echo "Error:: Nginx installation is fail"
else
    echo "Nginx installation is success"
fi
