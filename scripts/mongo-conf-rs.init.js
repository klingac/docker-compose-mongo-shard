rs.initiate(
  {
     _id: "config-rs",
     configsvr: true,
     version: 1,
     members: [
        { _id: 0, host : "mongodb-conf-rs-1:27019" },
        { _id: 1, host : "mongodb-conf-rs-2:27019" },
        { _id: 2, host : "mongodb-conf-rs-3:27019" }
     ]
  }
)
