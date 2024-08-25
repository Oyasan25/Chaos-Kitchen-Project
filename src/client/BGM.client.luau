local Player = game.Players.LocalPlayer
local Music = {
	["KitchenFirst"] = script.Parent.BackgroundMusic:WaitForChild("KitchenOST"),
}

Music["KitchenFirst"].Looped = true

Player.CharacterAdded:Connect(function()
	Music["KitchenFirst"]:Play()
end)
