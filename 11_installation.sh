!#/bin/bash
USERID=$(id -u)

echo "Entered user id is : $USERID"
if[ USERID -ne 0 ]
then
    echo "Please run this script with ROOT priveleges"
    exit 1
fi

dnf list installed git
if[ $? -ne 0 ]
then
    echo "Git is not installed, going to intall it.."
    dnf install git -y
    if[ $? -ne 0 ]
    then
        echo "Git installation is failure.. please check it"
        exit 1
    else
        echo "Git installation is Success"
    fi
else
    echo "git is already installed, nothing to do.."
fi

dnf list installed mysql
if[ $? -ne 0 ]
then
    echo "MYSQL is not installed, going to install it.."
    dnf install mysql -y
    if[ $? -ne 0 ]
    then
        echo "Mysql installation is failure.. please check it"
        exit 1
    else
        echo "Mysql installation is Success"
    fi
else
    echo "Mysql is already installed, nothing to do.."
fi

