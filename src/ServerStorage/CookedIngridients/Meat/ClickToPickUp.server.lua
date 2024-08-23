local Tool = script.Parent
local Detector = Tool.ClickDetector

Detector.MouseClick:Connect(function(player)
	Tool.Parent = player.Backpack	
end)