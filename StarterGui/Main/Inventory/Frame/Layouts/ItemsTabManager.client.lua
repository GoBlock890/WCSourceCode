local Wheats = require(game.ReplicatedStorage.Objects.Wheats)
local Desc = script.Parent.Parent.Description;
local DescDirec = UDim2.new(0.06, 0,0.165, 0)
local Inventory = game.ReplicatedStorage.PlayerDataToLocalTable:InvokeServer(game.Players.LocalPlayer)
local PlayerDataEventTypes = require(game.ReplicatedStorage.Gen.PlayerDataEventTypes)

for i, v in pairs(Inventory.Items) do
	
	local placeholder = script.Parent.Items.PlaceHolder:Clone()
	
	placeholder.Counter.Text = "Loading."
	placeholder.Name = v.name
	placeholder.Parent = script.Parent.Items
	placeholder.Visible = false
	placeholder.ImageColor3 = v.rarity.color
	placeholder.MouseButton1Click:Connect(function()
		
		Desc.Slot.Visible = true
		Desc.Label.Visible = true
		Desc.Rarity.Visible = true
		
		Desc.Slot.Icon.Image = placeholder.Icon.Image
		Desc.Slot.ImageColor3 = v.rarity.color
		Desc.Label.Text = v.displayname
		Desc.Rarity.Text = v.rarity.name
		Desc.Rarity.TextColor3 = v.rarity.color
		
		
		
	end)
	
end

script.Parent.Items.PlaceHolder:Destroy()

game.ReplicatedStorage.OnPlayerDataUpdate.OnClientEvent:Connect(function(playerData, Type)
	
	if Type ~= PlayerDataEventTypes.ItemsChange and Type ~= PlayerDataEventTypes.Any then return end
	
	--print(playerData.Items["BasicWheat"].amount)
	
	for i, v in pairs(script.Parent.Items :GetChildren()) do
		
		
		if v:IsA("ImageButton") then
			
			if playerData.Items[v.Name].amount > 0 then
			
				v.Visible = true
				v.Counter.Text = playerData.Items[v.Name].amount;
				
				
			else
				
				v.Visible = false
				
			end
		
		end
		
	end
	
end)