-----------------------
---- LOOK AND FEEL ----
-----------------------

local cs = require("rose-pine")

hl.config({
	general = {
		gaps_in  = 5,
		gaps_out = 20,

		border_size = 1,

		col = {
			active_border   = {
				colors = {
					cs.rose,
					cs.pine,
					cs.love,
					cs.iris
				},
				angle = 90
			},
			inactive_border = cs.muted,
		},

		resize_on_border = false,

		allow_tearing = false,

		layout = "scrolling",
	},

	decoration = {
		rounding       = 0,
		rounding_power = 1,

		active_opacity   = 1.0,
		inactive_opacity = 1.0,
		dim_inactive     = true,

		shadow = {
			enabled      = false,
			range        = 4,
			render_power = 3,
			color        = cs.subtle,
		},

		blur = {
			enabled   = true,
			size      = 3,
			passes    = 1,
			vibrancy  = 0.1696,
		},
	},

	animations = {
	    enabled = true,
	},
})

hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
		explicit_column_widths = "0.5, 1.0"
	},
})

if hl.plugin.scrolloverview ~= nil then
	hl.config({
		plugin = {
			scrolloverview = {
				gesture_distance = 200,
				scale = 0.7,
				workspace_gap = 50,
				layout = "vertical",
				wallpaper = 2,
				blur = true,
				shadow = { enabled = false }
			}
		}
	})
end
