#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if $3 is empty,default is 14Days
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

USAGE(){
    echo "USAGE:: 21-backup.sh <source> <destination> <days(optional)>"
    exit 1
}

if [ $# -lt 2 ]
 then 
     USAGE
fi

# check the sorce and Destination Directorys Exist are not

if [ ! -d $SOURCE_DIR ]
  then
      echo "source directory does not exist...please check"
fi

if [ ! -d $DEST_DIR ]
   then 
       echo "Detination directory does not exist...please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "files: $FILES"

if [ ! -z $FILES ]
 then 
     echo "files are found"
   ZIP_FILE="${DEST_DIR}/app-logs-$TIMESTAMP.zip" 
   find ${SOURCE_DIR} -name "*.log" -mtime +14 | zip "$ZIP_FILE" -@

    #check if zip file is successfully created or not
    if [ -f $ZIP_FILE ]
    then
        echo "Successfully zippped files older than $DAYS"
        #remove the files after zipping
      while IFS= read -r file #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
     else
        echo "Zipping the files is failed"
        exit 1
    fi
 else
     echo "no files older than $DAYS"
fi 
        
