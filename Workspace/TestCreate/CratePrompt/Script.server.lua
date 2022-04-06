


script.Parent.Triggered:Connect(function(plr)
	
	
	game.ReplicatedStorage.BuyRegisteredCrate:Invoke(plr, 1, script.Parent.Parent.Position + Vector3.new(0, 3.5 ,0))
	
	
end)