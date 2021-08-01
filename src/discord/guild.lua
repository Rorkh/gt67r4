local guild = {}

function guild:listEmojis(callback)
	self.client:listGuildEmojis(callback, self.id)
end

function guild:getEmoji(callback, emoji_id)
	self.client:getGuildEmoji(callback, self.id, emoji_id)
end

function guild:createEmoji(callback, payload)
	self.client:createGuildEmoji(callback, self.id, payload)
end

function guild:modifyEmoji(callback, emoji_id, payload)
	self.client:modifyGuildEmoji(callback, self.id, emoji_id, payload)
end

function guild:deleteEmoji(callback, emoji_id)
	self.client:deleteEmoji(callback, self.id, emoji_id)
end

function guild:modify(callback, payload)
	self.client:modifyGuild(callback, self.id, payload)
end

function guild:delete(callback)
	self.client:deleteGuild(callback, self.id)
end

function guild:getChannels(callback)
	self.client:getGuildChannels(callback, self.id)
end

function guild:createChannel(callback, payload)
	self.client:createGuildChannel(callback, self.id, payload)
end

function guild:modifyChannelPositions(callback, payload)
	self.client:modifyGuildChannelPositions(callback, self.id, payload)
end

function guild:getMember(callback, user_id)
	self.client:getGuildMember(callback, self.id, user_id)
end

function guild:listMembers(callback)
	self.client:listGuildMembers(callback, self.id)
end

function guild:addMember(callback, user_id, payload)
	self.client:addGuildMember(callback, self.id, user_id, payload)
end

function guild:modifyMember(callback, user_id, payload)
	self.client:modifyGuildMember(callback, self.id, user_id, payload)
end

function guild:modifyCurrentUsersNick(callback, payload)
	self.client:modifyCurrentUsersNick(callback, self.id, payload)
end

function guild:addMemberRole(callback, user_id, role_id, payload)
	self.client:addGuildMemberRole(callback, self.id, user_id, role_id, payload)
end

function guild:removeMemberRole(callback, user_id, role_id)
	self.client:removeGuildMemberRole(callback, self.id, user_id, role_id)
end

function guild:removeMember(callback, user_id, query)
	self.client:removeGuildMember(callback, self.id, user_id, query)
end

function guild:getBans(callback)
	self.client:getGuildBans(callback, self.id)
end

function guild:getBan(callback, user_id)
	self.client:getGuildBan(callback, self.id, user_id)
end

function guild:createBan(callback, user_id, query)
	self.client:createGuildBan(callback, self.id, user_id, query)
end

function guild:removeBan(callback, user_id, query)
	self.client:removeGuildBan(callback, self.id, user_id, query)
end

function guild:getRoles(callback)
	self.client:getGuildRoles(callback, self.id)
end

function guild:createRole(callback, payload)
	self.client:createGuildRole(callback, self.id, payload)
end

function guild:modifyRolePositions(callback, payload)
	self.client:modifyGuildRolePositions(callback, self.id, payload)
end

function guild:modifyRole(callback, role_id, payload)
	self.client:modifyGuildRole(callback, self.id, role_id, payload)
end

function guild:deleteRole(callback, role_id)
	self.client:deleteGuildRole(callback, self.id, role_id)
end

function guild:getPruneCount(callback, query)
	self.client:getGuildPruneCount(callback, self.id, query)
end

function guild:beginPrune(callback, payload, query)
	self.client:beginGuildPrune(callback, self.id, payload, query)
end

function guild:getVoiceRegions(callback)
	self.client:getGuildVoiceRegions(callback, self.id)
end

function guild:getInvites(callback)
	self.client:getGuildInvites(callback, self.id)
end

function guild:getIntegrations(callback)
	self.client:getGuildIntegrations(callback, self.id)
end

function guild:createIntegration(callback, payload)
	self.client:createGuildIntegration(callback, self.id, payload)
end

function guild:modifyIntegration(callback, integration_id, payload)
	self.client:modifyGuildIntegration(callback, self.id, integration_id, payload)
end

function guild:deleteIntegration(callback, integration_id)
	self.client:deleteGuildIntegration(callback, self.id, integration_id)
end

function guild:syncIntegration(callback, integration_id, payload)
	self.client:syncGuildIntegration(callback, self.id, integration_id, payload)
end

function guild:getEmbed(callback)
	self.client:getGuildEmbed(callback, self.id)
end

function guild:modifyEmbed(callback, payload)
	self.client:modifyGuildEmbed(callback, self.id, payload)
end

function guild:modifyWidget(callback, payload)
	self.client:modifyGuildWidget(callback, self.id, payload)
end

function guild:getWidget(callback)
	self.client:getGuildWidget(callback, self.id)
end

function guild:getVanityURL(callback)
	self.client:getGuildVanityURL(callback, self.id)
end

function guild:getWidgetImage(callback, query)
	self.client:getGuildWidgetImage(callback, self.id, query)
end

function guild:getWelcomeScreen(callback)
	self.client:getGuildWelcomeScreen(callback, self.id)
end

function guild:modifyWelcomeScreen(callback, payload)
	self.client:modifyGuildWelcomeScreen(callback, self.id, payload)
end

function guild:modifyOwnVoiceState(callback, payload)
	self.client:modifyOwnVoiceState(callback, self.id, payload)
end

function guild:modifyUserVoiceState(callback, user_id, payload)
	self.client:modifyUserVoiceState(callback, self.id, user_id, payload)
end

function guild:getWebhooks(callback)
	self.client:getGuildWebhooks(callback, self.id)
end

function guild:leaveGuild(callback)
	self.client:leaveGuild(callback, self.id)
end

return guild
