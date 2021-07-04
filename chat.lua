
--- Personal Bookmarks Chat Commands
--
--  @module chat.lua

local S = core.get_translator(pbmarks.modname)


--- Display formspec via chat command.
--
-- FIXME: i3 inventory opens sometimes after pressing "close"
--
--  @chatcmd pbmarks
core.register_chatcommand(pbmarks.modname, {
	description = S("Display personal bookmarks formspec."),
	func = function(name, param)
		pbmarks.show_formspec(name, {noback=true})
		return true
	end,
})
