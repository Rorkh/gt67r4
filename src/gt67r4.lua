local client = require("gt67r4.client")

local gt67r4 = {}
local backend = (cUrlClient and require("gt67r4.backends.cuberite")) or (pcall(require, "turbo") and require("gt67r4.backends.turbo")) or (pcall(require, "ssl.https") and require("gt67r4.backends.luasocket"))
local json = cUrlClient and require("gt67r4.json.cuberite") or require("cjson")

if not backend then error("Can't find backend to use.") end

function gt67r4:SetBackend(back)
	if not back.request then return end
	backend = back
end

function gt67r4:Client(token)
	return client(json, backend, token)
end

return gt67r4
