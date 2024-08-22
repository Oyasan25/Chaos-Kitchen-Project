local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()

local CollectionService = game:GetService("CollectionService")

Mouse.Move:Connect(function()
	
	if not Mouse.Target then script.Highlight.Adornee = nil return end
	
	if CollectionService:HasTag(Mouse.Target, "Highlightable") then
		script.Highlight.Adornee = Mouse.Target
		return
	elseif CollectionService:HasTag(Mouse.Target.Parent, "Highlightable") then
		script.Highlight.Adornee = Mouse.Target.Parent
		return
	end
	
	script.Highlight.Adornee = nil
	
end)