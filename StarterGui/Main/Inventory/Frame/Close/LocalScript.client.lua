script.Parent.Activated:Connect(function()
	
	script.Parent.Parent.Parent.Parent.Darker.Visible = false
	
	script.Parent.Parent.Parent:TweenSize(UDim2.new(0,0,0.2,0),Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
	
	wait(0.2)
	
	script.Parent.Parent.Parent.Visible = false
	
end)