local channel = {}

function channel:modify(callback, payload)
	self.client:modifyChannel(callback, self.id, payload)
end

function channel:delete(callback)
	self.client:deleteChannel(callback, self.id)
end

function channel:getMessages(callback, query)
	self.client:getChannelMessages(callback, self.id, query)
end

function channel:createMessage(callback, payload)
	self.client:createMessage(callback, self.id, payload)
end

function channel:createReaction(callback, message_id, emoji, payload)
	self.client:createReaction(callback, self.id, message_id, emoji, payload)
end

function channel:deleteOwnReaction(callback, message_id, emoji)
	self.client:deleteOwnReaction(callback, self.id, message_id, emoji)
end

function channel:deleteUserReaction(callback, message_id, emoji, user_id)
	self.client:deleteUserReaction(callback, self.id, message_id, emoji, user_id)
end

function channel:getReactions(callback, message_id, emoji, query)
	self.client:getReactions(callback, self.id, message_id, emoji, query)
end

function channel:editMessage(callback, message_id, payload)
	self.client:editMessage(callback, self.id, message_id, payload)
end

function channel:deleteMessage(callback, message_id)
	self.client:deleteMessage(callback, self.id, message_id)
end

function channel:bulkDeleteMessages(callback, payload)
	self.client:bulkDeleteMessages(callback, self.id, payload)
end

function channel:editPermissions(callback, overwrite_id, payload)
	self.client:editChannelPermissions(callback, self.id, overwrite_id, payload)
end

function channel:getInvites(callback)
	self.client:getChannelInvites(callback, self.id)
end

function channel:createInvite(callback, payload)
	self.client:createChannelInvite(callback, self.id, payload)
end

function channel:deletePermission(callback, overwrite_id)
	self.client:deleteChannelPermission(callback, self.id, overwrite_id)
end

function channel:triggerTypingIndicator(callback, payload)
	self.client:triggerTypingIndicator(callback, self.id, payload)
end

function channel:getPinnedMessages(callback)
	self.client:getPinnedMessages(callback, self.id)
end

function channel:addPinnedMessage(callback, message_id, payload)
	self.client:addPinnedChannelMessage(callback, self.id, message_id, payload)
end

function channel:deletePinnedMessage(callback, message_id)
	self.client:deletePinnedChannelMessage(callback, self.id, message_id)
end

function channel:AddRecipient(callback, user_id, payload)
	self.client:groupDMAddRecipient(callback, self.id, user_id, payload)
end

function channel:RemoveRecipient(callback, user_id)
	self.client:groupDMRemoveRecipient(callback, self.id, user_id)
end

return channel
