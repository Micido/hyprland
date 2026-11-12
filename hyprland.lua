local handle = io.popen("hostname")
Hostname = "Unknown"

if handle then
	local res = handle:read('*l')
	handle:close()
	if res then
		Hostname = res:gsub("%s+", "")
	end
end

require("autoload")("modules")

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/configuring/core/autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
  hl.exec_cmd("hyprpaper")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "BreezeX-RosePine-Linux")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


