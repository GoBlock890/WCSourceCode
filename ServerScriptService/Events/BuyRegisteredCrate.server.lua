local Crates = require(game.ReplicatedStorage.Gen.Crates)
local Cache = require(game.ReplicatedStorage.Cache.Collectible)


game.ReplicatedStorage.BuyRegisteredCrate.OnInvoke = function(plr, crateID, position)

	local crate = Crates[crateID]
	local currentMat = nil;
	local FilteredMatCount = {}
	local FilteredMat = {}
	
	
	--// Filter cost of materials 
	for i, v in pairs(crate.materials) do
		
		if type(v) == "table" then

			currentMat = v
			table.insert(FilteredMat, v)

		else if true then -- this why lua sucks

			
			if plr.Inventory.Items:FindFirstChild(currentMat.Name).Value - v < 0 then 
				
				
				--// Notify Player
				
			return 		
			end
			
			table.insert(FilteredMatCount, v)
				
				
			end
			

		end
		

	end
	
	--// Subtract player real wheat data with number from trueCost Array
	for i, v in pairs(FilteredMat) do
		
		plr.Inventory.Items:FindFirstChild(v.Name).Value -= FilteredMatCount[i]
			
	end
	
	local totalProb = 0;
	local probTable = {};
	local contentTable = {};
	
	-- // filter again lol ggs
	for i, v in	pairs(crate.contents) do
		
		if type(v) == "number" then
			
			
			table.insert(probTable, v)
			totalProb += v
		
		else
			
			
			table.insert(contentTable, v)
			
		
		end
		
	end

	-- // insert content to collectible
	local rand = math.random(0, totalProb)
	
	for i, v in pairs(contentTable) do
		
		if rand <= probTable[i] then 
			
			Cache.Store(crate.Name .. Cache.GetNewIndex(), v)
			game.ReplicatedStorage.SpawnClientCollectible:FireClient(plr, crate.model, crate.Name ..  Cache.GetNewIndex() - 1, position)
		
			return;
			
		else
		
			rand -= probTable[i]
			
			
		end
		
	end
	
end