local UI = game.Players.LocalPlayer.PlayerGui:WaitForChild("Main")
local PlayerDataEventTypes = require(game.ReplicatedStorage.Gen.PlayerDataEventTypes)
local deb = false

game.ReplicatedStorage.OnPlayerDataUpdate.OnClientEvent:Connect(function(PlayerData, Type)
	
	if (Type ~= PlayerDataEventTypes.Any and Type ~= PlayerDataEventTypes.CapacityChange) and deb == true then return end
	
	deb = true
	
	game.Players.LocalPlayer.PlayerGui.Main.CapacityFrame.DecoProgress.Masking:TweenSize(UDim2.new(
		math.min((PlayerData.Capacity /
			PlayerData.MaxCapacity),1), 
		0, 0.15, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine ,0.1)

	game.Players.LocalPlayer.PlayerGui.Main.CapacityFrame.CapacityText.Text = 
		require(game.ReplicatedStorage.MoneyLib).shorten(PlayerData.Capacity).."/"..require(game.ReplicatedStorage.MoneyLib).shorten(PlayerData.MaxCapacity)
	
	deb = false

end)


--[[Inventory.ResearchPoints:GetPropertyChangedSignal("Value"):Connect(function()

	game.Players.LocalPlayer.PlayerGui.Main.RightBottomFrame.ResearchPointsFrame.ResearchPointsText.Text =
		require(game.ReplicatedStorage.MoneyLib).shorten(Inventory.ResearchPoints.Value)
	game:GetService("TweenService"):Create(
	game.Players.LocalPlayer.PlayerGui.Main.RightBottomFrame.ResearchPointsFrame.ResearchPointsText,
	TweenInfo.new(
		0.05,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.InOut
	),
	{
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}

	):Play()
	wait(0.05)	
	game:GetService("TweenService"):Create(
	game.Players.LocalPlayer.PlayerGui.Main.RightBottomFrame.ResearchPointsFrame.ResearchPointsText,
	TweenInfo.new(
		0.05,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.InOut
	),
	{
		BackgroundColor3 = Color3.fromRGB(55, 209, 255),
	}

	):Play()

end)]]--

--[[Inventory.Capacity:GetPropertyChangedSignal("Value"):Connect(function()

	game.Players.LocalPlayer.PlayerGui.Main.TopFrame.CapacityFrame.CapacityText.Text = 
		require(game.ReplicatedStorage.MoneyLib).shorten(Inventory.Capacity.Value).."/"..require(game.ReplicatedStorage.MoneyLib).shorten(Inventory.Max_Capacity.Value)

	game.Players.LocalPlayer.PlayerGui.Main.TopFrame.CapacityFrame.DecoProgress.Masking:TweenSize(UDim2.new(
		math.min((Inventory.Capacity.Value/
			Inventory.Max_Capacity.Value),1), 
		0, 0.15, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine ,0.1)

	spawn(function()

		if game.Players.LocalPlayer.IsSelling.Value then return end
		game:GetService("TweenService"):Create(
		game.Players.LocalPlayer.PlayerGui.Main.TopFrame.CapacityFrame.DecoProgress.Masking.Progress,
		TweenInfo.new(
			0.05,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.InOut
		),
		{
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}

		):Play()
		wait(0.05)	
		game:GetService("TweenService"):Create(
		game.Players.LocalPlayer.PlayerGui.Main.TopFrame.CapacityFrame.DecoProgress.Masking.Progress,
		TweenInfo.new(
			0.05,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.InOut
		),
		{
			BackgroundColor3 = Color3.fromRGB(152, 255, 161),
		}

		):Play()




	end)

end)]]--