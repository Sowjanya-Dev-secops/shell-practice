#!/bin/bash
Source_dir=$1
Destinaton_dir=$2

if [ $# -lt 2 ]; then
    echo "sh backup.sh <source_file> <destination_file>"
    exit 1
fi

if [ ! -d $Source_dir ]; then 
    echo "source $Source_dir does not exist"
    exit 1
fi

if [ ! -d $Destinaton_dir ]; then 
    echo "source $Destinaton_dir does not exist"
    exit 1
fi

files=$(find $Source_dir -name "*.log" -type f -mtime +14) 


if [  ! -z "${files}" ]; then 
    echo "files found $file"
    Time_stamp=$(date +%F)
    echo "$Time_stamp"
    zip_filename="$Destinaton_dir/app-logs-$Time_stamp.zip"
    echo "zip file name : $zip_filename"
    find $Source_dir -name "*.log" -type f -mtime +14 | zip -@ -j  "$zip_filename"

    if [ -f $zip_filename ]; then
        echo " archieval success"
        
        while IFS= read -r filedel
        do 
            rm -rf $filedel

        done  <<<files

    else
        echo "archeval failure"
        exit 1
    fi


else
    echo "files not found to archieve"
    exit 1
fi
