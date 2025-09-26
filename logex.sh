#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

Logs_folder="/var/log/shell-script"
mkdir -p $Logs_folder
Script_Name=$( echo $0 | cut -d "." -f1 )
Log_File="$Logs_folder/$Script_Name.log"

echo "script execution started at: $(date)"
user=$(id -u)

if [ $user -ne 0 ]; then
    echo -e "$R ERROR:: $N procedd with root user previlage"
    exit 1
fi

validate(){
    if [ $? -ne 0 ];then
        echo -e "$R Error:: $N Mysql installtion is failure"
        exit 1
    else
        echo  -e "$G Success:: $N the MySql inallation is successful"
    fi
}
dnf list installed mysql &>> $Log_File
if [ $? -ne 0 ]; then 
    dnf install mysql -y &>> $Log_File
    validate $? mysql
else
    echo - e "Installtion of mysql already completed ... $G SKIP"
fi