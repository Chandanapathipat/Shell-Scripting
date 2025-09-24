#!/bin/bash
User_id=$(id -u)

if [ $User_id -ne 0 ]; then
    echo "Error:Please run this Script with root privilege"
    exit 1 #failure is other than 0
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "Error:Installing $2 is failure"
        exit 1
    else 
        echo "Installing $2 is SUCCESS"
    fi
}

dnf install mysql -y
VALIDATE $? "MySQL"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "Python"
