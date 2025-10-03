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

files=(find $Source_dir -name "*.log" -type f -mtime +14) 

if [  ! -z "${files}" ]; then 
    echo "files found"
    Time_stamp=$(date +%F%H&M)
    echo "Time_stamp"
else
    echo "files not found to archieve"
    exit 1
fi
