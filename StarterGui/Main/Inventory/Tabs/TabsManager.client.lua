local SelectedSize = UDim2.new(0.3, 0, 1, 0)
local UnselectedSize = UDim2.new(0.3, 0, 0.8, 0)

for i, v in pairs(script.Parent:GetChildren()) do

	if v:IsA("TextButton") then
	
		if v.Name ~= "Items" then
		
			v:TweenSize(UnselectedSize, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
			script.Parent.Parent.Frame.Layouts:FindFirstChild(v.Name).Visible = false
			
		else
			
			v:TweenSize(SelectedSize, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
			script.Parent.Parent.Frame.Layouts:FindFirstChild(v.Name).Visible = true

		end

	end	
	
end

for i, v in pairs(script.Parent:GetChildren()) do

	if v:IsA("TextButton") then

		v.Activated:Connect(function()

			local tabID = script.Parent.Parent.Tab.Value
			tabID = v:GetAttribute("ID")



			if tabID == 1 then

				for i, v in pairs(script.Parent:GetChildren()) do

					if v:IsA("TextButton") then

						if v.Name ~= "Items" then

							v:TweenSize(UnselectedSize, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
							script.Parent.Parent.Frame.Layouts:FindFirstChild(v.Name).Visible = false

						else

							v:TweenSize(SelectedSize, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
							script.Parent.Parent.Frame.Layouts:FindFirstChild(v.Name).Visible = true

						end

					end	

				end

			end



			if tabID == 2 then
				
				for i, v in pairs(script.Parent:GetChildren()) do

					if v:IsA("TextButton") then

						if v.Name ~= "Equipments" then

							v:TweenSize(UnselectedSize, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
							script.Parent.Parent.Frame.Layouts:FindFirstChild(v.Name).Visible = false

						else

							v:TweenSize(SelectedSize, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
							script.Parent.Parent.Frame.Layouts:FindFirstChild(v.Name).Visible = true

						end

					end	

				end

			end



			if tabID == 3 then

				for i, v in pairs(script.Parent:GetChildren()) do

					if v:IsA("TextButton") then

						if v.Name ~= "Drones" then

							v:TweenSize(UnselectedSize, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
							script.Parent.Parent.Frame.Layouts:FindFirstChild(v.Name).Visible = false

						else

							v:TweenSize(SelectedSize, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.2)
							script.Parent.Parent.Frame.Layouts:FindFirstChild(v.Name).Visible = true

						end

					end	
					
				end
				
			end




		end)

	end

end