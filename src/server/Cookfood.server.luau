-- Proxprompt --
local proximityPrompt = game.Workspace.CookPart.CookStation.ProximityPrompt

-- Event --
proximityPrompt.Triggered:Connect(function(player)
	local character = player.Character
	local backpack = player:WaitForChild("Backpack")
	local meatTool = character:FindFirstChild("Meat")
	local tomatoTool = character:FindFirstChild("Tomato")
	local doughTool = character:FindFirstChild("Dough")

	if doughTool then
		doughTool:Destroy()
		wait(3)

		local cookedDough = game.ServerStorage:FindFirstChild("CookedIngridients").CookedDough:Clone()
		cookedDough.Parent = backpack
	end

	if tomatoTool then
		tomatoTool:Destroy()
		wait(3)

		local cookedTomato = game.ServerStorage:FindFirstChild("CookedIngridients").CookedTomato:Clone()
		cookedTomato.Parent = backpack
	end

	if meatTool then
		meatTool:Destroy()

		wait(3)

		local cookedMeat = game.ServerStorage:FindFirstChild("CookedIngridients").CookedMeat:Clone()
		cookedMeat.Parent = backpack
	end
end)
