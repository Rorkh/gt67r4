local turbo = require("turbo")

local backend = {}

function backend.request(method, url, headers, payload, callback)	
	local inst = turbo.ioloop.instance()

	inst:add_callback(function()
		local res = coroutine.yield(turbo.async.HTTPClient({verify_ca=false}):fetch(url, {
			body = payload,
			user_agent = headers['User-Agent'],

			method = method,
			on_headers = function(h)
				for k, v in pairs(headers) do
					h:add(k, v)
				end
			end
		}))
		
		if callback then callback(res.body) end

		inst:close()
	end)

	inst:start()
end

return backend