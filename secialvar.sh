#!/bin/bash
 echo "all variables passed to the script is :$@"
 echo "all variables passed to the script is :$*"

 echo "script name is :$0"
 echo "current directory name is :$PWD"
 echo "who is running the script name is :$USER"
 echo "home directory of the user:$HOME"
 echo "processID of the script :$$"
 sleep 10 &
 echo "process id of the back ground script :$!"
