local UserInputService = game:GetService("UserInputService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local Crates = require(game.ReplicatedStorage.Gen.Crates)

local localPlayer = game.Players.LocalPlayer
local Template = game.ReplicatedStorage.UI.CratePrompt

ProximityPromptService.PromptShown:Connect(function(prompt)
	
	if prompt.Name ~= "CratePrompt" then return end
	
	local crateID = prompt:GetAttribute("CrateID")
	local crate = Crates[crateID]
	local inputType = Enum.ProximityPromptInputType.Touch
	local clonedTemplate =  Template:Clone()
	
	clonedTemplate.Frame.Input.InputBegan:Connect(function()
		
		if Enum.UserInputType.Touch or Enum.UserInputType.MouseButton1 then
			prompt:InputHoldBegin()
		
		end
		
	end)
	
	clonedTemplate.Frame.Input.InputEnded:Connect(function()
		
		prompt:InputHoldEnd()

	end)
	
	for i, v in pairs(crate.materials) do

		if type(v) == "table" then

			local materialSlot = clonedTemplate.Frame.Material.Masking.ScrollingFrame.Placeholder:Clone()
			materialSlot.Parent = clonedTemplate.Frame.Material.Masking.ScrollingFrame
			materialSlot.Visible = true
			materialSlot.ImageColor3 = v.rarity.color
			materialSlot.Counter.Text = crate.materials[i + 1]

			clonedTemplate.Frame.Material.Masking.ScrollingFrame.CanvasSize = UDim2.new(materialSlot.Parent.CanvasSize.X.Scale + 0.15, 0, 0, 0)


		end	

	end
	
	clonedTemplate.Adornee = prompt.Parent
	clonedTemplate.Parent = localPlayer.PlayerGui
	
	clonedTemplate.Frame.Material.Masking.ScrollingFrame.Placeholder.Visible = false
	clonedTemplate.Frame.Description.Label.Text = crate.displayname
	
	clonedTemplate.Frame:TweenSize(UDim2.new(1, 0, 1, 0),Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
	
	
	ProximityPromptService.PromptHidden:Wait()
	
	clonedTemplate.Frame:TweenSize(UDim2.new(0, 0, 1, 0),Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)

	wait(0.2)
	
	clonedTemplate:Destroy()
	
end)