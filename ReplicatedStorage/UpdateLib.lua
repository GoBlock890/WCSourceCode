local module = {}

module.updateCapacity = function(plr)
	
	plr.PlayerGui.Main.CapacityFrame.DecoProgress.Masking:TweenSize(UDim2.new(
		math.min((plr.Inventory.Capacity.Value/
			plr.Inventory.MaxCapacity.Value),1), 
		0, 0.15, 0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine ,0.1)

	plr.PlayerGui.Main.CapacityFrame.CapacityText.Text = 
		require(game.ReplicatedStorage.MoneyLib).shorten(plr.Inventory.Capacity.Value).."/"..require(game.ReplicatedStorage.MoneyLib).shorten(plr.Inventory.MaxCapacity.Value)
	
	print(plr)
	
end

return module
