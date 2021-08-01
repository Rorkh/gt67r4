local json = {}

json.encode = function(tbl) return cJson:Serialize(tbl) end
json.decode = function(str) return cJson:Parse(str) end

return json