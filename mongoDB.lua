local mongo = require('mongo')

local client = mongo.Client 'mongodb://host_ip:port'
local database = client:getDatabase('database_name')
local collection = database:getCollection('test')

local query = mongo.BSON '{ "id" : { "$gt" : "0" } }'

for document in collection:find(query):iterator()
do
    print(document.id, document.name)
end
