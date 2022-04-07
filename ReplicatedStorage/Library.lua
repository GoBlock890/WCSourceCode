local module = {}

module.ternary = function(boolean,True,False)

	if boolean then
		return True
	else
		return False
	end	

end

module.round = function (number, precision)
	local fmtStr = string.format('%%0.%sf',precision)
	number = string.format(fmtStr,number)
	return number
end

module.chance = function(percent)
	assert(percent >= 0 and percent <= 100)
	return percent >= (math.random() * 100)
end


return module
