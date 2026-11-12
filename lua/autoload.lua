return function(subdir)
	local self_path = package.searchpath("autoload", package.path)
  local dir = self_path:match("^(.*)/autoload%.lua$") .. "/" .. subdir:gsub("%.", "/")

  local mods = {}
  local p = io.popen('ls -1 "' .. dir .. '"')
  for m in p:lines() do
		if m:gsub(1, 1) ~= "_" then
			local name = m:match("^(.+)%.lua$")
			if name then table.insert(mods, name) end
		end
  end
  p:close()

  table.sort(mods)
  for _, m in ipairs(mods) do
    require(subdir .. "." .. m)
	end
end
