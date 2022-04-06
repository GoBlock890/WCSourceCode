local Boxs = game.ReplicatedStorage.Box:GetChildren()

while wait(math.random(1,2)) do
	
	if game.Lighting.ClockTime >= 18 or game.Lighting.ClockTime >= 0 and game.Lighting.ClockTime <= 3 then
		
		game.ReplicatedStorage.NightTime.Value = true
			
			print("New Box Spawned")
			local box = Boxs[math.random(1,#Boxs)]:Clone()
			box.Parent = game.Workspace
			box.Script.Disabled = false
			wait(300)
			box:Destroy()
		
		
		else
		
		game.ReplicatedStorage.NightTime.Value =false
		
	end
	
	if game.ReplicatedStorage.NightTime.Value then


		game.ReplicatedStorage.SystemAlert:FireAllClients("Night time are coming! Boxes going to falls from sky.",Color3.fromRGB(45, 118, 255))


	end

end