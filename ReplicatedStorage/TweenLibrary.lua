local Module = {}





function Module.Move(x,y,z,Object,Time,EasingStyle,EasingDirection)

	game:GetService("TweenService"):Create(Object, TweenInfo.new(Time,EasingStyle,EasingDirection, 0, false, 0),{CFrame = Object.CFrame + Vector3.new(x,y,z)}):Play();

end

function Module.ColorPulsing(r,g,b,Object,Time,DelayDuration)

	local ColorMemory = Object.Color;
	game:GetService("TweenService"):Create(Object, TweenInfo.new(0,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{Color = Color3.fromRGB(r,g,b)}):Play();
	wait(DelayDuration)
	game:GetService("TweenService"):Create(Object, TweenInfo.new(Time,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),{Color = ColorMemory}):Play();

end

function Module.Color(r,g,b,Object,Time)

	game:GetService("TweenService"):Create(Object, TweenInfo.new(Time,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Color = Color3.fromRGB(r,g,b)}):Play();

end



return Module
