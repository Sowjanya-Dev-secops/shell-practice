#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

user=$(id -u)

if [ $user -ne 0 ]; then
    echo -e "$R Error:: $N Please proceed with root user "
    exit 1
fi
VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$R Error:: $N $2 Installation failure"
        exit 1
    else
        echo -e "$G Success:: $N $2 installation is successful" 
    fi
}
dnf list installed mysql

if [ $? -ne 0 ]; then
    dnf instlled mysql -y
    validate $? "mysql"
else
    echo -e "mysql is already installed .. $Y SKipp$N"
fi