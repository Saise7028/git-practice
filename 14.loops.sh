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

# sh 14.loops.sh git mysql postfix nginx
for package in $@ # pass the all arguments in the scipt
   do
      dnf list installed $package
    if [ $? -ne 0 ]
     then 
         echo "$package not installed.then install it"
dnf install $package -y
VALIDATE $? "installing $package"
    else
        echo "$package is already installed.nothing to do.."           
   done    