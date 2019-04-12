#!/bin/bash
export MONGO_KEYFILE="./mongo-secrets/mongo.key"

if [ ! -f "$MONGO_KEYFILE" ]; then
  openssl rand -base64 756 > ./mongo-secrets/mongo.key
fi

sudo chown 999 ./mongo-secrets/mongo.key
sudo chmod 600 ./mongo-secrets/mongo.key

docker-compose up -d

sleep 8
docker-compose exec mongodb-conf-rs-1 sh -c "mongo < /mongo-conf-rs.init.js"