--local wheatsList = require(game.ReplicatedStorage.Objects.Wheats)
local Wheats = require(game.ReplicatedStorage.Objects.Wheats)
local ToolType = require(game.ReplicatedStorage.Types.ToolType)
local Rarity = require(game.ReplicatedStorage.Gen.Rarity)
local EventTypes = require(game.ReplicatedStorage.Gen.PlayerDataEventTypes)

function shallowcopy(orig)
	local orig_type = type(orig)
	local copy
	if orig_type == 'table' then
		copy = {}
		for orig_key, orig_value in pairs(orig) do
			copy[orig_key] = orig_value
		end
	else -- number, string, boolean, etc
		copy = orig
	end
	return copy
end

game:GetService("Players").PlayerAdded:Connect(function(p)
	
	local why = game.ReplicatedStorage.EquipToolFromClient:Clone()
	why.Parent = p
	why.OnServerEvent:Connect(function(p, ID)
		
		game.ReplicatedStorage.EquipToolToPlayer:Invoke(p, require(p.PlayerData).Get().Equipments[ID], true)
		
		
		
	end)
	
	local startTime = os.clock()
	local InventoryObj = game.ReplicatedStorage.PlayerData:Clone()
	InventoryObj.Parent = p
		
	local Inventory = require(InventoryObj).Get()
	local InventoryF = require(InventoryObj)
	
	Inventory["Points"] = 0
	Inventory["Tickets"] = 0
	Inventory["Capacity"] = 0
	Inventory["MaxCapacity"] = 1000
	
	p.CameraMaxZoomDistance = 15
	
	--print(wheatsList:new())
	
	Inventory.Wheats = Wheats.register()
	Inventory.Items = Wheats.register()
	
	local bejir = ToolType.new("BasicMachete", "Basic Machete", 
		10, 0.1, 10, {}, Rarity.Common)
	
	local man = ToolType.new("ManMachete", 
		"Man Machete", 10, 0.1, 100, {}, Rarity.Mythical)
	
	table.insert(Inventory.Equipments, bejir)
	table.insert(Inventory.Equipments, man)
	--table.insert(Inventory.Equipments, shallowcopy(bejir))
	
	print(Inventory.Equipments)
	
	
	game.ReplicatedStorage.EquipToolToPlayer:Invoke(p, Inventory.Equipments[1])
	
	print("Times Estiminated to complete registration of " .. p.Name .. " : " .. tostring(os.clock() - startTime))

	spawn(function()
		
		 p.CharacterAdded:Wait()
		
		print("LOADED")
		
		InventoryF.Update(p, "CapChange")
		InventoryF.Update(p, "ItemsChange")
		InventoryF.Update(p, "WheatsChange")
		InventoryF.Update(p, "EqChange")
		
		
		
	end)
	
end)

