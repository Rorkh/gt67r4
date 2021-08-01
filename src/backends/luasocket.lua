local http = require("ssl.https")
local ltn12 = require("ltn12")

local backend = {}

function backend.request(method, url, headers, payload, callback)
	headers['Content-Length'] = payload:len()

	local response_body = {}
	http.request{method = method, url = url, headers = headers, body = payload, source = ltn12.source.string(payload), sink = ltn12.sink.table(response_body)}
	
	if callback then callback(table.concat(response_body)) end
end

return backend