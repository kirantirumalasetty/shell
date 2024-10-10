!#/bin/bash
set -e #setting the automatic exit, if we get error
failure(){
    echo "Failed at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR

echo "Hello world success"
echooo "Hello world failure"
echo "Hello world after failure"
