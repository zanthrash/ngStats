#!/bin/bash

PWD=$(pwd)

if [ -z "$1" ] 
then
    echo "var is unset"
    APP=$PWD
else
    APP=$PWD/$1
fi


echo "Getting Stats on the Angular Project at:  $APP"

array=(controller directive filter provider service factory)
files=`find $APP -name "*.js"`

for a in ${array[*]}
do
    COUNT=`grep -Eho "\.$a\('" $files | wc -w`
    printf "  %s: %s\n" $a $COUNT
done

