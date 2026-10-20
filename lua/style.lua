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

hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

if hl.plugin.scrolloverview ~= nil then
	hl.config({
		plugin = {
			scrolloverview = {
				gesture_distance = 300,
				scale = 0.5,
				workspace_gap = 100,
				layout = "vertical",
				wallpaper = 2,
				blur = true,
				shadow = { enabled = false }
			}
		}
	})
end
