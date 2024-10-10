!#/bin/bash
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USAGE(){
    echo -e "$R USAGE:: $N sh 19_backup.sh <source> <destination> <days(optional)>"
}

#check the source and destination are provided
if [ $# -lt 2 ]
then 
    USAGE
    exit 1
fi

if[ ! -d $SOURCE_DIR ]
then
    echo "$SOURCE_DIR does not exit.. please check"
fi
if [ ! -d $DEST_DIR ]
then
    echo "$DEST_DIR does not exit.. please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS)
echo "Files: $FILES"

if [! -z $FILES ] #true if FILES is empty, ! makes it expression false
then
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS | zip "$ZIP_FILE" -@

    #check if zip file is successfully completed or not
    if [ -f $ZIP_FILE ]
    then 
        echo "Successfully zipped the files older than $DAYS"
        #removing the files after zipping
        while IFS= read -r file #IFS, internal field seperator , empty it will ignore while space. -r is for not to ignore special charecters like /
        do
            echo "Deleting file: $file"
            rm -rf $file
        done <<< $FILES
    else
        echo "Zipping the files is failes"
        exit 1
    fi
else
    echo "No files older than $DAYS"
fi

