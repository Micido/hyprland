return function(subdir)
	local self_path = package.searchpath("autoload", package.path)
	local dir = self_path:match("^(.*)/autoload.lua$") .. "/".. subdir:gsub("%.", "/")

	local modules = {}
	local p = io.popen('ls -1 "' .. dir '"')
	for entry in p:lines() do
		if entry:gsub(1, 1) ~= "_" then
			local module = entry:match("^(.+)%.lua")
			if module then
				table.insert(modules, module)
			end
		end
	end

	table.sort(modules)

	for _, m in ipairs(modules) do
		require(dir .. "." .. m)
	end
end
