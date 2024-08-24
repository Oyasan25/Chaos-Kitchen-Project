local ProximityPrompt = game.Workspace.CookFolder.PromptPart.ProximityPrompt

local Burger = {
	["BottomDough"] = game.Workspace.CookFolder.FoodCraft.Burger.BottomDough,
	["Meat"] = game.Workspace.CookFolder.FoodCraft.Burger.Meat,
	["Tomato"] = game.Workspace.CookFolder.FoodCraft.Burger.Tomato,
	["Salad"] = game.Workspace.CookFolder.FoodCraft.Burger.Salad,
	["Cheese"] = game.Workspace.CookFolder.FoodCraft.Burger.Cheese,
	["TopDough"] = game.Workspace.CookFolder.FoodCraft.Burger.TopDough,
}

local HotDog = {
	["Dough"] = game.Workspace.CookFolder.FoodCraft.HotDog.Dough,
	["Meat"] = game.Workspace.CookFolder.FoodCraft.HotDog.Meat,
}

ProximityPrompt.Triggered:Connect(function(Player)
	local DoughBottomTool = Player.Character:FindFirstChild("DoughBottomDone")
	if DoughBottomTool then
		DoughBottomTool:Destroy()
		local BottomDough = Burger["BottomDough"]
		BottomDough.Transparency = 0
	end

	if not DoughBottomTool and Burger["BottomDough"].Transparency == 0 then
		local MeatTool = Player.Character:FindFirstChild("MeatDone")
		if MeatTool then
			MeatTool:Destroy()
			local Meat = Burger["Meat"]
			Meat.Transparency = 0
		end

		if not MeatTool and Burger["Meat"].Transparency == 0 then
			local TomatoTool = Player.Character:FindFirstChild("Tomato")
			if TomatoTool then
				TomatoTool:Destroy()
				local Tomato = Burger["Tomato"]
				Tomato.Transparency = 0
			end

			if not TomatoTool and Burger["Tomato"].Transparency == 0 then
				local SaladTool = Player.Character:FindFirstChild("Salad")
				if SaladTool then
					SaladTool:Destroy()
					local Salad = Burger["Salad"]
					Salad.Transparency = 0
				end

				if not SaladTool and Burger["Salad"].Transparency == 0 then
					local CheeseTool = Player.Character:FindFirstChild("Cheese")
					if CheeseTool then
						CheeseTool:Destroy()
						local Cheese = Burger["Cheese"]
						Cheese.Transparency = 0
					end

					if not CheeseTool and Burger["Cheese"].Transparency == 0 then
						local DoughTopTool = Player.Character:FindFirstChild("DoughTopDone")
						if DoughTopTool then
							DoughTopTool:Destroy()
							local TopDough = Burger["TopDough"]
							TopDough.Transparency = 0
						end
						if
							Burger["BottomDough"].Transparency == 0
							and Burger["Meat"].Transparency == 0
							and Burger["Tomato"].Transparency == 0
							and Burger["Salad"].Transparency == 0
							and Burger["Cheese"].Transparency == 0
							and Burger["TopDough"].Transparency == 0
						then
							Burger["BottomDough"].Transparency = 1
							Burger["Meat"].Transparency = 1
							Burger["Tomato"].Transparency = 1
							Burger["Salad"].Transparency = 1
							Burger["Cheese"].Transparency = 1
							Burger["TopDough"].Transparency = 1
							local BurgerTool = game.ServerStorage.DoneFoods.Burger
							local BurgerClone = BurgerTool:Clone()
							BurgerClone.Parent = Player.Backpack
						end
					end
				end
			end
		end
	end
end)

ProximityPrompt.Triggered:Connect(function(Player)
	local HotDogDoughTool = Player.Character:FindFirstChild("HotDogDoughDone")
	if HotDogDoughTool then
		HotDogDoughTool:Destroy()
		local HotDogDough = HotDog["Dough"]
		HotDogDough.Transparency = 0
	end

	if not HotDogDoughTool and HotDog["Dough"].Transparency == 0 then
		local HotDogMeatTool = Player.Character:FindFirstChild("HotDogMeatDone")
		if HotDogMeatTool then
			HotDogMeatTool:Destroy()
			local HotDogMeat = HotDog["Meat"]
			HotDogMeat.Transparency = 0
		end
	end

	if HotDog["Dough"].Transparency == 0 and HotDog["Meat"].Transparency == 0 then
		HotDog["Dough"].Transparency = 1
		HotDog["Meat"].Transparency = 1
		local HotDogTool = game.ServerStorage.DoneFoods.HotDog
		local HotDogClone = HotDogTool:Clone()
		HotDogClone.Parent = Player.Backpack
	end
end)
