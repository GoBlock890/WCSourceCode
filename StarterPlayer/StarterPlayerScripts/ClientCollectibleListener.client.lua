game.ReplicatedStorage.SpawnClientCollectible.OnClientEvent:Connect(function(model, _id, position)
	
	print(_id)
	local Collectible = model:clone()
	Collectible.Massless = true
	Collectible.Anchored = false
	Collectible.Position = position
	Collectible.Parent = game.Players.LocalPlayer.Character.Parent
	
	local Force = Instance.new("BodyVelocity")
	Force.Parent = Collectible
	Force.Velocity = Vector3.new(math.random(-20, 20), 300000, math.random(-20, 20))
	wait(0.1)
	Force:Destroy()
	
	Collectible.Touched:connect(function(touched)
		
		if touched.Parent:FindFirstChildWhichIsA("Humanoid") then
		
			game.ReplicatedStorage.ClaimCollectible:FireServer(_id)
			Collectible:Destroy()
			
			
		end
		
	end)

	
	
end)