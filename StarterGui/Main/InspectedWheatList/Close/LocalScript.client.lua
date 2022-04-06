script.Parent.Activated:Connect(function()
	
	script.Parent.Parent.Parent.Darker.Visible = false
	script.Parent.Parent:TweenSize(UDim2.new(0,0,0.4,0),Enum.EasingDirection.InOut,Enum.EasingStyle.Sine,0.2)
	
	wait(0.23)
	

	script.Parent.Parent.Visible = false
	
end)