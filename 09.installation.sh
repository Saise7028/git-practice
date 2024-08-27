#!/bin/bash 

USERID=$(ID -u)
#echo "user ID is $USERID"

if [ $USERID -ne 0 ]
then 
    echo "installing the script with root previliages"
    exit 1
fi
dnf list installed git # checking wether the git installed are not.
if [  $? -ne 0 ]
then
    echo "git is not installed.going to install it.."
dnf install git -y
if [ $? -ne 0 ]
then 
    echo "git is intalled are not check it.."
    exit 1
else
    echo "git installation is success.."
fi
else 
    echo "git is already installed nothing to do.."
fi 
               