-- Enable if turbo backend is used
-- _G.TURBO_SSL = true

local gt67r4 = require("gt67r4")

--gt67r4:SetBackend(require("backends.luasocket"))
local client = gt67r4:Client("Bot <insert_your_token_here>")

client:createMessage(function(body) end, "<channel_id>", {content = "Hello world"})
