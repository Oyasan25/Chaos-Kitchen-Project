-- Define services and folder references
local RS = game:GetService("ReplicatedStorage")
local PathfindingService = game:GetService("PathfindingService")

local EndPoint = game.Workspace:WaitForChild("NPCWaypoints"):WaitForChild("Endpoint")
local Seat = game.Workspace.NPCWaypoints:WaitForChild("Seat")
local StartFolder = game.Workspace:WaitForChild("NPCStartPoints"):GetChildren()
local NPCFolder = game.Workspace:WaitForChild("NPCFolder")
local NPCFolderRS = RS:WaitForChild("NPC")

-- Function to spawn NPC at a random start point
local function randomStart()
	local npcClone = NPCFolderRS:WaitForChild("Noob"):Clone()
	local RandomStartResult = StartFolder[math.random(1, #StartFolder)]
	local HumanoidRootPart = npcClone:WaitForChild("HumanoidRootPart")

	npcClone.Parent = NPCFolder
	HumanoidRootPart.CFrame = RandomStartResult.CFrame

	return npcClone
end

-- Function to move NPC to a specified location
local function MoveToLocation(Humanoid, Torso, targetPosition)
	local Path = PathfindingService:CreatePath()
	Path:ComputeAsync(Torso.Position, targetPosition)
	local WayPoints = Path:GetWaypoints()

	for _, waypoint in pairs(WayPoints) do
		Humanoid:MoveTo(waypoint.Position)
		Humanoid.MoveToFinished:Wait()
	end

	Humanoid:MoveTo(targetPosition)
end

-- Function to handle the entire NPC sequence
local function handleNPC(npc)
	local Humanoid = npc:WaitForChild("Humanoid")
	local Torso = npc:WaitForChild("Torso")
	local ClickDetector = npc:WaitForChild("ClickDetector")
	local Sound = npc:WaitForChild("FoodSound")
	local Served = false

	-- Move NPC to the seat
	MoveToLocation(Humanoid, Torso, Seat.Position)

	-- Assign the ClickDetector event for serving food
	ClickDetector.MouseClick:Connect(function(player)
		if Served then
			return
		end -- Prevent serving the same NPC multiple times

		local character = player.Character
		local burgerTool = character:FindFirstChild("Burger") or player.Backpack:FindFirstChild("Burger")

		if burgerTool then
			Sound:Play()
			wait(0.1)
			burgerTool:Destroy()

			local leaderstats = player:FindFirstChild("leaderstats")
			if leaderstats then
				local Cash = leaderstats:FindFirstChild("Cash")
				Cash.Value += 50
				Served = true

				npc:SetAttribute("IsServed", true)
			end
		end
	end)

	-- Wait until served
	npc:GetAttributeChangedSignal("IsServed"):Connect(function()
		if npc:GetAttribute("IsServed") then
			Humanoid.Sit = false
			wait(0.5)

			-- Move to the endpoint and destroy NPC
			MoveToLocation(Humanoid, Torso, EndPoint.Position)
			Humanoid.MoveToFinished:Connect(function()
				npc:Destroy()
				-- Spawn a new NPC after the current one is destroyed
				handleNPC(randomStart())
			end)
		end
	end)
end

-- Initial spawn and handling of the first NPC
handleNPC(randomStart())

-- Additional spawn logic if needed
EndPoint.Touched:Connect(function()
	handleNPC(randomStart())
end)
