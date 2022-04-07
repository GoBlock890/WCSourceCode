local ToolType do
	
	local super = require(game.ReplicatedStorage.Gen.EquipmentGen)
	
	ToolType = setmetatable({}, {
		
		__tostring = function()
			
			return "ToolType#classOf" .. script.Parent.Name
		end,
		
		__index = super,
		
	})
	
	ToolType.__index = ToolType
	
	function ToolType.new(...)
		
		local self = setmetatable({}, ToolType)
		
		return self:constructor(...) or self
	end
	
	function ToolType:constructor(name, displayName, collectamount, scopeRate, powers, abilities, rarity)
		
		super.constructor(self, name, displayName, rarity)
		self.collectAmount = 1
		self.scopeRate = 0.1
		self.collectAmount = collectamount
		self.scopeRate = scopeRate
		self.abilities = abilities
		self.powers = powers
		
	end
	
end

return ToolType