!#/bin/bash
DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5 

while IFS= read -r line #IFS, internal field seperator, empty it will ignore while space, -r is for not to ignore special characters like /
do
    USAGE=$(echo $line | grep xfs | aws -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')
    if [ USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$PARTIION is more than $DISK_THRESHOLD, current value : $USAGE, please check"
    fi
done <<< $DISK_USAGE