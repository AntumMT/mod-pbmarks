
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
