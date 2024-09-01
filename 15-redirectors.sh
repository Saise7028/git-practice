#!/bin/bash

# /var/log/shell-script<15-redirectors.sh>-timestamp.log

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TMESTAMP.log"
mkdir -p $LOG_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
       if [ $USERID -ne 0 ]
         then
           echo -e "$R Please run the script with root priveleages $N" &>>$LOGS_FILE
           exit 1
        fi    
}

VALIDATE(){
      if [ $1 -ne 0 ]
        then
          echo "$2 is...$R FAILURE $N" &>>$LOGS_FILE
          exit 1
        else
            echo "$2 is...$R SUCCESS $N" &>>$LOGS_FILE
      fi          
}
