#!/bin/bash

# Delecting old log files

SOURECE_DIR="/home/ec2-user/files"

if [ -d $SOURECE_DIR ]
  then 
      echo "$SOURECE_DIR is $G Exists $N"
  else
      echo "$SOURCE_DIR is $R not Exists $N"
      exit 1
fi

# find -path -name <filename> -mtime n --> mtime--reperesent the meantime here '-' old time and '+'present time

FILES=$(find ${SOURECE_DIR} -name "*.log" -mtime +14)

echo "Files: $FILES"     

while IFS= read -r
     do
        echo "Deleting file: $file"
        rm -rf $file
     done <<< $FILES    
