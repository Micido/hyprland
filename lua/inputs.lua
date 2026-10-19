---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout  = "fr",
		follow_mouse = 1,

		sensitivity = 0,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true
		},
	},
	cursor = {
		inactive_timeout = 2,
		hide_on_key_press = true,
		warp_on_change_workspace = 1,
		warp_on_toggle_special = 1,
		persistent_warps = true,
	}
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "workspace"
})
