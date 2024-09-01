#!/bin/bash

# /var/log/shell-script<15-redirectors.sh>-timestamp.log

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
       if [ $USERID -ne 0 ]
         then
           echo -e "$R Please run the script with root priveleages $N" &>>$LOG_FILE
           exit 1
        fi    
}

VALIDATE(){
      if [ $1 -ne 0 ]
        then
          echo -e "$2 is...$R FAILURE $N" &>>$LOG_FILE
          exit 1
        else
            echo -e "$2 is...$R SUCCESS $N" &>>$LOG_FILE
      fi          
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh 16-redirectors.sh package1 package2 ..."
    exit 1
}


CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi


# sh 14.loops.sh git mysql postfix nginx
for package in $@ # pass the all arguments in the scipt
   do
      dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
     then 
         echo "$package not installed.then install it"
dnf install $package -y &>>$LOG_FILE
VALIDATE $? "installing $package" &>>$LOG_FILE
    else
        echo "$package is already installed.nothing to do.." &>>$LOG_FILE 
    fi               
   done