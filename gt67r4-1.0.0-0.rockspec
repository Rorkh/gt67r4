package = "gt67r4"
version = "1.0.0-0"
source = {
	url = "git+https://github.com/Rorkh/gt67r4"
}
description = {
	summary = "Adaptive Discord API wrapper",
	homepage = "https://github.com/Rorkh/gt67r4",
	maintainer = "Rorkh <kremlebotone@gmail.com>"
}
dependencies = {}
build = {
	type = "builtin",
	modules = {
		gt67r4 = "src/gt67r4.lua",
		["gt67r4.client"] = "src/client.lua",

		["gt67r4.backends.luasocket"] = "src/backends/luasocket.lua",
		["gt67r4.backends.cuberite"] = "src/backends/cuberite.lua",
		["gt67r4.backends.turbo"] = "src/backends/turbo.lua",

		["gt67r4.json.cuberite"] = "src/json/cuberite.lua",

		["gt67r4.discord.endpoints"] = "src/discord/endpoints.lua",
		["gt67r4.discord.channel"] = "src/discord/channel.lua",
		["gt67r4.discord.guild"] = "src/discord/guild.lua",
		["gt67r4.discord.webhook"] = "src/discord/webhook.lua",
	}
}

