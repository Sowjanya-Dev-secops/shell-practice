#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo "ERROR:: please proceed with root user privilage"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo"ERROR:: installation failed"
    exit 1
else
    echo"installing MySql is Success"
fi