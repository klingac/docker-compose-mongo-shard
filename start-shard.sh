#!/bin/bash
export MONGO_KEYFILE="./mongo-secrets/mongo.key"

if [ ! -f "$MONGO_KEYFILE" ]; then
  openssl rand -base64 756 > ./mongo-secrets/mongo.key
fi

sudo chown 999 ./mongo-secrets/mongo.key
sudo chmod 600 ./mongo-secrets/mongo.key

docker-compose up -d
sleep 8

docker-compose exec mongodb-conf-rs-1 sh -c "mongo --port 27019 < /mongo-conf-rs.init.js"
sleep 3

docker-compose exec mongodb-sh-1-rs-1 sh -c "mongo --port 27018 < /mongo-sh-1-rs.init.js"
sleep 3

docker-compose exec mongodb-sh-2-rs-1 sh -c "mongo --port 27018 < /mongo-sh-2-rs.init.js"
sleep 5

docker-compose up -d

docker-compose exec mongos-1 sh -c "mongo --port 27017 < /mongo-sharding.init.js"
sleep 3

source scripts/mongo-auth.admin.sh
