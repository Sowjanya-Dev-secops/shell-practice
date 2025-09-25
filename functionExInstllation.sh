#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo -e "$G ERROR:: $N proced with root user previlage"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then 
        echo -e "Error:: $2 installation is failled"
        exit 1
    else 
        echo -e "$2 installation is suuccessful"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? "mysql"
else
    echo -e "mysql is already exist ... $Y skipp $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "nginx"
else
    echo -e "nginx is already exist ... $Y skipp $N"
fi
