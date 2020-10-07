#!/bin/bash

haikuportsdirectory=$1
searchpattern=$2

if [ -d "$haikuportsdirectory" ]
then
    echo "Looking for $searchpattern in all recipes in the $haikuportsdirectory HaikuPorts directory..."

    files=`find $haikuportsdirectory -type f -name "*.recipe"`

    for file in $files
    do
        if output=`grep -n $searchpattern $file 2> /dev/null`
        then
            echo $file
            echo $output
            echo
        fi
    done
else
    echo "$haikuportsdirectory does not exist or is not a directory... exiting."
fi
