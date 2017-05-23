#!/bin/bash

SEARCH_TERM=$1
COLUMN_NUMBER=1

if [ $# -gt 1 ] 
    then
    COLUMN_NUMBER=$2
fi

ps -ax | grep ${SEARCH_TERM} | awk '{print $'${COLUMN_NUMBER}'}'