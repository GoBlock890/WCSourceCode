--gave up using manual class. Bit laggy, But Shhhhh! idc (roblox-ts op)
local WheatType do
	
	WheatType = setmetatable({}, 
	{
		__tostring = function()
			
			return "WheatType#classOn" .. script.Parent.Name
		end,
	})
	
	WheatType.__index = WheatType
	
	function WheatType.new(...)
		
		local self = setmetatable({}, WheatType)
		
		return self:constructor(...) or self
	end
	
	function WheatType:constructor(name, displayname, hardness, trait, rarity)
		
		self.stackable = false
		self.amount = 0
		self.name = name
		self.displayname = displayname
		self.trait = trait
		self.hardness = hardness
		self.rarity = rarity

	end
	
	
	
end

return WheatType