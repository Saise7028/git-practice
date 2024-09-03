#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14} # if $3 is empty,default is 14Days

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

if [ ! -d $DESTINATION_DIR ]
   then 
       echo "Detination directory does not exist...please check"
fi
       
