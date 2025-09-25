#!/bin/bash

userid=$(id -u)
if [ $userid -ne 0 ]; then
    echo "ERROR:: please proceed with root user privilage"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo"ERROR:: installation failed"
else
    echo"installing MySql is Success"
fi