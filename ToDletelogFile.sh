#!/bin/bash
Source_dir="/home/ec2-user/expense"

if [ ! -d $SCRIPT_DIR ]; then
    echo "ERROR:: SCRIPT_DIR does not exist"
    exit 1
fi

file_to_del=$(find $Source_dir -name "*.log" type f -mtime +14)

while IFS= read -r file_path
do
    echo "deleting the $file_path"
    rm -rf $file_path
    echo "deleted the $file_path"
done <<< $file_to_del