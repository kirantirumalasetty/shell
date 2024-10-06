!#/bin/bash
echo "All variabls passed to the script: $@"
echo "How many variabls passed to the script: $#"
echo "To find  the script name: $0"
echo "Current working directory: $pwd"
echo "Home directory of current user: $HOME"
echo "Process id of the current executing script now: $$"
sleep 100 &
echo "process id of last background command: $!"
echo "the state of the previous command is : $?"
