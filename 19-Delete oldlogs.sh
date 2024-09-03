#!/bin/bash

# Delecting old log files

SOURECE_DIR="/home/ec2-user/files"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURECE_DIR ]
  then 
      echo -e "$SOURECE_DIR is $G Exists $N"
  else
      echo -e "$SOURCE_DIR is $R not Exists $N"
      exit 1
fi

# find -path -name <filename> -mtime n --> mtime--reperesent the meantime here '-' old time and '+'present time

FILES=$(find ${SOURECE_DIR} -name "*.log" -mtime +14)

echo -e "$Y files: $FILES $N"
# rm -rf $FILES     

while IFS= read -r
     do
        echo -e "$R Deleting file: $file $N"
        rm -rf $file
     done <<< $FILES    
