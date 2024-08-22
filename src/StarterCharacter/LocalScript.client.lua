local CAS = game:GetService("ContextActionService")

local GrabObject = nil
local GrabStart = false
local Dragger = nil

local player = game.Players.LocalPlayer
local character = player.Character
local mouse = player:GetMouse()
local camera = game.Workspace.CurrentCamera

function Grab(actionName, UserInputState, InputObject)
	if actionName == "Grab" then
		if UserInputState == Enum.UserInputState.Begin then
			-- start grab
			local Magnitude = (mouse.Hit.Position - character.Head.CFrame.Position).magnitude
			if Magnitude < 10 then

				if mouse.Target then

					GrabObject = mouse.Target
					GrabStart = true

					local DragBall = createDragBall()
					DragBall.CFrame = mouse.Hit
					Dragger = DragBall

					mouse.TargetFilter = GrabObject

					local DragBallWeld = weldBetween(DragBall,GrabObject)
					addMover(DragBall)

					while Dragger do
						--Create a ray from the users head to the mouse.
						local cf = CFrame.new(character.Head.Position, mouse.Hit.Position)
						Dragger.Mover.Position = (cf + (cf.LookVector * 4)).Position
						Dragger.RotMover.CFrame = camera.CFrame * CFrame.Angles(Dragger.RotOffset.Value.X,Dragger.RotOffset.Value.Y, Dragger.RotOffset.Value.Z)
						wait()
					end
					mouse.TargetFilter = nil
				end
			end
		elseif UserInputState == Enum.UserInputState.End then
			-- stop grab

			GrabObject = nil
			GrabStart = false
			if Dragger then
				Dragger:Destroy()
				Dragger = nil
			end
		end
	end	
end


function weldBetween(a, b)
	local weld = Instance.new("ManualWeld", a)
	weld.C0 = a.CFrame:inverse() * b.CFrame
	weld.Part0 = a
	weld.Part1 = b
	return weld
end


function addMover(part)

	local newMover = Instance.new("BodyPosition")
	newMover.Parent = part
	newMover.MaxForce = Vector3.new(40000,40000,40000)
	newMover.P = 40000
	newMover.D = 1000
	newMover.Position = part.Position
	newMover.Name = "Mover"

	local newRot = Instance.new("BodyGyro")
	newRot.Parent = part
	newRot.MaxTorque = Vector3.new(3000,3000,3000)
	newRot.P = 3000
	newRot.D = 500
	newRot.CFrame = game.Workspace.CurrentCamera.CFrame
	newRot.Name = "RotMover"

	local RotOffset = Instance.new("CFrameValue")
	RotOffset.Name = "RotOffset"
	RotOffset.Parent = part
end


function createDragBall()
	local DragBall = Instance.new("Part")
	DragBall.BrickColor = BrickColor.new("Electric blue")
	DragBall.Material = Enum.Material.Wood
	DragBall.Transparency = 1
	DragBall.Size = Vector3.new(.2,.2,.2)
	DragBall.Shape = "Ball"
	DragBall.Name = "DragBall"
	DragBall.Parent = workspace
	return DragBall
end


CAS:BindAction("Grab", Grab, false, Enum.UserInputType.MouseButton1)
