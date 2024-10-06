!#/bin/bash

USERID=$(id -u)

CHECK_ROOT(){
    if[ $USERID -ne 0 ]
    then
        echo "Please run this script with root priveleges"
        exit 1
    fi

}
VALIDATE(){
    if[ $1 -ne 0 ]
    then
        echo "$2 is ...FAILED"
        exit 1
    else
        echo "$2 is...SUCCESS"
    fi
}

CHECK_ROOT
dnf list installed git
if[ $? -ne 0 ]
then
    echo "git id not installed, going to install it.."
    dnf install git -y
    VALIDATE $? "Installing git"
else
    echo "Git is already installed, noting to do.."
fi

dnf list installed mysql
if[ $? -ne 0 ]
then 
    echo "Mysql is not installed, going to install it.."
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else    
    echo "Mysql is alreay installed, nothing to do.."
fi