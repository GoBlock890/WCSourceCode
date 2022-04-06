local TweenLib = require(game.ReplicatedStorage.TweenLibrary)
game.ReplicatedStorage.TextIndicator.OnClientEvent:Connect(function(text,Position,Color,Size,Lifetime,EasingStyle)
	
	local h = game.ReplicatedStorage.Indicator:Clone()
	h.Parent = game.Workspace
	h.Position = Position
	h.screen.label.Text = text
	h.screen.Active = true
	h.screen.label.TextColor3 = Color
	h.screen.label.Size = Size
	h.screen.label.TextTransparency = 0
	

	TweenLib.Move(0,4,0,h,Lifetime,EasingStyle,Enum.EasingDirection.Out)

	game:GetService("TweenService")
		:Create(h.screen.label, TweenInfo.new(Lifetime,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut), 
			{TextTransparency = 1}):Play()

	wait(Lifetime)

	h:Destroy()
	
end)