local Wheats = require(game.ReplicatedStorage.Objects.Wheats).register()

return
	{
		
		{
			ID = 1,
			name = "NoobCrate",
			displayname = "Noob Crate",
			model = script.BasicCrate,
			
			materials = 
			{
				
				Wheats["BasicWheat"], 0,
				Wheats["ProWheat"], 50,
	
				
				
			},
			
			contents = 
			{
				
				30, "noob",
				30, "semi-noob",
				40, "pro"
				
				
			}
			
			
			
		}
		
		
		
		
		
	}