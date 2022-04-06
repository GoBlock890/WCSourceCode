script.Parent.MouseButton1Click:Connect(function(p)
	
	if script.Parent.Parent.WhichItem.Value == 0 then return end
		
	game.Players.LocalPlayer.EquipToolFromClient:FireServer(script.Parent.Parent.WhichItem.Value)
	
	script.Parent.ImageColor3 = Color3.fromRGB(255, 107, 107)
	script.Parent.TextLabel.Text = "Equipped"
	
end)