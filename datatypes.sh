#!/bin/bash
#Everything in Shell Scripting is considered as String
Num1=100
Num2=200
Num3="DevOps"
Sum=$(($Num1+$Num2+$Num3))
#The result shows 300 because in shell script there are no data types and here the string is taken as 0
echo "The Sum is:$Sum"