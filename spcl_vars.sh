#!/bin/bash
echo "All variables passed to the script: $@"
echo "All variables passed to the script: $*"
echo "Script Name: $0"
echo "Current Directory: $PWD"
echo "Who is running this: $USER"
echo "Home Directory of User: $HOME" 
echo "PID of this Script: $$"
sleep 50 &
echo "PID of the last command in background is: $!"