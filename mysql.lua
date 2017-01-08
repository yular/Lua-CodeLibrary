-- Here test table only has one column called id.
luasql = require "luasql.mysql"
env = assert (luasql.mysql())
con = assert (env:connect("database_name","user_name","password","host_ip",port))

print(env,con)

cur,errorString = con:execute([[select * from test;]])
print(cur,errorString )

row = cur:fetch ({}, "a")

while row do
    print(string.format("Id: %s ", row.id))
    row = cur:fetch (row, "a")
end

cur:close()
con:close()
env:close()
