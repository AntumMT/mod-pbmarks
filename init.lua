
pbmarks = {}
pbmarks.modname = core.get_current_modname()
pbmarsk.modpath = core.get_modpath(pbmarks.modname)

function pbmarks.log(lvl, msg)
	if not msg then
		msg = lvl
		lvl = nil
	end

	msg = "[" .. pbmarks.modname .. "] " .. msg
	if not lvl then
		core.log(msg)
	else
		core.log(lvl, msg)
	end
end
