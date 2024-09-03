#!/bin/bash

# Delecting old log files

SOURECE_DIR="/home/ec2-user/files"

if [ -d $SOURECE_DIR ]
  then 
      echo "$SOURECE_DIR is Exists"
  else
      echo "$SOURCE_DIR is not Exists"
      exit 1
fi

# find -path -name <filename> -mtime n --> mtime--reperesent the meantime here '-' old time and '+'present time

FILES=$(find ${SOURECE_DIR} -name "*.log" -mtime +14)

echo "Files: $FILES"         
