game.ReplicatedStorage.PlayerDataToLocalTable.OnServerInvoke = function(plr)
	
	local data = require(plr:WaitForChild("PlayerData")).Get()
	
	if data == nil then error("Data from " .. plr.Name .. " Are not implemented or an error occurred.") end
	
	return require(plr.PlayerData).Get()
	
end