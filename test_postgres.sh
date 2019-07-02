#!/bin/bash

export PGPASSWORD=docker
containerID=$( docker ps | grep pg-docker | awk '{print $1}' )
reg_stat=$( docker inspect --format="{{.State.Running}}" $containerID )
echo "container ID is $containerID"
echo "my postgres running status is $reg_stat"
if [  "$reg_stat" = "true" ]
then
        echo "postgres container is up and running"
                docker exec -t pg-docker  psql -U postgres -c "SELECT pg_reload_conf();" >> test.txt
                 echo "after exec"  
                if [ -s test.txt ]
                then
                        echo "Postgres service is up and running"
                else
                        echo "postgres service is down"
                fi

else
        echo "postgres container is down"
fi
