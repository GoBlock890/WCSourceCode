script.Parent.Activated:Connect(function()
	
	script.Parent.Parent.Parent.InspectedWheatList.Size = UDim2.new(0,0,0.3,0)
	
	script.Parent.Parent.Parent.Darker.Visible = true
	script.Parent.Parent.Parent.InspectedWheatList.Visible = true
	script.Parent.Parent.Parent.InspectedWheatList.Description.Icon.Visible = false
	script.Parent.Parent.Parent.InspectedWheatList.Description.Label.Visible = false
	script.Parent.Parent.Parent.InspectedWheatList.Description.Rarity.Visible = false
	
	script.Parent.Parent.Parent.InspectedWheatList:TweenSize(UDim2.new(0.7,0,0.4,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine, 0.2)
	
end)