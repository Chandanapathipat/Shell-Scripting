#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"

User_id=$(id -u)

if [ $User_id -ne 0 ]; then
    echo "Error:Please run this Script with root privilege"
    exit 1 #failure is other than 0
fi

VALIDATE(){ #Functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 is...$R FAILURE $W "
        exit 1
    else 
        echo -e "Installing $2 is...$R SUCCESS $W"
    fi
}

for package in {$@}
do
    echo "Package is:$package"
done