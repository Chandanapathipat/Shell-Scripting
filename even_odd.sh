#!/bin/bash
echo "Enter your Number:"
read Num
if[ $($Num % 2) -eq 0 ]; then
    echo "The given number $NUM is even"
else
    echo "The given number $NUM is odd"