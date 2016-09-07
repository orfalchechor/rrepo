library(RPostgreSQL)
con <- dbConnect(PostgreSQL(), user= "rstudio", password="rstudio", 
dbname="rstudio", host="192.168.121.143" )

## Default data.frame
rs <- dbSendQuery(con, "SELECT * FROM x")
df <- fetch(rs)

## Memberships
rs <- dbSendQuery(con, "SELECT y FROM twee WHERE y = 'twee'")
df$y <- list(fetch(rs))

df[,2]
