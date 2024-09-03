#!/bin/bash

set -ex # -e --> setting automatically exit,if we get an error in program
       # -x --> if we get an error in program.it get execute the program in debugmode.  

failure(){
    echo "Failed at: $1:$2"
}


trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR

echo "hello world program execution"
echoooo "progarm is not executed"
echo "hello world program is success"
echoooo "promotion code not installed"
echo "program code was error"