local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
local Highlight = Instance.new("Highlight")

Highlight.FillTransparency = 1

local CollectionService = game:GetService("CollectionService")

Mouse.Move:Connect(function()
	if not Mouse.Target then
		Highlight.Adornee = nil
		return
	end

	if CollectionService:HasTag(Mouse.Target, "Highlightable") then
		Highlight.Adornee = Mouse.Target
		return
	elseif CollectionService:HasTag(Mouse.Target.Parent, "Highlightable") then
		Highlight.Adornee = Mouse.Target.Parent
		return
	end

	Highlight.Adornee = nil
end)
