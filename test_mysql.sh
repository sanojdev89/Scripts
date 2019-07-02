docker kill testsql
docker rm testsql
 docker run --name=testsql -e MYSQL_ROOT_PASSWORD=sanoj -d mysql
 containerID=$( docker ps | grep testsql | awk '{print $1}' )
reg_stat=$( docker inspect --format="{{.State.Running}}" $containerID )
echo "container ID is $containerID"
echo "MYSQL running status is $reg_stat"
if [  "$reg_stat" = "true" ]
then
        echo "MYSQL container is up and running"

                docker kill myadmin
                docker rm myadmin

                docker run --name myadmin -d --link testsql:db -p 8081:80 phpmyadmin/phpmyadmin


                https=http://localhost:8081/

                # save the status in some variable
                sleep 5s
                sh mysql.sh

else
        echo "MYSQL container is down"
fi
