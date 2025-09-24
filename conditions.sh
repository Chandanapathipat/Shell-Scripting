#!/bin/bash
Num1=$1
if [ $Num1 -lt 10 ]; then
    echo "Given Number $Num1 is less than 10"
elif [ $Num1 -eq 10 ]; then
    echo "Given Number $Num1 is equal to 10"
else
    echo "Given Number $Num1 is greater than 10"
fi