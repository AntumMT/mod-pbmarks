project = "pbmarks"
title = "Personal Bookmarks"
format = "markdown"
not_luadoc = true
boilerplate = false

file = {"settings.lua", "api.lua", "formspec.lua",}

new_type("setting", "Settings")

custom_tags = {
	{
		"settype",
		title = "Type",
	},
	{
		"default",
		title = "Default value",
	},
}
