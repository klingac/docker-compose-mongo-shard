rs.initiate(
  {
     _id: "shard-1-rs",
     members: [
        { _id: 0, host : "mongodb-sh-1-rs-1:27018" },
        { _id: 1, host : "mongodb-sh-1-rs-2:27018" },
        { _id: 2, host : "mongodb-sh-1-rs-3:27018" }
     ]
  }
)
