#!/bin/bash

# Delecting-old-log files useing crontab

SOURCE_DIR="/home/ec2-user/files"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [-d $SOURCE_DIR ]
   then
       echo -e "$SOURCE_DIR is $G Exist $N"
   else
       echo -e "$SOURCE_DIR is $R notExit $N"
       exit 1
fi 

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +10)
echo -e "$R file: $FILES $N"

while IFS= read -r file
    do
      echo -e "$Y Deleting file: $file $N"
      rm -rf $file

    done <<< $FILES