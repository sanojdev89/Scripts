#!/bin/bash

https=http://localhost:8081/

# save the status in some variable
status=`curl $https -k -s -f -o /dev/null && echo "SUCCESS" || echo "ERROR"`

 if [ "$status" = "SUCCESS" ]
then
 echo "MYSQL is up and Running!!"
fi
