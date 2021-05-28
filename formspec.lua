
local width = 10
local height = 8

local title = "Personal Bookmarks"


function pbmarks.get_formspec(marks)
	marks = marks or {}

	-- somewhat center title
	local title_x = math.floor(width / 2) - (math.floor(string.len(title)) / 10)

	local formspec = "formspec_version[4]"
		.. "size[" .. tostring(width) .. "," .. tostring(height) .. "]"
		.. "label[" .. tostring(title_x) .. ",0.5;" .. title .. "]"

	local init_y = 1.5 -- horizontal position of first bookmark
	for idx = 1, pbmarks.max do
		local bmdata = marks[idx] or {}
		local label = bmdata.lable or ""
		local pos = bmdata.pos or ""

		local fname = "input" .. tostring(idx)
		local btn_go = "btn_go" .. tostring(idx)
		local btn_set = "btn_set" .. tostring(idx)
		formspec = formspec
			.. "field[0.5," .. tostring(init_y) .. ";3,0.75;" .. fname .. ";;" .. label .. "]"
			.. "field_close_on_enter[" .. fname .. ";false]"
			.. "label[3.75," .. tostring(init_y) + 0.25 .. ";" .. pos .. "]"
			.. "button[6.25," .. tostring(init_y) .. ";1.5,0.75;" .. btn_go .. ";Go]" -- TODO: change to "button_exit"
			.. "button[8," .. tostring(init_y) .. ";1.5,0.75;" .. btn_set .. ";Set]"

		init_y = init_y + 1.25
	end

	return formspec
end
