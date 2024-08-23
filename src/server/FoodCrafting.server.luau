local ProximityPrompt = game.Workspace.CookPart.PromptPart.ProximityPrompt

local Pizza = {
	["Dough"] = game.Workspace.CookPart.FoodCraft.Dough,
	["Meat"] = game.Workspace.CookPart.FoodCraft.Meat,
	["Tomato"] = game.Workspace.CookPart.FoodCraft.Tomato,
}

ProximityPrompt.Triggered:Connect(function(Player)
	local DoughTool = Player.Character:FindFirstChild("CookedDough")
	if DoughTool then
		DoughTool:Destroy()
		local Dough = Pizza["Dough"]
		Dough.Transparency = 0
	end

	if not DoughTool and Pizza["Dough"].Transparency == 0 then
		local MeatTool = Player.Character:FindFirstChild("CookedMeat")
		if MeatTool then
			MeatTool:Destroy()
			local Meat = Pizza["Meat"]
			Meat.Transparency = 0
		end

		if not MeatTool and Pizza["Meat"].Transparency == 0 then
			local TomatoTool = Player.Character:FindFirstChild("CookedTomato")
			if TomatoTool then
				TomatoTool:Destroy()
				local Tomato = Pizza["Tomato"]
				Tomato.Transparency = 0
			end

			if
				Pizza["Dough"].Transparency == 0
				and Pizza["Meat"].Transparency == 0
				and Pizza["Tomato"].Transparency == 0
			then
				Pizza["Dough"].Transparency = 1
				Pizza["Meat"].Transparency = 1
				Pizza["Tomato"].Transparency = 1
				local PizzaTool = game.ServerStorage.DoneFood.Pizza
				local PizzaClone = PizzaTool:Clone()
				PizzaClone.Parent = Player.Backpack
			end
		end
	end
end)
