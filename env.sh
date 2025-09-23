#!/bin/bash
echo "Your course is: $COURSE"

#set the environment variable by using export in .bashrc file and it will be continuing until the server terminates
#If we set the env variable at the runtime,and this variable is live until the process is alive
# for example, if we exit the server and again login it won't be there but if we set env variable in .bashrc\
# it will be live until the server terminated 