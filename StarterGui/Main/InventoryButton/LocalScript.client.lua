script.Parent.MouseButton1Click:Connect(function()
	
	if script.Parent.Parent.Inventory.Visible == true then return end
	
	script.Parent.Parent.Inventory.Size = UDim2.new(0,0,0.3,0)

	script.Parent.Parent.Inventory.Visible = true
	script.Parent.Parent.Darker.Visible = true
	
	script.Parent.Parent.Inventory:TweenSize(UDim2.new(0.6,0,0.4,0),Enum.EasingDirection.Out,Enum.EasingStyle.Back, 0.4)
	
	
end)