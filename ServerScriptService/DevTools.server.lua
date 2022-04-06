wait(3)

local Dev = game.Players.tai_pantaT



if Dev == nil then return end

game:GetService("UserInputService").InputBegan:Connect(function(i)
	
	
	if i.KeyCode == Enum.KeyCode.RightBracket then
		
		
		print(Dev.Inventoey.Get())
		
	end
	
end)