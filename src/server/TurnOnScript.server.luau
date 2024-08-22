local Part = game.Workspace.CookPart.TurnOnButton
local ClickDetector = Part.ClickDetector
local CookSound = game.Workspace.CookPart.CookStation.CookSound
local ProximityPrompt = game.Workspace.CookPart.CookStation.ProximityPrompt


CookSound.Looped = true

local TurnedOn = false

ClickDetector.MouseClick:Connect(function()
	if TurnedOn then
		
		TurnedOn = false
		ProximityPrompt.Enabled = false
		Part.Color = Color3.fromRGB(255,0,0)
		CookSound:Stop()
		
	else
		TurnedOn = true
		ProximityPrompt.Enabled = true
		Part.Color = Color3.fromRGB(0,255,0)
		CookSound:Play()
	end
end)


