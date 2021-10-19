local UserInputService = game:GetService("UserInputService")

local RunService = game:GetService("RunService")

local Players = game:GetService("Players")
local LocalPlayer  = Players.LocalPlayer

local Character = LocalPlayer.Character or Players.PlayerAdded:Wait()

local Mouse = LocalPlayer:GetMouse()

local ViewModel = game:GetService("ReplicatedStorage"):WaitForChild("VM")

local Camera = game:GetService("Workspace").CurrentCamera

local Range = 1000

local IsFollowing = nil
local CanFire = true
local IsReloading = false
local CanRe = true

local ShootingAnim = "AnimId"
local ReAnim = "AnimId"


Mouse.Button1Down:Connect(function()
	if CanFire and not IsReloading then
		CanFire = false
		CanRe = false
		local NewAnimShoot = Instance.new("Animation")
		NewAnimShoot.AnimationId = ShootingAnim
		NewAnimShoot.Parent = Character:FindFirstChild("Animations")

		if Character:WaitForChild("Humanoid") then
			local LoadAnimShoot = Character:WaitForChild("Humanoid"):LoadAnimation(NewAnimShoot)
			--local DD = game:GetService("ReplicatedStorage"):WaitForChild("DD")

			LoadAnimShoot:Play()

			local RayCast = workspace:RayCast(Camera.CFrame, Camera.CFrame.LookVector * Range, RaycastParams.new())

			if RayCast and RayCast.Instance.Parent:FindFirstChildOfClass("Humanoid") then
				local HitHum = RayCast.Instance.Parent:FindFirstChildOfClass("Humanoid")

				--DD:FireSever(HitHum)
			end
			LoadAnimShoot.Stopped:Wait()
			CanFire = true

		end
	end
end)

UserInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.R then
		if not IsReloading then
			local NewR = Instance.new("Animation")
			NewR.AnimationId = ReAnim
			NewR.Parent = Character:FindFirstChild("Animations")

			CanFire = false
			CanRe = false
			local LoadR = Character:WaitForChild("Humanoid"):LoadAnimation(NewR)
			LoadR:Play()

		end
	end
end)


RunService.RenderStepped:Connect(function()
	local vm = Character:FindFirstChild("VM")
	vm:SetPrimaryPartCFrame(Camera.CFrame)

	for i, instances in pairs(vm:GetDescendants()) do
		if instances:IsA("BasePart") or instances:IsA("UnionOperation") then
			instances.LocalTransparencyModifier = 0
		end
	end
end)
