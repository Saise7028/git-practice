#!/bin/bash

# /var/log/shell-script/16.redirectors.sh<timestamp>.log

LOGS_FOLDER="/var/log/shell_script"
SCRIPT_NAME=$(echo $0 | cut -d "." f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE=$"LOGS_FOLDER/SCRIPT_NAME/TIMESTAMP.log"

mkdir -p $LOGS_FOLDER

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USERID=$(id -u)

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo " $R Run the script with root Priveleges $N" &>>$LOG_FILE
        exit 1
    fi    
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R Failure $N" &>>$LOG_FILE
        exit 1
    else
        echo -e "$2 is... $R Success $N" &>>$LOG_FILE
    fi        
}
