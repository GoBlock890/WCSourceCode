local words = 
	{
	"what r u doing here","Dont spam me","go away",
	"no more magic boxes","stop",
	"jump off dude","stop talking with me"
	}



script.Parent.Triggered:Connect(function(p)
	
	game.ReplicatedStorage.TextIndicator:FireClient(p,
		words[math.random(1,#words)],
		script.Parent.Parent.Position + Vector3.new(0,1.5,0),
		Color3.fromRGB(222, 30, 13),UDim2.new(3,0,0.5,0),1.5,Enum.EasingStyle.Sine)
	
end)