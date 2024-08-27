#!/bin/bash 

USERID=$(id -u)
echo "user id is: $USERID"

# if [ $USERID -ne 0 ]
# then
#     echo "installing the script with root preveliges"
# else 
#     echo "if not root access exit the script and through the error"
# fi

# dnf install git -y