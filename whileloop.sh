#!/bin/bash

count=5

while [ $count -gt 0 ]
do
    echo "time left : $count"
    count=$(( count - 1 ))
done
