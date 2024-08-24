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

	-- Handle the player's interaction with the NPC
	GivingDetector.MouseClick:Connect(function(player)
		local HotDog = player.Backpack:FindFirstChild("HotDog")
		local Burger = player.Backpack:FindFirstChild("Burger")

		if Burger then
			if Burger.Name == npc:GetAttribute("FoodOrder") then
				if npc:GetAttribute("Served") then
					return
				end
				Burger:Destroy()
				Chat:Chat(npc.Head, "This Has To Be The Best Burger I've Ever Ate!")
				npc:SetAttribute("Served", true)
			end
		end

		if HotDog then
			if HotDog.Name == npc:GetAttribute("FoodOrder") then
				if npc:GetAttribute("Served") then
					return
				end
				HotDog:Destroy()
				Chat:Chat(npc.Head, "I Will Surely Come Back For One Of These! :D")
				npc:SetAttribute("Served", true)
			end
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
