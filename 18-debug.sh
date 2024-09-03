#!/bin/bash

set -ex

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR

echo "hello world program execution"
echoooo "progarm is not executed"
echo "hello world program is success"
echoooo "promotion code not installed"
echo "program code was error"