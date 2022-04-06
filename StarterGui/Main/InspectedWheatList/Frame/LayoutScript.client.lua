local Wheats = require(game.ReplicatedStorage.Objects.Wheats)
local Desc = script.Parent.Parent.Description;
local Inventory = game.ReplicatedStorage.PlayerDataToLocalTable:InvokeServer(game.Players.LocalPlayer)
local EventTypes = require(game.ReplicatedStorage.Gen.PlayerDataEventTypes)

for i, v in pairs(Inventory.Wheats) do
	
	local placeholder = script.Parent.Scroll.PlaceHolder:Clone()
	
	placeholder.Counter.Text = "Loading."
	placeholder.Name = v.name
	placeholder.Parent = script.Parent.Scroll
	placeholder.Visible = false
	placeholder.BackgroundColor3 = v.rarity.color
	placeholder.MouseButton1Click:Connect(function()
		
		Desc.Icon.Visible = true
		Desc.Label.Visible = true
		Desc.Rarity.Visible = true
		
		Desc.Icon.Image = placeholder.Image
		Desc.Icon.BackgroundColor3 = v.rarity.color
		Desc.Label.Text = v.displayname
		Desc.Rarity.Text = v.rarity.name
		Desc.Rarity.TextColor3 = v.rarity.color
		
		
	end)
	
end

script.Parent.Scroll.PlaceHolder:Destroy()

game.ReplicatedStorage.OnPlayerDataUpdate.OnClientEvent:Connect(function(PlayerData, Type)
	

	
	if Type ~= EventTypes.WheatsChange then return end
	
	for i, v in ipairs(script.Parent.Scroll:GetChildren()) do

		
		if v:IsA("ImageButton") then
			
			
			if PlayerData.Wheats[v.Name].amount > 0 then
					
				v.Visible = true
				v.Counter.Text = PlayerData.Wheats[v.Name].amount
				
				
			else
				
				v.Visible = false
				
			end
		
		end
		
	end
	
end)