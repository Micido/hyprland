local M = {}

local SessionOrder = nil
local FocusIndex = 0

function GetSessionOrder()
	local windows = hl.get_windows()
	local order = {}
	for _, w in ipairs(windows) do
		order[w.focus_history_id] = w.pid
	end
	return order
end

function M.close()
	SessionOrder = nil
	FocusIndex = 0
end

function M.prev()
	if FocusIndex == 0 or SessionOrder == nil then return end
	FocusIndex = FocusIndex - 1
	hl.dispatch(hl.dsp.focus({ window = "pid:" .. SessionOrder[FocusIndex] }))
end

function M.next()
	if SessionOrder == nil then
		SessionOrder = GetSessionOrder()
	end
	FocusIndex = FocusIndex + 1
	FocusIndex = FocusIndex % (#SessionOrder + 1)
	hl.dispatch(hl.dsp.focus({ window = "pid:" .. SessionOrder[FocusIndex] }))
	end

return M
