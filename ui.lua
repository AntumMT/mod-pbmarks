
local S = core.get_translator(pbmarks.modname)

local ui_handlers = {
	"i3",
	"sfinv_buttons",
	"unified_inventory",
}

local handler_available = false


if core.global_exists("i3") then
	i3.new_tab({
		name = pbmarks.modname,
		description = S("Personal Bookmarks"),
		formspec = function(player, data, fs)
			-- FIXME:
			--   - use i3 widgets
			--   - inventory widgets are missing after close
			i3.set_tab(player, "inventory")
			pbmarks.show_formspec(player:get_player_name(), {noback=true})
		end,
	})

	handler_available = true
end

if core.global_exists("sfinv_buttons") then
	sfinv_buttons.register_button(pbmarks.modname, {
		title = S("Personal Bookmarks"),
		image = "pbmarks_check.png",
		action = function(player)
			pbmarks.show_formspec(player:get_player_name())
		end,
	})

	handler_available = true
end

if core.global_exists("unified_inventory") then
	unified_inventory.register_button(pbmarks.modname, {
		type = "image",
		image = "pbmarks_check.png",
		tooltip = S("Personal Bookmarks"),
		action = function(player)
			pbmarks.show_formspec(player:get_player_name())
		end,
	})

	handler_available = true
end

if not handler_available then
	pbmarks.log("warning", "compatible UI handler not available, please install one of "
		.. core.serialize(ui_handlers):gsub("return ", ""))
	return
end
