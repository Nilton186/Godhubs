-- Interface e biblioteca
print("📦 Script iniciado!") -- debug
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library:CreateWindow("Anime Power Hub")

-- Configurações
getgenv().Settings = {
    autoClick = false,
    autoCollect = false,
    autoAbility = false,
    autoRankUp = false,
    autoEvolve = false,
    autoTimeRewards = false,
    autoQuest = false,

    Worlds = {
        Shinobi = false,
        Namek = false,
    },

    dungeons = {
        Easy = false,
        Medium = false,
        Hard = false,
    },

    stars = {
        Shinobi = false,
        Namek = false,
    },

    autoTower = false,
    autoDefense = false,
    autoAnthill = false,
    autoRaid = false,
    autoPortal = false,
    autoBarbarian = false,

    autoBuyTitle = false,
    autoSpinWheel = false,
    autoHatchChampion = false,
}

-- GUI Básico
local T1 = Window:CreateTab("Grind")
T1:CreateToggle("Auto Click", nil, function(v) Settings.autoClick = v end)
T1:CreateToggle("Auto Collect", nil, function(v) Settings.autoCollect = v end)
T1:CreateToggle("Auto Ability", nil, function(v) Settings.autoAbility = v end)
T1:CreateToggle("Auto RankUp", nil, function(v) Settings.autoRankUp = v end)
T1:CreateToggle("Auto Evolve", nil, function(v) Settings.autoEvolve = v end)
T1:CreateToggle("Auto TimeRewards", nil, function(v) Settings.autoTimeRewards = v end)
T1:CreateToggle("Auto Quest", nil, function(v) Settings.autoQuest = v end)

local T2 = Window:CreateTab("Mundos & Dungeons")
for w,_ in pairs(Settings.Worlds) do
    T2:CreateToggle("Farm " .. w, nil, function(v) Settings.Worlds[w] = v end)
end
for d,_ in pairs(Settings.dungeons) do
    T2:CreateToggle("Dungeon " .. d, nil, function(v) Settings.dungeons[d] = v end)
end

local T3 = Window:CreateTab("Stars / Rolls")
T3:CreateToggle("Shinobi Star", nil, function(v) Settings.stars.Shinobi = v end)
T3:CreateToggle("Namek Star", nil, function(v) Settings.stars.Namek = v end)
T3:CreateToggle("Auto Hatch Champion", nil, function(v) Settings.autoHatchChampion = v end)
T3:CreateToggle("Auto Buy Title", nil, function(v) Settings.autoBuyTitle = v end)
T3:CreateToggle("Auto Spin Wheel", nil, function(v) Settings.autoSpinWheel = v end)

local T4 = Window:CreateTab("Modos Especiais")
T4:CreateToggle("Auto Tower", nil, function(v) Settings.autoTower = v end)
T4:CreateToggle("Auto Defense", nil, function(v) Settings.autoDefense = v end)
T4:CreateToggle("Auto Anthill", nil, function(v) Settings.autoAnthill = v end)
T4:CreateToggle("Auto Raid", nil, function(v) Settings.autoRaid = v end)
T4:CreateToggle("Auto Portal", nil, function(v) Settings.autoPortal = v end)
T4:CreateToggle("Auto Barbarian", nil, function(v) Settings.autoBarbarian = v end)

-- Serviços
local RS = game:GetService("ReplicatedStorage")
local WS = game:GetService("Workspace")
local LP = game:GetService("Players").LocalPlayer

local function re(n)
    return RS:FindFirstChild(n)
end

-- Funções de Automação
spawn(function()
    while wait(0.15) do
        if Settings.autoClick and re("ClickEvent") then
            re("ClickEvent"):FireServer()
        end
        if Settings.autoCollect then
            for _,d in pairs(WS:GetDescendants()) do
                if d.Name == "Drop" and d:IsA("BasePart") and LP.Character then
                    firetouchinterest(d, LP.Character.HumanoidRootPart, 0)
                    firetouchinterest(d, LP.Character.HumanoidRootPart, 1)
                end
            end
        end
        if Settings.autoAbility and re("UseAbility") then
            re("UseAbility"):FireServer()
        end
    end
end)

spawn(function()
    while wait(1) do
        if Settings.autoRankUp and re("RankUp") then
            re("RankUp"):FireServer()
        end
        if Settings.autoEvolve and re("Evolve") then
            re("Evolve"):FireServer()
        end
        if Settings.autoTimeRewards and re("TimeReward") then
            re("TimeReward"):FireServer()
        end
        if Settings.autoQuest and re("CompleteQuest") then
            re("CompleteQuest"):FireServer()
        end
    end
end)

spawn(function()
    while wait(0.7) do
        for w,_ in pairs(Settings.Worlds) do
            if Settings.Worlds[w] and re("Farm_"..w) then
                re("Farm_"..w):FireServer()
            end
        end
    end
end)
