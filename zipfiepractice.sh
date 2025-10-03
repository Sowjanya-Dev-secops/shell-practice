#!/bin/bash
source_dir=$1
Destination_dir=$2

user=$(id -u)

if [ $user -ne 0 ]; then
    echo "plase proceed with root preveliage"
    exit 1
fi
if [ $# -lt 2 ]; then
    echo "usage like:sh backup.sh <source_dir> <destination_dir>"
    exit 1
fi
if [ ! -d $source_dir ]; then
    echo "source $source_dir in not exit"
    exit 1
fi

if [ ! -d $Destination_dir ]; then
    echo "source $Destination_dir in not exit"
    exit 1
fi


log_file=$(find $source_dir -name "*.log" -type f -mtime +14)

if [ ! -z "${log_file}" ]; then
    echo "The log files found"
    timestamp=$( date +%F-%H-%M )
    zip_file="$Destination_dir/app-log-$timestamp.zip"
    find $source_dir -name "*.log" -type f -mtime +14 | zip -@ -j "$zip_file"

    if [ -f $zip_file ]; then
        echo "files archeival success"
        while IFS= read -r flies
        do
            echo "before deleted the files:$flies"
            rm -rm $files
            echo "after deleted the files:$flies"
        done <<< $log_file
    else
        echo "files archeival failed "
        exit 1
    fi

else
    echo "log files does not exist "
    exit 1
fi







