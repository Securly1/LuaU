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

local ShootingAnim = "AnimId"

Mouse.MouseButton1Down:Connect(function()
    if CanFire then
        CanFire = false
        local NewAnimShoot = Instance.New("Animation")
        NewAnimShoot.AnimationId = ShootingAnim
        NewAnimShoot.Parent = Character:FindFirstChild("Animations")
   
        if Character:WaitForChild("Humanoid") then
            local LoadAnimShoot = Character:WaitForChild("Humanoid"):LoadAnimation(NewAnimShoot)
            local DD = game:GetService("ReplicatedStorage"):WaitForChild("DD")
            
            LoadAnimShoot:Play()
            
            local RayCast = workspace:RayCast(Camera.CFrame, Camera.CFrame.LookVector * Range, RaycastParameters.New())
                
            if RayCast and RayCast.Instance.Parent:FindFirstChildOfClass("Humanoid") then
                local HitHum = RayCast.Instance.Parent:FindFirstChildOfClass("Humanoid")
                    
                DD:FireSever(HitHum)
            end
            LoadAnimShoot.Stopped:Wait()
            CanFire = true
            
        end
    end
end)



RunService.RenderStepped:Connect(function()
    ViewModel:SetPrimaryPartCFrame(Camera.CFrame)
end)
