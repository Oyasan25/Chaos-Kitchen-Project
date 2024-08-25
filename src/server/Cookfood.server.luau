-- Proxprompt --
local proximityPrompt = game.Workspace.CookFolder.CookStation.ProximityPrompt

-- Event --
proximityPrompt.Triggered:Connect(function(player)
	local character = player.Character
	local backpack = player:WaitForChild("Backpack")
	local meatTool = character:FindFirstChild("MeatRaw")
	local DoughBottomTool = character:FindFirstChild("DoughBottom")
	local DoughTopTool = character:FindFirstChild("DoughTop")
	local HotDogTool = character:FindFirstChild("RawHotDogMeat")
	local HotDogDoughTool = character:FindFirstChild("HotDogDough")

	if DoughBottomTool then
		DoughBottomTool:Destroy()
		wait(3)

		local DoughBottomDone = game.ServerStorage:FindFirstChild("DoneIngredients").BurgerDone.DoughBottomDone:Clone()
		DoughBottomDone.Parent = backpack
	end

	if meatTool then
		meatTool:Destroy()

		wait(3)

		local cookedMeat = game.ServerStorage:FindFirstChild("DoneIngredients").BurgerDone.MeatDone:Clone()
		cookedMeat.Parent = backpack
	end

	if DoughTopTool then
		DoughTopTool:Destroy()

		wait(3)

		local TopDoughDone = game.ServerStorage:FindFirstChild("DoneIngredients").BurgerDone.DoughTopDone:Clone()
		TopDoughDone.Parent = player.Backpack
	end

	if HotDogTool then
		HotDogTool:Destroy()

		wait(3)

		local HotDogMeatDone = game.ServerStorage:FindFirstChild("DoneIngredients").HotDogDone.HotDogMeatDone:Clone()
		HotDogMeatDone.Parent = player.Backpack
	end

	if HotDogDoughTool then
		HotDogDoughTool:Destroy()

		wait(3)

		local HotDogDoughDone = game.ServerStorage:FindFirstChild("DoneIngredients").HotDogDone.HotDogDoughDone:Clone()
		HotDogDoughDone.Parent = player.Backpack
	end
end)
