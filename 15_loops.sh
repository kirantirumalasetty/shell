!#/bin/bash

USERID=$(id -u)
CHECK_ROOT(){
    if[ USERID -ne 0 ]
    then
        echo "Please run this script with root priveleges"
        exit 1
    fi
}
VALIDATE(){
    if[ $1 -ne 0 ]
    then
        echo -e "$2 is ..$R FAILED $N"
        exit 1
    else    
        echo -e "$2 is ..$N SUCCESS $N"
    fi
}

CHECK_ROOT
for package in $@
do
    dnf list installed $package
    if[ $? -ne 0 ]
    then    
        echo "$package is not installed, going to install"
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed..nothing to do"
    fi
done