local backend = {}

function backend.request(method, url, headers, payload, callback)
	cUrlClient:Request(method, url, {
		OnStatusLine = function(self) self.data = "" end,
		OnBodyData = function(self, body) self.data = self.data .. body end,
		OnBodyFinished = function(self) if callback then callback(self.data) end end
	}, headers, payload, {})
end

return backend