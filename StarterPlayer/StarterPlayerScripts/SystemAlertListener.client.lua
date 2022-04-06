game.ReplicatedStorage.SystemAlert.OnClientEvent:Connect(function(message,color)
	
	game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage",{
		Text = message;
		Color = color;
	})
	
	
end)


