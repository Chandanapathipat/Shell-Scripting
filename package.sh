#!/bin/bash
User_id=$(id -u)

#id -u is used to check the user is root user or not

if [ $User_id -ne 0 ]; then
    echo "Error:Please run this Script with root privilege"
    exit 1 #failure is other than 0
fi
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "Error:Installing MySQL is failure"
    exit 1
else 
    echo "Installing MySQL is SUCCESS"
fi

dnf install nginx -y
if [ $? -ne 0 ]; then
    echo "Error:Installing Nginx is failure"
    exit 1
else 
    echo "Installing Nginx is SUCCESS"
fi

dnf install mongodb-mongossh -y
if [ $? -ne 0 ]; then
    echo "Error:Installing mongodb-mongossh is failure"
    exit 1
else 
    echo "Installing mongodb-mongossh is SUCCESS"
fi

