local Lib = require(game.ReplicatedStorage.Library)
--local Tools = require(game.ReplicatedStorage.Gen.Tools)
local EventTypes = require(game.ReplicatedStorage.Gen.PlayerDataEventTypes)
local TotalWheats = 0;
local temp = 0
local debounce = true
local ScopeRate = 1;
local CollectAmount = 1
local tool
local toolModel

game.ReplicatedStorage.EquipToolToPlayer.OnInvoke = function(plr : Players, _tool, center : boolean, offset : Vector3)

	script.Parent.Parent = plr.Backpack

	if script.Parent.Parent.Parent.Name ~= plr.Name then 
		
		error("Invalid parent; Tool much be on " .. plr.Name .. "'s backpack.")
		
		return; 	
	end
	
	_tool.equipped = true
	
	print(_tool)
	
	if tool ~= nil then
		
		toolModel:Destroy()
		tool.equipped = false
		
	end
	tool = _tool
	toolModel = game.ReplicatedStorage.Models.Tools:FindFirstChild(tool.model):clone()

	toolModel.Parent = script.Parent

	CollectAmount = tool.collectAmount
	ScopeRate = tool.scopeRate
	
	if center ~= nil or offset == nil then

		toolModel:SetPrimaryPartCFrame(CFrame.new(script.Parent.Handle.Position))
		--//Set pos to center and offset

	end

	for i, v in	pairs(toolModel:GetChildren()) do

		v.Massless = true
		v.Anchored = false

		if not v:FindFirstChild("WeldConstraint") then

			local weld = Instance.new("WeldConstraint")

			weld.Parent = v
			weld.Part0 = v
			weld.Part1 = script.Parent.Handle

		end

	end
	
	return {tool, toolModel}
	
end

script.Parent.Activated:Connect(function()
	
	if not debounce then return end
	
	debounce = false

	local anim = script.Parent.Parent.Humanoid:LoadAnimation(game.ReplicatedStorage.Animation.BasicSwing)
	local p = game:GetService("Players"):GetPlayerFromCharacter(script.Parent.Parent)
	local InventoryRIL = require(p.PlayerData)
	local Inventory = require(p.PlayerData).Get()

	if not script.Parent.Enabled then return end

	script.Parent.Enabled = false

	spawn(function()

		anim:Play()

		wait(ScopeRate)

		for i,v in pairs(script.Parent.ScopeArea:GetTouchingParts()) do


			if not script.Parent.Enabled and v.Name == "Wheat" and

				Inventory.Capacity < 
				Inventory.MaxCapacity then

				if Lib.chance(0.5) then
					Inventory.Points += 5

					game.ReplicatedStorage.TextIndicator:FireClient(p,
						"+"..tostring(5).." Research Points",
						script.Parent.ScopeArea.Position + Vector3.new(0,1.5,0),
						Color3.fromRGB(55, 209, 255),UDim2.new(5.25,0,0.5,0),1.5,
						Enum.EasingStyle.Sine)

				end
				
				local AddedWheat = Inventory.Wheats[v.Parent:GetAttribute("WheatType")]
				local sum = 0
				local Interp = 	tool.powers * (1/AddedWheat.hardness)
	
				
				if v.Position.Y > v.OgYPos.Value - 3 and not v.Leafless.Value then
					
					v.Revoked.Value = true
					v.Position = Vector3.new(
						v.Position.X, 
						math.max(v.OgYPos.Value - 4, v.Position.Y - math.min(4, 1 * Interp)), 
						v.Position.Z)
					
				end
				
				if v.Position.Y <= v.OgYPos.Value - 2.9 and not v.Leafless.Value then
				
					AddedWheat.amount = math.min(AddedWheat["amount"] + CollectAmount, Inventory.MaxCapacity)
					v.Leafless.Value = true
					
					for i, v in pairs(Inventory.Wheats) do

						sum = sum + v.amount

					end

					--print(temp, AddedWheat.amount, TotalWheats, Inventory.Capacity, Inventory.MaxCapacity)

					Inventory.Capacity = math.min(sum, Inventory.MaxCapacity)

					--print(AddedWheat.amount, AddedWheat.Name, Inventory.Capacity, debounce)

					script.Parent.CapacityIndicator.Value += CollectAmount

					sum = 0

					InventoryRIL.Update(p, EventTypes.CapacityChange)
					InventoryRIL.Update(p, EventTypes.WheatsChange)
					
					
				end
				
			end

		end
		
		spawn(function()

			wait()
			script.Parent.CapacityIndicator.Value = 0

		end)

	end)

	wait(script.Parent.Cooldown.Value)


	script.Parent.Enabled = true
	
	debounce = true

end)

script.Parent.ScopeArea.Touched:Connect(function() end)

