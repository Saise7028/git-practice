#!/bin/bash

USERID=$(id -u)

RED="\e[31m"
GREEN="\e[32m"
NORMAL="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo "Run the script,with root periveleges"
    exit 1
    fi    
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is...$R Failure $N"
    exit 1
    else 
        echo "$2 is...$G Success $N"
    fi        
}

CHECK_ROOT

dnf list installed git
if [ $? -ne 0 ]
  then
      echo "git is not installed.going to install it"
dnf install git -y
VALIDATE $? "listing the git"
  else 
      echo "git is already installed.nothing to do.."
fi

dnf list installed mysql
if [ $? -ne 0 ]
  then
      echo "mysql is not installed.going to install it"
dnf install mysql -y
VALIDATE $? "listing the mysql"
   else
       echo "mysql is already installed.then nothing to do.."
fi
             

