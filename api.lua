
local S = core.get_translator(pbmarks.modname)

-- initialize bookmarks
local bookmarks = wdata.read("personal_bookmarks") or {}

local function update_pbmfile()
	wdata.write("personal_bookmarks", bookmarks)
end

local function can_access(pos, pname) return true end
local function get_owner(pos) return "" end

if core.global_exists("s_protect") then
	can_access = s_protect.can_access
	get_owner = function(pos)
		local claim = s_protect.get_claim(pos)
		if claim then return s_protect.get_claim(pos).owner end

		return ""
	end
end


function pbmarks.get(pname, idx)
	return (bookmarks[pname] or {})[idx]
end


function pbmarks.set(pname, idx, label, pos)
	-- check for protection
	if pbmarks.disallow_protected and not can_access(pos, pname) then
		core.chat_send_player(pname, S("You cannot set bookmarks in areas owned by @1.", get_owner(pos)))
		return
	end

	idx = idx or 1

	local pbm = bookmarks[pname] or {}
	pbm[idx] = {
		label = label,
		pos = pos,
	}

	bookmarks[pname] = pbm
	update_pbmfile()
end


function pbmarks.unset(pname, idx)
	if not idx or idx < 1 or idx > pbmarks.max then
		pbmarks.log("error", "cannot unset bookmark, invalid index: " .. tostring(idx))
		return
	end

	local pbm = bookmarks[pname]
	if not pbm then
		pbmarks.log("error", "cannot unset bookmark, player not found: " .. pname)
		return
	end

	pbm[idx] = nil
	bookmarks[pname] = pbm
	update_pbmfile()
end


function pbmarks.show_formspec(pname)
	core.show_formspec(pname, pbmarks.modname, pbmarks.get_formspec(pname))
end
