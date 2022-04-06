local Cache = require(game.ReplicatedStorage.Cache.Collectible)



game.ReplicatedStorage.ClaimCollectible.OnServerEvent:Connect(function(plr, id)
	
	print(Cache.Get()[id])
	Cache.Remove(id)
	
end)