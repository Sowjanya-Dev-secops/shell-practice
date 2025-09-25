#!/bin/bash
number=$1

if [ $(($number % 2)) -eq 0 ]; then
    echo "the $number is even"
else 
    echo "the $number is odd"
fi
