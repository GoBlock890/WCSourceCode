script.Parent.ProximityPrompt.PromptButtonHoldBegan:Connect(function()
	
	local sfx = script.Parent.SFX
	sfx.TimePosition = 0.35
	sfx:Play()
	
end)


script.Parent.ProximityPrompt.Triggered:Connect(function(p)
	
	p.Inventory.ResearchPoints.Value += 50
	
	script.Parent.SFX2.TimePosition = 0.5
	script.Parent.SFX2:Play()
	
	script.Parent.ProximityPrompt:Destroy()
	spawn(function()
		
		local i = script.BodyForce:Clone()
		i.Parent = script.Parent
		wait(0.05)
		i:Destroy()
	end)
	
	game.ReplicatedStorage.TextIndicator:FireClient(p,
		"+"..tostring(50).." Research Points",
			script.Parent.Position + Vector3.new(0,1.5,0),
				Color3.fromRGB(55, 209, 255),UDim2.new(5.25,0,0.5,0),1.5,Enum.EasingStyle.Sine)
	
	game:GetService("TweenService")
	:Create(script.Parent, TweenInfo.new(1.5,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut), 
		{Transparency = 1}):Play()
	
	for i,v in pairs(script.Parent:GetChildren()) do
		
		if v:IsA("Texture") then
			
			game:GetService("TweenService")
			:Create(v, TweenInfo.new(1.5,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut), 
				{Transparency = 1}):Play()
			
		end
		
		
	end
	
	
	wait(1.5)
	script.Parent:Destroy()
	
end)