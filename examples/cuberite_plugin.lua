local gt67r4 = require("gt67r4")
local client = gt67r4:Client("Bot <insert_your_token>")

PLUGIN = nil

function Initialize(Plugin)
	Plugin:SetName("DiscordRelay")
	Plugin:SetVersion(1)

	client:createMessage(function(body) end, "<channel_id>", {content = "Cuberite server started up"})

	return true
end

function OnDisable() end
