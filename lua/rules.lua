--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
	-- Yes
	name = "everything starts looong",
	match = {
		class = "*",
	},

	scrolling_width = 1.0,
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name  = "fix-xwayland-drags",
	match = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},

	no_focus = true,
})

hl.window_rule({
	-- Hyprland-run windowrule
	name  = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move  = "20 monitor_h-120",
	float = true,
})
