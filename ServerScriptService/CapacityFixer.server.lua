--[[while wait() do
	
	for i,v in pairs(game.Players:GetChildren()) do
		local Inventory = require(vPlayerData).Get()

		Inventory.Capacity = 
			math.clamp(Inventory.Capacity, 0, Inventory.MaxCapacity)
		
	end
	
end]]--