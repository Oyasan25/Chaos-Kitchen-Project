local humanoid = game.Players.LocalPlayer.Character.Humanoid
-- local camera = workspace.CurrentCamera

local db = true

-- local TextLabel = game.StarterGui.Event.ScreenGui.TextFrame.TextLabel
-- local Background = game.StarterGui.Event.ScreenGui.Background

local shakeIntensity = 2.9 -- Adjust this value to control the intensity of the shake
local shakeSpeed = 0.1 -- Adjust this value to control the speed of the shake

-- Function to shake the camera
function shakeCamera()
	local shakeOffset = Vector3.new(
		math.random(-shakeIntensity, shakeIntensity),
		math.random(-shakeIntensity, shakeIntensity),
		math.random(-shakeIntensity, shakeIntensity)
	)
	local originalOffset = humanoid.CameraOffset
	local currentTime = 0
	local duration = shakeSpeed
	while currentTime < duration do
		local delta = currentTime / duration
		humanoid.CameraOffset = originalOffset + shakeOffset * (1 - delta)
		currentTime = currentTime + wait()
	end
	humanoid.CameraOffset = originalOffset
end

while db do
	shakeCamera()
	wait()
end

if nil then
	return
end
