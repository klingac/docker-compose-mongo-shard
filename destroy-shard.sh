#!/bin/bash

docker-compose down
sudo chown -R "${USER}" mongo-data/*
rm -rf mongo-data/mongodb-*