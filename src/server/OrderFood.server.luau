local NPCFolder = game.Workspace:WaitForChild("NPCFolder")
local Chat = game:GetService("Chat")

-- Function to handle interactions with the current NPC
local function setupNPCInteraction(npc)
	local GivingDetector = npc:WaitForChild("GivingDetector")

	-- Set the FoodOrder attribute based on random choice
	if math.random(1, 2) == 1 then
		npc:SetAttribute("FoodOrder", "Burger")
	else
		npc:SetAttribute("FoodOrder", "HotDog")
	end
	print(npc:GetAttribute("FoodOrder"))

	GivingDetector.MouseClick:Connect(function(player)
		local HotDog = player.Backpack:FindFirstChild("HotDog")
		local Burger = player.Backpack:FindFirstChild("Burger")

		local FoodItem = Burger or HotDog
		if FoodItem then
			if FoodItem.Name == npc:GetAttribute("FoodOrder") then
				FoodItem:Destroy()
				Chat:Chat(npc.Head, "This has to be the best " .. FoodItem.Name .. " I 've ever ate")
				player:FindFirstChild("leaderstats"):FindFirstChild("Cash").Value += 50
			else
				FoodItem:Destroy()
				Chat:Chat(npc.Head, "This isn't what I ordered")
				player:FindFirstChild("leaderstats"):FindFirstChild("Cash").Value -= 20
			end
			npc:SetAttribute("Served", true)
		end

		if not npc:GetAttribute("Served") then
			Chat:Chat(npc.Head, "I Would Like To Get A " .. npc:GetAttribute("FoodOrder"))
		end
	end)
end

-- Function to dynamically track and interact with the current NPC
local function trackNPC()
	while true do
		local currentNPC = NPCFolder:FindFirstChild("Noob")
		if currentNPC then
			setupNPCInteraction(currentNPC)
			repeat
				wait(1)
			until not currentNPC.Parent -- Wait until the NPC is destroyed
		end
		wait(1) -- Prevent tight loop
	end
end

-- Start tracking NPCs
trackNPC()
