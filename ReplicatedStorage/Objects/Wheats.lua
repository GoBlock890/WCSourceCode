--gave up using manual class. Bit laggy, But Shhhhh! idc (roblox-ts op)
local Rarity = require(game.ReplicatedStorage.Gen.Rarity)
local Traits = require(game.ReplicatedStorage.Gen.WheatTraits)
local WheatType = require(game.ReplicatedStorage.Types.WheatType)


local Wheats do
	
	Wheats = setmetatable({}, {
		__tostring = function()
			
			return "Wheats#classOn" .. script.Name
		end,
	})
	
	Wheats.__index = Wheats
	
	--[[
		
		Self implement Objects of WheatType Class
		

		@returns this/self
	]]	
	function Wheats.register(...)
		
		local self = setmetatable({}, Wheats)
		
		return self:const(...) or self
	end
	
	function Wheats:const(...)
		
		self.BasicWheat = WheatType.new("BasicWheat", "Basic Wheat", 10 , Traits.normal, Rarity.Common)
		self.InDevWheat = WheatType.new("InDevWheat", "InDev Wheat", 100, Traits.mutated, Rarity.Legendary)
		self.ProWheat = WheatType.new("ProWheat", "Pro Wheat", 1000, Traits.magic, Rarity.Epic) 
		
	end
	
end


return Wheats