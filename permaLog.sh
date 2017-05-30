#!/bin/bash
#helpful when while getting logs from device/checking if it's connected and I'm tired of restarting command/connection

START=$1

while [ 1 ]
do
    eval $START
done
