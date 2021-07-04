project = "pbmarks"
title = "Personal Bookmarks"
format = "markdown"
not_luadoc = true
boilerplate = false

file = {"settings.lua", "api.lua", "formspec.lua", "chat.lua"}

new_type("setting", "Settings")
new_type("chatcmd", "Chat Commands")

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
