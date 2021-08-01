_G.TURBO_SSL = true

local gt67r4 = require("gt67r4")

--gt67r4:SetBackend(require("backends.luasocket"))
local client = gt67r4:Client("Bot ODU2OTIwMTAzNDk2MzE5MDE2.YNIDCQ.uj6BQzvBOLY9Hn2AMtxQh4O5JXQ")

client:createMessage(function(body)
	print(body)
end, "857678675553681439", {content = "Hello world"})