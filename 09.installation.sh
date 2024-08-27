#!/bin/bash 

USERID=$(id -u)
# echo "user id is: $USERID"

if [ $USERID -ne 0 ]
then
    echo "installing the script with root preveliges"
    exit 1
fi

dnf install git -y