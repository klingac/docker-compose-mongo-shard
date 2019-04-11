#!/bin/bash
sudo docker exec -ti be_mongodb_1 mongorestore --drop -d app_data /docker-entrypoint-initdb.d/adhoc/dump/app_data

