#!/bin/bash

echo "enter the number"
read number

if [ $number -lt 10 ]; then
    echo " the given number $number is less than 10"
elif [ $number -eq 10 ]; then
    echo "the given number $number is equal to 10"
else
    echo "the number $number is  grater than 10"
fi 