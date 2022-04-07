local trait do

	local _inverse = {}
	trait = setmetatable({}, {
		__index = _inverse,
	})
	trait.normal = 0
	_inverse[0] = "normal"
	trait.magic = 1
	_inverse[1] = "magic"
	trait.mutated = 2
	_inverse[2] = "mutated"
	
end

return trait