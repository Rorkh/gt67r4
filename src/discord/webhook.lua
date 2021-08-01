local webhook = {}

function webhook:modify(callback, payload)
	self.client:modifyWebhook(callback, self.id, payload)
end

function webhook:modifyWithToken(callback, payload)
	self.client:modifyWebhookWithToken(callback, self.id, self.token, payload)
end

function webhook:delete(callback)
	self.client:deleteWebhook(callback, self.id)
end

function webhook:deleteWithToken(callback)
	self.client:deleteWebhookWithToken(callback, self.id, self.token)
end

function webhook:executeSlack(callback, payload)
	self.client:executeSlackCompatibleWebhook(callback, self.id, self.token, payload)
end

function webhook:executeGitHub(callback, payload)
	self.client:executeGitHubCompatibleWebhook(callback, self.id, self.token, payload)
end

return webhook
