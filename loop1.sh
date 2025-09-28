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
echo "Script started executed at:$(date)"  | tee -a $Log_File                               

if [ $User_id -ne 0 ]; then
    echo "Error:Please run this Script with root privilege"
    exit 1 #failure is other than 0
fi

VALIDATE(){ #Functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 is...$R FAILURE $W " | tee -a $Log_File 
        exit 1
    else 
        echo -e "Installing $2 is...$R SUCCESS $W" | tee -a $Log_File 
    fi
}

for package in $@
do
    #check package is installed or not
    dnf list installed $package &>>$Log_File

    #if exit status is 0,already installed. -ne 0 need to install it
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>Log_File
        VALIDATE $? "$package"
    else
        echo "$package already installed...$Y SKIPPING $W"
    fi
done