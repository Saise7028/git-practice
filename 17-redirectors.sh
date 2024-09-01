#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
      then
          echo -e "$R Please run the script with root priveleges $N" | tee -a $LOG_FILE
          exit 1
    fi             
}

VALIDATE(){
    if [ $1 -ne 0 ]
     then 
         echo -e "$2 is...$R Failure $N" | tee -a $LOG_FILE
         exit 1
     else 
         echo -e "$2 is...$G Success $N" | tee -a $LOG_FILE
    fi         
}

USAGE(){
    echo "USAGE:: sudo 17-redirectors.sh package1 package2.."
    exit 1    
}

echo "script started executing at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
  then
     USAGE
fi

for package in $@
do
   dnf list installed $package | tee -a $LOG_FILE
     if [ $? -ne 0 ]
       then
            echo -e "$package is not $R installed,going to install it.. $N" | tee -a $LOG_FILE
            dnf install $package -y | tee -a $LOG_FILE
            VALIDATE $? "installing $packages"
        else 
            echo -e "$package already is $Y intalled,nothing to do.. $N" | tee -a $LOG_FILE
    fi
done             