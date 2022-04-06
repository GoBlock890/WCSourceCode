local Wheats = require(game.ReplicatedStorage.Objects.Wheats)
local Desc = script.Parent.Parent.Description;
local DescDirec = UDim2.new(0.06, 0,0.165, 0)
local Inventory = game.ReplicatedStorage.PlayerDataToLocalTable:InvokeServer(game.Players.LocalPlayer)
local PlayerDataEventTypes = require(game.ReplicatedStorage.Gen.PlayerDataEventTypes)

for i, v in pairs(Inventory.Equipments) do

	local placeholder = script.Parent.Equipments.PlaceHolder:Clone()

	placeholder.Counter.Text = "Loading."
	placeholder.Name = v.name
	placeholder.Parent = script.Parent.Equipments
	placeholder.Visible = false
	placeholder.ImageColor3 = v.rarity.color
	placeholder.InvIndex.Value = i
	placeholder.MouseButton1Click:Connect(function()
		
		print("W")
		
		Desc.Slot.Visible = true
		Desc.Label.Visible = true
		Desc.Rarity.Visible = true

		Desc.Slot.Icon.Image = placeholder.Icon.Image
		Desc.Slot.ImageColor3 = v.rarity.color
		Desc.Label.Text = v.displayName
		Desc.Rarity.Text = v.rarity.name
		Desc.Rarity.TextColor3 = v.rarity.color
		script.Parent.Parent.Description.WhichItem.Value = placeholder.InvIndex.Value
		
		if not Inventory.Equipments[placeholder.InvIndex.Value].equipped then

			Desc.Equip.ImageColor3 = Color3.fromRGB(51, 208, 251)
			Desc.Equip.TextLabel.Text = "Equip"

		else

			Desc.Equip.ImageColor3 = Color3.fromRGB(255, 107, 107)
			Desc.Equip.TextLabel.Text = "Equipped"

		end


	end)

end

script.Parent.Equipments.PlaceHolder:Destroy()

game.ReplicatedStorage.OnPlayerDataUpdate.OnClientEvent:Connect(function(playerData, Type)
	

	if Type ~= "EqChange" then print("bro why") return end

	--print(playerData.Equipments["BasicWheat"].amount)

	print("Passed")

	for i, v in pairs(script.Parent.Equipments:GetChildren()) do


		if v:IsA("ImageButton") then

			print(playerData.Equipments[i - 1])
			v.Visible = true
			v.Counter.Text = playerData.Equipments[i - 1].powers;

		end

	end
	
end)