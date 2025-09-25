#!/bin/bash
 todaydate1=$(date)
 echo  "$todaydate1"

 start_time=$(date +%s)
 echo "$start_time"
 sleep 10
 end_time=$(date +%s)
 echo "$end_time"
 process_time=$(($end_time-$start_time))
 echo "time taken to compleat process is : $process_time"