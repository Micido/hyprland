---------------------
---- KEYBINDINGS ----
---------------------

local altTab = require("alttab")
local alter = require("alttaber")

local mainMod = "SUPER"

hl.bind(mainMod .. " + Q",         hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + W",         hl.dsp.window.close())
hl.bind(mainMod .. " + M",         hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space",     hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + P",         hl.dsp.window.pseudo())

hl.bind(mainMod .. " + left",      hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + right",     hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + up",        hl.dsp.layout("focus u"))
hl.bind(mainMod .. " + down",      hl.dsp.layout("focus d"))

hl.bind(mainMod .. " + F",         hl.dsp.layout("colresize +conf"))

hl.bind(mainMod .. " + comma",     hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + semicolon", hl.dsp.layout("consume_or_expel next"))

-- hl.bind("ALT + TAB",   alter.next,  { submap_universal = true })
-- hl.bind("ALT + SHIFT", alter.prev,  { submap_universal = true })
-- hl.bind("ALT + Alt_L", alter.close, { release = true, transparent = true })
-- hl.bind("ALT + Alt_R", alter.close, { release = true, transparent = true })

if hl.plugin.scrolloverview ~= nil then
	hl.bind("ALT + Tab",   altTab.next,  { submap_universal = true })
	hl.bind("ALT + Alt_L", altTab.close, { release = true, transparent = true })
	hl.bind("ALT + Alt_R", altTab.close, { release = true, transparent = true })

	hl.bind(mainMod .. " + G ", function ()
		hl.config({
			plugin = {
				scrolloverview = {
					layout = "vertical",
					scale = 0.6
				}
			}
		})
		hl.plugin.scrolloverview.overview("toggle all")
	end)

	hl.define_submap("scrolloverview", function()
    hl.bind("left",   hl.plugin.scrolloverview.navigate("left"))
    hl.bind("right",  hl.plugin.scrolloverview.navigate("right"))
    hl.bind("up",     hl.plugin.scrolloverview.navigate("up"))
    hl.bind("down",   hl.plugin.scrolloverview.navigate("down"))
    hl.bind("return", hl.plugin.scrolloverview.overview("off"))
    hl.bind("escape", hl.plugin.scrolloverview.overview("off"))
    hl.bind("mouse:272", function()
        hl.plugin.scrolloverview.overview("select")
        hl.plugin.scrolloverview.window("select")
        hl.plugin.scrolloverview.overview("off")
    end, { mouse = true })
    hl.bind("mouse:274", hl.plugin.scrolloverview.window("close"), { mouse = true })
	end)
end

hl.gesture({ fingers = 3, direction = "horizontal", action = "scroll_move" })
hl.gesture({ fingers = 3, direction = "vertical",   action = "workspace"   })

for i = 1, 10 do
    local key = i - 1
    hl.bind(mainMod .. " + code:1" .. key,         hl.dsp.focus({ workspace = i}),        { submap_universal = true })
    hl.bind(mainMod .. " + SHIFT + code:1" .. key, hl.dsp.window.move({ workspace = i }), { submap_universal = true })
end

hl.bind(mainMod .. " + S",				  hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S",  hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272",  hl.dsp.window.drag(),   { mouse = true, submap_universal = true })
hl.bind(mainMod .. " + mouse:273",  hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
