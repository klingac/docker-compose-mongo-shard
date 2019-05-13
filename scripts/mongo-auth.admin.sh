#!/bin/bash
# docker-compose exec mongodb-conf-rs-1 sh -c "mongo --port 27019 -u admin -p admin --authenticationDatabase admin --host config-rs/mongodb-conf-rs-1:27019,mongodb-conf-rs-2:27019,mongodb-conf-rs-3:27019 < /mongo-auth.admin.init.js"
docker-compose exec mongodb-conf-rs-1 sh -c "mongo --port 27019 --eval \"var adm_passwd = '$LOCAL_ADM_PASSWD'\" /mongo-auth.admin.init.js"
docker-compose exec mongodb-conf-rs-2 sh -c "mongo --port 27019 --eval \"var adm_passwd = '$LOCAL_ADM_PASSWD'\" /mongo-auth.admin.init.js"
docker-compose exec mongodb-conf-rs-3 sh -c "mongo --port 27019 --eval \"var adm_passwd = '$LOCAL_ADM_PASSWD'\" /mongo-auth.admin.init.js"

docker-compose exec mongodb-sh-1-rs-1 sh -c "mongo --port 27018 --eval \"var adm_passwd = '$LOCAL_ADM_PASSWD'\" /mongo-auth.admin.init.js"
docker-compose exec mongodb-sh-1-rs-2 sh -c "mongo --port 27018 --eval \"var adm_passwd = '$LOCAL_ADM_PASSWD'\" /mongo-auth.admin.init.js"
docker-compose exec mongodb-sh-1-rs-3 sh -c "mongo --port 27018 --eval \"var adm_passwd = '$LOCAL_ADM_PASSWD'\" /mongo-auth.admin.init.js"

docker-compose exec mongodb-sh-2-rs-1 sh -c "mongo --port 27018 --eval \"var adm_passwd = '$LOCAL_ADM_PASSWD'\" /mongo-auth.admin.init.js"
docker-compose exec mongodb-sh-2-rs-2 sh -c "mongo --port 27018 --eval \"var adm_passwd = '$LOCAL_ADM_PASSWD'\" /mongo-auth.admin.init.js"
docker-compose exec mongodb-sh-2-rs-3 sh -c "mongo --port 27018 --eval \"var adm_passwd = '$LOCAL_ADM_PASSWD'\" /mongo-auth.admin.init.js"

docker-compose exec mongos-1 sh -c "mongo --port 27017 --eval \"var adm_passwd = '$SHARD_ADM_PASSWD'\" /mongo-auth.admin.init.js"
