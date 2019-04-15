# Mongo sharded cluster created with docker compose

To start mongo sharded cluster just run this

```bash
docker-compose up -d
./start-shard.sh
```

Script will ask for sudo password

To clenup everything just run

```bash
./destroy-shard.sh
```

Mem limit for all mongo instance is 1GB.
Admin user is `admin:admin`.
You can use mongos router listening on port `27017`, to connect to cluster. You can connect to mongos with:

```bash
mongo --port 27017 -u admin -p admin --authenticationDatabase admin
```

## Ports

We are using default ports from [mongo doc](https://docs.mongodb.com/manual/reference/default-mongodb-port/)
Config RS is listens on port `27019`
Shard listen on port `27018`
Mongos listen on port `27017`
