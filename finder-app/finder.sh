#!/bin/sh
# Script that will seach each file in filesdir and subdirectories and count how
# many searchstr are preset and in how many files.
# Arg1 filesdir will be the directory path to start searching in, will search 
#               recursivly the subdirectory under this path also
# Arg2 searchstr A string to be search for in all the files in the filesdir and
#                subdirs

USAGE="
finder.sh Arg1 Arg2                                                          \n
Arg1 FILESDIR  will be the directory path to start searching in, will search
               recursivly the subdirectory under this path also              \n
Arg2 SEARCHSTR A string to be search for in all the files in the filesdir
               and subdirs                                                   \n"

if [ $# -ne 2 ]
then
    echo "Need to have 2 Arguments"
    echo $USAGE
    exit 1
elif [ ! -d $1 ] # test if FILEDIR is not a directory
then
    echo "The first argument must be a directory"
    echo $USAGE
    exit 1
fi

FILESDIR=$1
SEARCHSTR=$2
FILECOUNT=`grep -rl $SEARCHSTR $FILESDIR | wc -l`
NUMLINES=`grep -r $SEARCHSTR $FILESDIR | wc -l`
echo "The number of files are ${FILECOUNT} and the number of matching lines are ${NUMLINES}"