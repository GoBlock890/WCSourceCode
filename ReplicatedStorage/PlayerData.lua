local _Data = {
	
	Items = {},
	
	Wheats = {},
	
	Equipments = {},
	
	Drones = {},
	
}



local server = {
	
	Get = function()
		
		return _Data;
		
	end,
	
	
	Update = function(Player : Players, Type : string)
		
		game.ReplicatedStorage.OnPlayerDataUpdate:FireClient(Player, _Data, Type)
		
	end,
	
	
}

local client = {
	
	Get = function()
		
		return game.ReplicatedStorage.PlayerDataToLocalTable:InvokeServer(game.Players.LocalPlayer);
		
	end,
	
}

return game:GetService("RunService"):IsServer() and server or client