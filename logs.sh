#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"
Logs_Folder="/var/log/shell-script"
Script_Name=$( echo $0 | cut -d "." -f1 )
#Here $0 gives the script name
Log_File="$Logs_Folder/$Script_Name.log"

User_id=$(id -u)

mkdir -p $Logs_Folder
echo "Script started executed at:$(date)"                                 

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

dnf list installed mysql &>>$Log_File
#Install if is not found
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "MySQL already exist...$Y SKIPPING $W"
fi

dnf list installed nginx &>>$Log_File
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist...$Y SKIPPING $W"
fi

dnf list installed python3 &>>$Log_File
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo -e "Python3 already exist...$Y SKIPPING $W"
fi


