#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"s

user=$(id -u)
log_folder="/var/log/shell-script"
mkdir -p $log_folder

script_name=$( echo $0 | cut -d "." -f1 )
log_file1="$log_folder/$script_name.log"

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

for Instance in $@
do
    dnf list installed $Instance &>>$log_file1
    if [ $? -ne 0 ]; then
        dnf install $Instance -y &>>$log_file1
        VALIDATE $? "$Instance"
    else
        echo -e "$Instance is already installed .. $Y Skipp$N"
    fi
done
