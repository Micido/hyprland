
local curves = {
	-- Overshoot
	{ name = "heavyOverShoot",     points = { {0.53, 0.51},  {0.4, 1.22}  } },
	{ name = "lightOvershoot",     points = { {0.33, 0.61},  {0.63, 1.19} } },

	-- Linear
	{ name = "linear",             points = { {0, 0},        {1, 1}       } },
	{ name = "almostLinear",       points = { {0.5, 0.5},    {0.75, 1}    } },
	{ name = "smoothSnap",         points = { {0.32, 0.51},  {0.44, 1}    } },
	{ name = "smoothIn",           points = { {0.25, 1},     {0.5, 1}     } },
	{ name = "smoothOutOvershoot", points = { {0.46, -0.25}, {0.81, 0.51} } },
	{ name = "easeOutQuint",       points = { {0.23, 1},     {0.32, 1}    } },
	{ name = "easeInOutCubic",     points = { {0.65, 0.05},  {0.36, 1}    } },
	{ name = "quick",              points = { {0.15, 0},     {0.1, 1}     } },

	-- Springs
	{ name = "hardSpring",    kind = "spring" },
	{ name = "mediumSpring",  kind = "spring", stiffness = 50, dampening = 10 },
	{ name = "heavierSpring", kind = "spring", stiffness = 50, dampening = 11, mass = 1.3 },
	{ name = "looseSpring",   kind = "spring", stiffness = 50, dampening = 5 },
}

for _, curve in ipairs(curves) do
	if curve.points then
		hl.curve(
			curve.name, {
				type = "bezier",
				points = curve.points
			}
		)
	elseif curve.kind == "spring" then
		hl.curve(
			curve.name, {
				type = "spring",
				mass = curve.mass or 1,
				stiffness = (curve.stiffness or 70) + 430,
				dampening = (curve.dampening or 10) + 26
			}
		)
	end
end

hl.animation({ leaf = "global",        enabled = true,  speed = 2,    bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 2,    bezier = "smoothIn" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint",   style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",         style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 2,    spring = "heavierSpring"})
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 2,    bezier = "heavyOverShoot", style = "popin 30%"})
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "heavyOverShoot", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear",   style = "slidefadevert" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear",   style = "slidefadevert" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
