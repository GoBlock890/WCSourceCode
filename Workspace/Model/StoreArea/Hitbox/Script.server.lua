local PlayerDataEventTypes = require(game.ReplicatedStorage.Gen.PlayerDataEventTypes)
local ZonePart = script.Parent
local Touching = false

local function isInsideBrick(Pos, Part)
	local v3 = Part.CFrame:PointToObjectSpace(Pos)
	return (math.abs(v3.X) <= Part.Size.X / 2)
		and (math.abs(v3.Y) <= Part.Size.Y / 2)
		and (math.abs(v3.Z) <= Part.Size.Z / 2)
end

local function getPlayersInsideZone(Zone)
	List = {}
	for _, Player in pairs(game.Players:GetPlayers()) do
		if (Player.Character) then
			local RootPart = Player.Character:FindFirstChild("HumanoidRootPart")
			if (RootPart and isInsideBrick(RootPart.Position, Zone)) then
				table.insert(List, Player)
			end
		end
	end
	return List
end

while wait() do
	if (#getPlayersInsideZone(ZonePart) > 0) then
		if not Touching then
			
			Touching = true
			
			local plr = List[1]
			local playerData = require(plr.PlayerData).Get()
			local dataObj = require(plr.PlayerData)

			for i, v in pairs(playerData.Wheats) do

				playerData.Items[v.name].amount += v.amount
				

				v.amount = 0
				playerData.Capacity = 0

			end				
			
			print(playerData.Items["BasicWheat"].amount)
			
			dataObj.Update(plr, "CapChange")
			dataObj.Update(plr, "ItemsChange")
			dataObj.Update(plr, "WheatsChange")
			dataObj.Update(plr, "EqChange")
		end
		
	else
		
		if Touching then
			
			Touching = false

			
		end
		
	end
	
end