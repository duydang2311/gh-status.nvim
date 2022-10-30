local curl = require'plenary.curl'

local token = ''
local username = ''

local function setup(option)
	if option.token ~= nil then
		token = option.token
	end
	if option.username ~= nil then
		username = option.username
	end
end

local function changeUserStatus(message)
	local body = {
		query =
			'mutation { \
				changeUserStatus(input:{clientMutationId:"' .. username .. '",message:"' .. message .. '"}) { \
					clientMutationId \
					status { \
						message \
						expiresAt \
						emoji \
						emojiHTML \
					} \
				} \
			}'
	}
	local res = curl.post('https://api.github.com/graphql', {
		body = vim.fn.json_encode(body),
		headers = {
			content_type = "application/json",
			authorization = 'Bearer ' .. token
		},
	})
	print('gh-status: code ' .. res.status .. ' - ' .. vim.fn.json_decode(res.body).data.changeUserStatus.status.message)
end

return {
	changeUserStatus = changeUserStatus,
	setup = setup
}

