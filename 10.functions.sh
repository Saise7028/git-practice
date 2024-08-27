#!/bin/bash

USERID=$(id -u)

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
        echo "$2 is...failure"
        exit 1
    else 
        echo "$2 is...success"
    fi        
}


# dnf list installed git
# if [ $? -ne 0 ]
# echo "if git is not installed.going to install it"
# dnf install git -y
# VALIDATE $? installing git
# else 
#     echo "git is already installed,nothing to do.."
# fi

# dnf list installed mysql
# if [ $? -ne 0 ]
# echo "mysql not installed.going to install it"
# dnf install mysql -y
# VALIDATE $? installing mysql
# else
#     echo "my sql already installed,nothing to do.."
# fi




