for i,v in pairs(game.Workspace:GetChildren()) do

	if v.Name == "Field" then

		for i,v2 in	pairs(v:GetChildren()) do

			if v2.Name == "Wheat" then

				local idk1 = Instance.new("NumberValue")
				idk1.Parent = v2
				idk1.Name = "OgYPos"
				idk1.Value = v2.Position.Y

				local idk2 = Instance.new("BoolValue")
				idk2.Parent = v2
				idk2.Name = "FullyRegrown"
				idk2.Value = true

				local idk3 = Instance.new("BoolValue")
				idk3.Parent = v2
				idk3.Name = "Revoked"
				idk3.Value = false
				
				local idk4 = Instance.new("BoolValue")
				idk4.Parent = v2
				idk4.Name = "Leafless"
				idk4.Value = false

				v2:GetPropertyChangedSignal("Position"):Connect(function()

					if not v2.FullyRegrown.Value and v2.Position.Y > v2.OgYPos.Value - 3 then return end

					local deb = false

					local function worker2()
		
						spawn(function()
							
							deb = true
							
							if v2.Position.Y < v2.OgYPos.Value and not v2.Revoked.Value then

								wait(v:GetAttribute("GrowEvery") + 1.5)

								v2.FullyRegrown.Value = false

								if v2.Revoked.Value == true then return end

								local time_ = 0
								
								while wait() do -- 30 fps ig. didnt using tweenSc cuz lag the server
									
									
									v2.Position = v2.Position:Lerp(Vector3.new(v2.Position.X, v2.OgYPos.Value, v2.Position.Z),
										time_ / 500
									)
									
									time_ = math.min(500, time_ + 1)
									
									if v2.Position.Y >= v2.OgYPos.Value - 0.3 and v2.Leafless.Value then
									
										v2.Leafless.Value = false										
										
									end
										
									if v2.Revoked.Value then return end
									if v2.Position.Y >= v2.OgYPos.Value then break end
									
								end
								
								v2.FullyRegrown.Value = true
								--print(v2.Leafless.Value)
								
							end
							
							deb = false
							
						end)
						
					end


					local function worker1()

						wait(v:GetAttribute("GrowEvery") + 0.5)
						
						--if deb then return end
						
						
						
						if v2.Revoked.Value then

							v2.Revoked.Value = false
							
							worker1()

						else

							if not deb then worker2() end

						end
						
					end

					worker1()

				end)

			end

		end

	end

end