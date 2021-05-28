
function pbmarks.read(pname)
	local data = wdata.read(pbmarks.modname)
	if not data then return end

	return data[pname]
end


function pbmarks.write(pname, marks)
	local data = wdata.read(pbmarks.modname)
	if not data then
		data = {}
	end

	data[pname] = marks
	wdata.write(pbmarks.modname, data)
end

function pbmarks.show_formspec(pname)
	core.show_formspec(pname, pbmarks.modname, pbmarks.get_formspec(pbmarks.read(pname)))
end
