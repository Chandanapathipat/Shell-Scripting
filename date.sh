#!/bin/bash
#DATE=$(date)
#echo "Timestamp is : $DATE"

#Use this command for start time,end time and execution time and saved it in the log file.
#In this date command,for more options to display the time by using "date --help".

START_TIME=$(date +%s)
sleep 15
END_TIME=$(date +%s)
TOTAL_EXEC_TIME=($END_TIME - $START_TIME)
echo "Total Execution Time is: $TOTAL_EXEC_TIME"
