local _Data = {}
local id = 0

local module;module = 
	{
		Store = function(Key, Data)
			_Data[Key] = Data
			
		end,
		
		Get = function(id)
			
			return _Data
			
		end,
		
		GetNewIndex = function()
			
			id += 1
			
			return math.round(id)
			
		end,
		
		Remove = function(Key)
			
			_Data[Key] = nil
			id -= 1
			
		end
		
		
		
	}

return module