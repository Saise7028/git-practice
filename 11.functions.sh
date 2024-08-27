#!/bin/bash

USERID=$(id -u)
#echo "user id is: $USERID"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "run the script with root priveleges"
        exit 1
    fi    
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is...failed"
        exit 1
    else
        echo "$2 is...success"
    fi     
}

dnf list installed git
if [ $? -ne 0 ]
then 
    echo "git is not installed.then install it"
dnf install git -y
VALIDATE $? "installing git"
else
    echo "git is already installed.nothig to do"
fi 

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "mysql is not installed.then install it"
dnf install mysql -y
VALIDATE $? "installing mysql"
else 
    echo "mysql is already installed.nothing to do"
fi    

