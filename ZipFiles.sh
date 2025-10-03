#!/bin/bash
Source_dir=$1
Destinaton_dir=$2

if [ $# -le 2 ]; then
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

_dir=var/log/
    