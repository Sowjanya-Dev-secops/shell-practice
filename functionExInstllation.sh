#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "ERROR:: proced with root user previlage"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then 
        echo "Error:: $2 installation is failled"
        exit 1
    else 
        echo "$2 installation is suuccessful"
    fi
}
dnf install mysql -y
validate $? "mysql"