local TweenLib = require(game.ReplicatedStorage.TweenLibrary)
local e = script.Parent:WaitForChild("CapacityIndicator")
local UserInputService = game:GetService("UserInputService")

local hold = false

script.Parent:WaitForChild("CapacityIndicator"):GetPropertyChangedSignal("Value"):Connect(function()

	if e.Value > 0 then

		local h = game.ReplicatedStorage.Indicator:Clone()
		h.Parent = game.Workspace
		h.Position = script.Parent.ScopeArea.Position
		h.screen.label.Text = "+".. require(game.ReplicatedStorage.MoneyLib).shorten(e.Value)
		h.screen.Active = true
		h.screen.label:TweenSize(UDim2.new(
			0, 0, 0, 0),
				Enum.EasingDirection.InOut,Enum.EasingStyle.Sine , 1)
		
		TweenLib.Move(0,4,0,h,0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
	

		
		wait(1)
		
		h:Destroy()
		
	end	
	
end)

local hold = false

UserInputService.InputBegan:Connect(function(input)
	
	if (input.UserInputType == Enum.UserInputType.MouseButton1) and not script.Parent.Parent:IsA("Backpack") then
		
		hold = true

		spawn(function()
			while wait() do
				
				if not hold then break end
				
				script.Parent:Activate()
				
			end
		end)
		
		UserInputService.InputEnded:Wait()
		
		hold = false
		
		script.Parent:Deactivate()
		
	end
	
end)    



