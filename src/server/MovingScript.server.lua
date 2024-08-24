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
local function MoveToLocation(Humanoid, targetPosition)
	local Path = PathfindingService:CreatePath()
	Path:ComputeAsync(Humanoid.RootPart.Position, targetPosition)
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

	-- Move NPC to the seat
	MoveToLocation(Humanoid, Seat.Position)

	-- Function to move NPC to the endpoint when served
	local function onServed()
		if npc:GetAttribute("Served") == true then
			wait(5)
			Humanoid.Sit = false
			-- Move NPC to the endpoint and destroy NPC after reaching it
			MoveToLocation(Humanoid, EndPoint.Position)
			Humanoid.MoveToFinished:Connect(function()
				npc:Destroy()
				-- Spawn a new NPC after the current one is destroyed
				handleNPC(randomStart())
			end)
		end
	end

	-- Listen for changes to the 'Served' attribute
	npc:GetAttributeChangedSignal("Served"):Connect(onServed)

	-- Initial check in case the NPC is already served
	onServed()
end

-- Initial spawn and handling of the first NPC
handleNPC(randomStart())

-- Additional spawn logic if needed
EndPoint.Touched:Connect(function()
	handleNPC(randomStart())
end)
