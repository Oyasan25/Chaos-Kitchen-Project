-- Proxprompt --
local proximityPrompt = game.Workspace.CookFolder.CookStation.ProximityPrompt

-- Event --
proximityPrompt.Triggered:Connect(function(player)
	local character = player.Character
	local backpack = player:WaitForChild("Backpack")
	local meatTool = character:FindFirstChild("MeatRaw")
	local DoughBottomTool = character:FindFirstChild("DoughBottom")
	local DoughTopTool = character:FindFirstChild("DoughTop")

	if DoughBottomTool then
		DoughBottomTool:Destroy()
		wait(3)

		local DoughBottomDone = game.ServerStorage:FindFirstChild("DoneIngridients").DoughBottomDone:Clone()
		DoughBottomDone.Parent = backpack
	end

	if meatTool then
		meatTool:Destroy()

		wait(3)

		local cookedMeat = game.ServerStorage:FindFirstChild("DoneIngridients").MeatDone:Clone()
		cookedMeat.Parent = backpack
	end

	if DoughTopTool then
		DoughTopTool:Destroy()

		wait(3)

		local TopDoughDone = game.ServerStorage:FindFirstChild("DoneIngridients").DoughTopDone:Clone()
		TopDoughDone.Parent = player.Backpack
	end
end)
