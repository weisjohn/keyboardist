#!/bin/bash

# history command does not work inside a bash script, put history in a tmp file
tmp="/tmp/keyboardist"
tail -1000 ${HOME}/.bash_history > $tmp

# find the aliases (should we source somewhere else?)
source ~/.aliases

# top twenty commands that might need to be optimized
cmds=$(cat $tmp | awk '{print $1}' | awk 'BEGIN {FS="|"}{print $1}' | sort | uniq -c | sort -nr | head -n 20 | awk '{print $2}' | grep -e '[^\ ]\{5,\}')
if [ -n $cmds ]; then
    echo "optimize: $cmds";
fi

# $(cat $tmp | awk '{print $1}' | awk 'BEGIN {FS="|"}{print $1}' | sort | uniq -c | sort -nr)
# echo $freq

# short=$(alias | cut -d ' ' -f 2 | cut -d '=' -f 1)
# echo $short