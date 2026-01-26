#!/bin/sh

# This script takes in a file path and a string then writes the string to the 
# file
# Arg1 WRITEFILE Path to a file to write to
# Arg2 WRITESTR A text string to write to a file

USAGE="
writer.sh WRITEFILE WRITESTR             \n
WRITEFILE Path to a file to write to     \n
WRITESTR A text string to write to a file\n"

if [ $# -ne 2 ]
then
    echo "Need to have 2 Arguments"
    echo $USAGE
    exit 1
fi

WRITEFILE=$1
WRITESTR=$2

echo "write to file: ${WRITEFILE}"
echo "write ${WRITESTR} to the file"
WRITEDIR=`echo $WRITEFILE | sed -E "s/(.*\/).*/\1/"`
# WRITEDIR=`sed -E "s/(.*\/).*/\1/" $WRITEFILE`
echo "Checking to make sure ${WRITEDIR} exists, creating if doesn't"
mkdir -p $WRITEDIR
echo $WRITESTR > $WRITEFILE