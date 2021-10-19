local RS = game:GetService("ReplicatedStorage")
local DD = RS:WaitForChild("Remotes"):FindFirstChild("DD")

DD.OnServerEvent:Connect(function(player, Hum, rayResult, cur)
    local Damage = cur:FindFirstChild("Damage")
    local Amm = cur:FindFirstChild("Amm")
        
    if Amm.Value > 0 and Hum.Health > 0 then
        Amm.Value -= 1
        Hum.Health -= Damage
    end
end)
