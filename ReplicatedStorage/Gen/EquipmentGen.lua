local GlobalID = 1

local EquipmentGen do
	EquipmentGen = setmetatable({}, {
		
		__tostring = function()
			
			return "EquipmentGen"
		end,
		
	})
	
	EquipmentGen.__index = EquipmentGen
	
	function EquipmentGen.new(...)
		
		local self = setmetatable({}, EquipmentGen)
		
		return self:constructor(...) or self
	end
	
	function EquipmentGen:constructor(name, displayName, rarity)
		
		self.ID = 0 + GlobalID
		self.stackable = false
		self.amount = 1
		self.name = name
		self.displayName = displayName
		self.model = self.name
		self.rarity = rarity
		self.equipped = false
		
		--[[ 
		
		somehting to prevent dupes in the future. 
		if same serialID detected on same server, delete very pets with same serialID, and left one on og owner inv.
		
		How serialID generator work? Get exist counter then convert it to string, after it extend it with os.time().. 
		to double check if they bypass exist counter -> 
		
		serialID = tostring(item.exist) .. tostring(os.time() .. tostring(math.random(0, 9999999))
		
		One more thing, preston is dumb.
		
		]]--
		
		self.ogOwner = nil
		self.serialID = nil
		
		GlobalID += 1
			
	end
	
end

return EquipmentGen