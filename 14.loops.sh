#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo "Run the script with root priveleges"
        exit 1
    fi    
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R Failure $N"
        exit 1
    else
        echo -e "$2 is...$G Success $N"
    fi        
}

CHECK_ROOT

sh 14.loops.sh 
for packages in $@ # pass the all arguments in the scipt
   do
     echo "$packages"
   done    