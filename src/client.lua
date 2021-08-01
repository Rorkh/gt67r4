local class = require("middleclass")
local client = class("gt67r4 Client")

local endpoints = require("discord.endpoints")
local f = string.format

local BASE_URL = "https://discordapp.com/api"

local JSON = 'application/json'
local PRECISION = 'millisecond'

local USER_AGENT = string.format('DiscordBot (http://github.com/Rorkh/gt67r4, 1)')

function client:initialize(json, backend, token)
	self.json = json
	self.backend = backend
	self.token = token
end

function client:request(callback, method, endpoint, payload, query)
	local url = BASE_URL .. endpoint
	local headers = {
		['User-Agent'] = USER_AGENT,
		['X-RateLimit-Precision'] = PRECISION,
		['Authorization'] = self.token,
	}

	if query and next(query) then
		url = {url}

		for k, v in pairs(query) do
			table.insert(url, #url == 1 and '?' or '&')
			table.insert(url, urlencode(k))
			table.insert(url, '=')
			table.insert(url, urlencode(v))
		end

		url = table.concat(url)
	end
	
	if payload then
		payload = payload and self.json.encode(payload) or '{}'
		headers['Content-Type'] = JSON
	end

	local new_callback = function(body)
		callback(self.json.decode(body))
	end

	self.backend.request(method, url, headers, payload, new_callback)
end

function client:getGuildAuditLog(callback, guild_id, query)
	local endpoint = f(endpoints.GUILD_AUDIT_LOGS, guild_id)
	self:request(callback, "GET", endpoint, nil, query)
end

function client:getChannel(callback, channel_id)
	local endpoint = f(endpoints.CHANNEL, channel_id)
	self:request(callback, "GET", endpoint)
end

function client:modifyChannel(callback, channel_id, payload)
	local endpoint = f(endpoints.CHANNEL, channel_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:deleteChannel(callback, channel_id)
	local endpoint = f(endpoints.CHANNEL, channel_id)
	self:request(callback, "DELETE", endpoint)
end

function client:getChannelMessages(callback, channel_id, query)
	local endpoint = f(endpoints.CHANNEL_MESSAGES, channel_id)
	self:request(callback, "GET", endpoint, nil, query)
end

function client:getChannelMessage(callback, channel_id, message_id)
	local endpoint = f(endpoints.CHANNEL_MESSAGE, channel_id, message_id)
	self:request(callback, "GET", endpoint)
end

function client:createMessage(callback, channel_id, payload)
	local endpoint = f(endpoints.CHANNEL_MESSAGES, channel_id)
	self:request(callback, "POST", endpoint, payload, nil)
end

function client:createReaction(callback, channel_id, message_id, emoji, payload)
	local endpoint = f(endpoints.CHANNEL_MESSAGE_REACTION_ME, channel_id, message_id, urlencode(emoji))
	self:request(callback, "PUT", endpoint, payload)
end

function client:deleteOwnReaction(callback, channel_id, message_id, emoji)
	local endpoint = f(endpoints.CHANNEL_MESSAGE_REACTION_ME, channel_id, message_id, urlencode(emoji))
	self:request(callback, "DELETE", endpoint)
end

function client:deleteUserReaction(callback, channel_id, message_id, emoji, user_id)
	local endpoint = f(endpoints.CHANNEL_MESSAGE_REACTION_USER, channel_id, message_id, urlencode(emoji), user_id)
	self:request(callback, "DELETE", endpoint)
end

function client:getReactions(callback, channel_id, message_id, emoji, query)
	local endpoint = f(endpoints.CHANNEL_MESSAGE_REACTION, channel_id, message_id, urlencode(emoji))
	self:request(callback, "GET", endpoint, nil, query)
end

function client:deleteAllReactions(callback, channel_id, message_id)
	local endpoint = f(endpoints.CHANNEL_MESSAGE_REACTIONS, channel_id, message_id)
	self:request(callback, "DELETE", endpoint)
end

function client:editMessage(callback, channel_id, message_id, payload)
	local endpoint = f(endpoints.CHANNEL_MESSAGE, channel_id, message_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:deleteMessage(callback, channel_id, message_id)
	local endpoint = f(endpoints.CHANNEL_MESSAGE, channel_id, message_id)
	self:request(callback, "DELETE", endpoint)
end

function client:bulkDeleteMessages(callback, channel_id, payload)
	local endpoint = f(endpoints.CHANNEL_MESSAGES_BULK_DELETE, channel_id)
	self:request(callback, "POST", endpoint, payload)
end

function client:editChannelPermissions(callback, channel_id, overwrite_id, payload)
	local endpoint = f(endpoints.CHANNEL_PERMISSION, channel_id, overwrite_id)
	self:request(callback, "PUT", endpoint, payload)
end

function client:getChannelInvites(callback, channel_id)
	local endpoint = f(endpoints.CHANNEL_INVITES, channel_id)
	self:request(callback, "GET", endpoint)
end

function client:createChannelInvite(callback, channel_id, payload)
	local endpoint = f(endpoints.CHANNEL_INVITES, channel_id)
	self:request(callback, "POST", endpoint, payload)
end

function client:deleteChannelPermission(callback, channel_id, overwrite_id)
	local endpoint = f(endpoints.CHANNEL_PERMISSION, channel_id, overwrite_id)
	self:request(callback, "DELETE", endpoint)
end

function client:triggerTypingIndicator(callback, channel_id, payload)
	local endpoint = f(endpoints.CHANNEL_TYPING, channel_id)
	self:request(callback, "POST", endpoint, payload)
end

function client:getPinnedMessages(callback, channel_id)
	local endpoint = f(endpoints.CHANNEL_PINS, channel_id)
	self:request(callback, "GET", endpoint)
end

function client:addPinnedChannelMessage(callback, channel_id, message_id, payload)
	local endpoint = f(endpoints.CHANNEL_PIN, channel_id, message_id)
	self:request(callback, "PUT", endpoint, payload)
end

function client:deletePinnedChannelMessage(callback, channel_id, message_id)
	local endpoint = f(endpoints.CHANNEL_PIN, channel_id, message_id)
	self:request(callback, "DELETE", endpoint)
end

function client:groupDMAddRecipient(callback, channel_id, user_id, payload)
	local endpoint = f(endpoints.CHANNEL_RECIPIENT, channel_id, user_id)
	self:request(callback, "PUT", endpoint, payload)
end

function client:groupDMRemoveRecipient(callback, channel_id, user_id)
	local endpoint = f(endpoints.CHANNEL_RECIPIENT, channel_id, user_id)
	self:request(callback, "DELETE", endpoint)
end

function client:listGuildEmojis(callback, guild_id)
	local endpoint = f(endpoints.GUILD_EMOJIS, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:getGuildEmoji(callback, guild_id, emoji_id)
	local endpoint = f(endpoints.GUILD_EMOJI, guild_id, emoji_id)
	self:request(callback, "GET", endpoint)
end

function client:createGuildEmoji(callback, guild_id, payload)
	local endpoint = f(endpoints.GUILD_EMOJIS, guild_id)
	self:request(callback, "POST", endpoint, payload)
end

function client:modifyGuildEmoji(callback, guild_id, emoji_id, payload)
	local endpoint = f(endpoints.GUILD_EMOJI, guild_id, emoji_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:deleteGuildEmoji(callback, guild_id, emoji_id)
	local endpoint = f(endpoints.GUILD_EMOJI, guild_id, emoji_id)
	self:request(callback, "DELETE", endpoint)
end

function client:createGuild(callback, payload)
	local endpoint = endpoints.GUILDS
	self:request(callback, "POST", endpoint, payload)
end

function client:getGuild(callback, guild_id)
	local endpoint = f(endpoints.GUILD, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:modifyGuild(callback, guild_id, payload)
	local endpoint = f(endpoints.GUILD, guild_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:deleteGuild(callback, guild_id)
	local endpoint = f(endpoints.GUILD, guild_id)
	self:request(callback, "DELETE", endpoint)
end

function client:getGuildChannels(callback, guild_id)
	local endpoint = f(endpoints.GUILD_CHANNELS, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:createGuildChannel(callback, guild_id, payload)
	local endpoint = f(endpoints.GUILD_CHANNELS, guild_id)
	self:request(callback, "POST", endpoint, payload)
end

function client:modifyGuildChannelPositions(callback, guild_id, payload)
	local endpoint = f(endpoints.GUILD_CHANNELS, guild_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:getGuildMember(callback, guild_id, user_id)
	local endpoint = f(endpoints.GUILD_MEMBER, guild_id, user_id)
	self:request(callback, "GET", endpoint)
end

function client:listGuildMembers(callback, guild_id)
	local endpoint = f(endpoints.GUILD_MEMBERS, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:addGuildMember(callback, guild_id, user_id, payload)
	local endpoint = f(endpoints.GUILD_MEMBER, guild_id, user_id)
	self:request(callback, "PUT", endpoint, payload)
end

function client:modifyGuildMember(callback, guild_id, user_id, payload)
	local endpoint = f(endpoints.GUILD_MEMBER, guild_id, user_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:modifyCurrentUsersNick(callback, guild_id, payload)
	local endpoint = f(endpoints.GUILD_MEMBER_ME_NICK, guild_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:addGuildMemberRole(callback, guild_id, user_id, role_id, payload)
	local endpoint = f(endpoints.GUILD_MEMBER_ROLE, guild_id, user_id, role_id)
	self:request(callback, "PUT", endpoint, payload)
end

function client:removeGuildMemberRole(callback, guild_id, user_id, role_id)
	local endpoint = f(endpoints.GUILD_MEMBER_ROLE, guild_id, user_id, role_id)
	self:request(callback, "DELETE", endpoint)
end

function client:removeGuildMember(callback, guild_id, user_id, query)
	local endpoint = f(endpoints.GUILD_MEMBER, guild_id, user_id)
	self:request(callback, "DELETE", endpoint, nil, query)
end

function client:getGuildBans(callback, guild_id) 
	local endpoint = f(endpoints.GUILD_BANS, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:getGuildBan(callback, guild_id, user_id)
	local endpoint = f(endpoints.GUILD_BAN, guild_id, user_id)
	self:request(callback, "GET", endpoint)
end

function client:createGuildBan(callback, guild_id, user_id, query)
	local endpoint = f(endpoints.GUILD_BAN, guild_id, user_id)
	self:request(callback, "PUT", endpoint, nil, query)
end

function client:removeGuildBan(callback, guild_id, user_id, query)
	local endpoint = f(endpoints.GUILD_BAN, guild_id, user_id)
	self:request(callback, "DELETE", endpoint, nil, query)
end

function client:getGuildRoles(callback, guild_id)
	local endpoint = f(endpoints.GUILD_ROLES, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:createGuildRole(callback, guild_id, payload) 
	local endpoint = f(endpoints.GUILD_ROLES, guild_id)
	self:request(callback, "POST", endpoint, payload)
end

function client:modifyGuildRolePositions(callback, guild_id, payload) 
	local endpoint = f(endpoints.GUILD_ROLES, guild_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:modifyGuildRole(callback, guild_id, role_id, payload) 
	local endpoint = f(endpoints.GUILD_ROLE, guild_id, role_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:deleteGuildRole(callback, guild_id, role_id) 
	local endpoint = f(endpoints.GUILD_ROLE, guild_id, role_id)
	self:request(callback, "DELETE", endpoint)
end

function client:getGuildPruneCount(callback, guild_id, query) 
	local endpoint = f(endpoints.GUILD_PRUNE, guild_id)
	self:request(callback, "GET", endpoint, nil, query)
end

function client:beginGuildPrune(callback, guild_id, payload, query) 
	local endpoint = f(endpoints.GUILD_PRUNE, guild_id)
	self:request(callback, "POST", endpoint, payload, query)
end

function client:getGuildVoiceRegions(callback, guild_id) 
	local endpoint = f(endpoints.GUILD_REGIONS, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:getGuildInvites(callback, guild_id) 
	local endpoint = f(endpoints.GUILD_INVITES, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:getGuildIntegrations(callback, guild_id) 
	local endpoint = f(endpoints.GUILD_INTEGRATIONS, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:createGuildIntegration(callback, guild_id, payload) 
	local endpoint = f(endpoints.GUILD_INTEGRATIONS, guild_id)
	self:request(callback, "POST", endpoint, payload)
end

function client:modifyGuildIntegration(callback, guild_id, integration_id, payload) 
	local endpoint = f(endpoints.GUILD_INTEGRATION, guild_id, integration_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:deleteGuildIntegration(callback, guild_id, integration_id) 
	local endpoint = f(endpoints.GUILD_INTEGRATION, guild_id, integration_id)
	self:request(callback, "DELETE", endpoint)
end

function client:syncGuildIntegration(callback, guild_id, integration_id, payload) 
	local endpoint = f(endpoints.GUILD_INTEGRATION_SYNC, guild_id, integration_id)
	self:request(callback, "POST", endpoint, payload)
end

function client:getGuildEmbed(callback, guild_id) 
	local endpoint = f(endpoints.GUILD_EMBED, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:modifyGuildEmbed(callback, guild_id, payload) 
	local endpoint = f(endpoints.GUILD_EMBED, guild_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:getInvite(callback, invite_code, query) 
	local endpoint = f(endpoints.INVITE, invite_code)
	self:request(callback, "GET", endpoint, nil, query)
end

function client:deleteInvite(callback, invite_code) 
	local endpoint = f(endpoints.INVITE, invite_code)
	self:request(callback, "DELETE", endpoint)
end

function client:acceptInvite(callback, invite_code, payload) 
	local endpoint = f(endpoints.INVITE, invite_code)
	self:request(callback, "POST", endpoint, payload)
end

function client:getCurrentUser(callback) 
	local endpoint = endpoints.USER_ME
	self:request(callback, "GET", endpoint)
end

function client:getUser(callback, user_id) 
	local endpoint = f(endpoints.USER, user_id)
	self:request(callback, "GET", endpoint)
end

function client:modifyCurrentUser(callback, payload) 
	local endpoint = endpoints.USER_ME
	self:request(callback, "PATCH", endpoint, payload)
end

function client:getCurrentUserGuilds(callback) 
	local endpoint = endpoints.USER_ME_GUILDS
	self:request(callback, "GET", endpoint)
end

function client:leaveGuild(callback, guild_id) 
	local endpoint = f(endpoints.USER_ME_GUILD, guild_id)
	self:request(callback, "DELETE", endpoint)
end

function client:getUserDMs(callback) 
	local endpoint = endpoints.USER_ME_CHANNELS
	self:request(callback, "GET", endpoint)
end

function client:createDM(callback, payload) 
	local endpoint = endpoints.USER_ME_CHANNELS
	self:request(callback, "POST", endpoint, payload)
end

function client:createGroupDM(callback, payload) 
	local endpoint = endpoints.USER_ME_CHANNELS
	self:request(callback, "POST", endpoint, payload)
end

function client:getUsersConnections(callback) 
	local endpoint = endpoints.USER_ME_CONNECTIONS
	self:request(callback, "GET", endpoint)
end

function client:listVoiceRegions(callback) 
	local endpoint = endpoints.VOICE_REGIONS
	self:request(callback, "GET", endpoint)
end

function client:createWebhook(callback, channel_id, payload) 
	local endpoint = f(endpoints.CHANNEL_WEBHOOKS, channel_id)
	self:request(callback, "POST", endpoint, payload)
end

function client:getChannelWebhooks(callback, channel_id) 
	local endpoint = f(endpoints.CHANNEL_WEBHOOKS, channel_id)
	self:request(callback, "GET", endpoint)
end

function client:getGuildWebhooks(callback, guild_id) 
	local endpoint = f(endpoints.GUILD_WEBHOOKS, guild_id)
	self:request(callback, "GET", endpoint)
end

function client:getWebhook(callback, webhook_id) 
	local endpoint = f(endpoints.WEBHOOK, webhook_id)
	self:request(callback, "GET", endpoint)
end

function client:getWebhookWithToken(callback, webhook_id, webhook_token) 
	local endpoint = f(endpoints.WEBHOOK_TOKEN, webhook_id, webhook_token)
	self:request(callback, "GET", endpoint)
end

function client:modifyWebhook(callback, webhook_id, payload) 
	local endpoint = f(endpoints.WEBHOOK, webhook_id)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:modifyWebhookWithToken(callback, webhook_id, webhook_token, payload) 
	local endpoint = f(endpoints.WEBHOOK_TOKEN, webhook_id, webhook_token)
	self:request(callback, "PATCH", endpoint, payload)
end

function client:deleteWebhook(callback, webhook_id) 
	local endpoint = f(endpoints.WEBHOOK, webhook_id)
	self:request(callback, "DELETE", endpoint)
end

function client:deleteWebhookWithToken(callback, webhook_id, webhook_token) 
	local endpoint = f(endpoints.WEBHOOK_TOKEN, webhook_id, webhook_token)
	self:request(callback, "DELETE", endpoint)
end

function client:executeWebhook(callback, webhook_id, webhook_token, payload) 
	local endpoint = f(endpoints.WEBHOOK_TOKEN, webhook_id, webhook_token)
	self:request(callback, "POST", endpoint, payload)
end

function client:executeSlackCompatibleWebhook(callback, webhook_id, webhook_token, payload) 
	local endpoint = f(endpoints.WEBHOOK_TOKEN_SLACK, webhook_id, webhook_token)
	self:request(callback, "POST", endpoint, payload)
end

function client:executeGitHubCompatibleWebhook(callback, webhook_id, webhook_token, payload) 
	local endpoint = f(endpoints.WEBHOOK_TOKEN_GITHUB, webhook_id, webhook_token)
	self:request(callback, "POST", endpoint, payload)
end

function client:getGateway(callback) 
	local endpoint = endpoints.GATEWAY
	self:request(callback, "GET", endpoint)
end

function client:getGatewayBot(callback) 
	local endpoint = endpoints.GATEWAY_BOT
	self:request(callback, "GET", endpoint)
end

function client:getCurrentApplicationInformation(callback) 
	local endpoint = endpoints.OAUTH2_APPLICATION_ME
	self:request(callback, "GET", endpoint)
end

return client