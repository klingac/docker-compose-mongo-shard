use admin
db.createUser(
  {
    user: "admin",
    pwd: adm_passwd,
    roles: [ 
      { role: "root", db: "admin" } 
    ]
  }
)
