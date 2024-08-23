local ProximityPrompt = game.Workspace.CookPart.PromptPart.ProximityPrompt

local Burger = {
	["Dough"] = game.Workspace.CookPart.FoodCraft.Dough,
	["Meat"] = game.Workspace.CookPart.FoodCraft.Meat,
	["Tomato"] = game.Workspace.CookPart.FoodCraft.Tomato,
}

ProximityPrompt.Triggered:Connect(function(Player)
	local DoughTool = Player.Character:FindFirstChild("CookedDough")
	if DoughTool then
		DoughTool:Destroy()
		local Dough = Burger["Dough"]
		Dough.Transparency = 0
	end

	if not DoughTool and Burger["Dough"].Transparency == 0 then
		local MeatTool = Player.Character:FindFirstChild("CookedMeat")
		if MeatTool then
			MeatTool:Destroy()
			local Meat = Burger["Meat"]
			Meat.Transparency = 0
		end

		if not MeatTool and Burger["Meat"].Transparency == 0 then
			local TomatoTool = Player.Character:FindFirstChild("CookedTomato")
			if TomatoTool then
				TomatoTool:Destroy()
				local Tomato = Burger["Tomato"]
				Tomato.Transparency = 0
			end

			if
				Burger["Dough"].Transparency == 0
				and Burger["Meat"].Transparency == 0
				and Burger["Tomato"].Transparency == 0
			then
				Burger["Dough"].Transparency = 1
				Burger["Meat"].Transparency = 1
				Burger["Tomato"].Transparency = 1
				local BurgerTool = game.ServerStorage.DoneFood.Burger
				local BurgerClone = BurgerTool:Clone()
				BurgerClone.Parent = Player.Backpack
			end
		end
	end
end)
