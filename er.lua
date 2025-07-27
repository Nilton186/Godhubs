-- Previne múltiplos carregamentos
if _G.APLoaded then return end
_G.APLoaded = true

-- Biblioteca GUI Kavo UI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library:CreateWindow("Anime Power Hub")

-- Configurações
getgenv().Settings = {
    autoClick=true, autoCollect=true, autoAbility=true,
    autoRankUp=true, autoEvolve=true, autoTimeRewards=true, autoQuest=true,
    worlds={Shinobi=false,BoarTavern=false,Namek=false,Shadows=false,CursedSchool=false,SkyLands=false},
    dungeons={Easy=false,Medium=false,Hard=false,Insane=false},
    stars={Shinobi=false,Namek=false},
    rolls={Sword=false,Lineage=false},
    autoTower=false, autoDefense=false, autoAnthill=false, autoRaid=false, autoPortal=false, autoBarbarian=false,
    autoBuyTitle=false, autoSpinWheel=false, autoHatchChampion=false
}

-- GUI tabs
local T1=Window:CreateTab("Grind Básico")
T1:CreateToggle("Auto Click", nil, function(v) Settings.autoClick = v end)
T1:CreateToggle("Auto Collect", nil, function(v) Settings.autoCollect = v end)
T1:CreateToggle("Auto Ability", nil, function(v) Settings.autoAbility = v end)
T1:CreateToggle("Auto RankUp", nil, function(v) Settings.autoRankUp = v end)
T1:CreateToggle("Auto Evolve", nil, function(v) Settings.autoEvolve = v end)
T1:CreateToggle("Auto TimeRewards", nil, function(v) Settings.autoTimeRewards = v end)
T1:CreateToggle("Auto Quest", nil, function(v) Settings.autoQuest = v end)

local T2=Window:CreateTab("Mundos & Dungeons")
for w,_ in pairs(getgenv().Settings.worlds) do
    T2:CreateToggle("Farm "..w, nil, function(v) Settings.worlds[w] = v end)
end
for d,_ in pairs(getgenv().Settings.dungeons) do
    T2:CreateToggle("Dungeon "..d, nil, function(v) Settings.dungeons[d] = v end)
end

local T3=Window:CreateTab("Stars / Roll")
T3:CreateToggle("Open Shinobi Star", nil, function(v) Settings.stars.Shinobi = v end)
T3:CreateToggle("Open Namek Star", nil, function(v) Settings.stars.Namek = v end)
T3:CreateToggle("Roll Sword", nil, function(v) Settings.rolls.Sword = v end)
T3:CreateToggle("Roll Lineage", nil, function(v) Settings.rolls.Lineage = v end)
T3:CreateToggle("Hatch Champion", nil, function(v) Settings.autoHatchChampion = v end)
T3:CreateToggle("Buy Title", nil, function(v) Settings.autoBuyTitle = v end)
T3:CreateToggle("Spin Wheel", nil, function(v) Settings.autoSpinWheel = v end)

local T4=Window:CreateTab("Modos Especiais")
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
local function re(n) return RS:FindFirstChild(n) end

-- Funções principais
spawn(function()
    while wait(0.15) do
        if Settings.autoClick and re("ClickEvent") then re("ClickEvent"):FireServer() end
        if Settings.autoCollect then
            for _,d in ipairs(WS:GetDescendants()) do
                if d.Name=="Drop" and d:IsA("BasePart") and LP.Character then
                    firetouchinterest(LP.Character.HumanoidRootPart, d, 0)
                    firetouchinterest(LP.Character.HumanoidRootPart, d, 1)
                end
            end
        end
        if Settings.autoAbility and re("UseAbility") then re("UseAbility"):FireServer() end
    end
end)

spawn(function()
    while wait(1) do
        if Settings.autoRankUp and re("RankUp") then re("RankUp"):FireServer() end
        if Settings.autoEvolve and re("Evolve") then re("Evolve"):FireServer() end
        if Settings.autoTimeRewards and re("TimeReward") then re("TimeReward"):FireServer() end
        if Settings.autoQuest and re("CompleteQuest") then re("CompleteQuest"):FireServer() end
    end
end)

spawn(function()
    while wait(0.7) do
        for w,on in pairs(Settings.worlds) do
            if on and re("Farm"..w) then re("Farm"..w):FireServer() end
        end
    end
end)

spawn(function()
    while wait(2) do
        for d,on in pairs(Settings.dungeons) do
            if on and re("Dungeon"..d) then re("Dungeon"..d):FireServer() end
        end
    end
end)

spawn(function()
    while wait(1) do
        if Settings.stars.Shinobi and re("OpenShinobiStar") then re("OpenShinobiStar"):FireServer() end
        if Settings.stars.Namek and re("OpenNamekStar") then re("OpenNamekStar"):FireServer() end
        if Settings.rolls.Sword and re("RollSword") then re("RollSword"):FireServer() end
        if Settings.rolls.Lineage and re("RollLineage") then re("RollLineage"):FireServer() end
        if Settings.autoHatchChampion and re("HatchChampion") then re("HatchChampion"):FireServer() end
        if Settings.autoBuyTitle and re("BuyTitle") then re("BuyTitle"):FireServer() end
        if Settings.autoSpinWheel and re("SpinWheel") then re("SpinWheel"):FireServer() end
    end
end)

spawn(function()
    while wait(1) do
        if Settings.autoTower and re("TowerMode") then re("TowerMode"):FireServer() end
        if Settings.autoDefense and re("DefenseMode") then re("DefenseMode"):FireServer() end
        if Settings.autoAnthill and re("AnthillMode") then re("AnthillMode"):FireServer() end
        if Settings.autoRaid and re("RaidMode") then re("RaidMode"):FireServer() end
        if Settings.autoPortal and re("PortalMode") then re("PortalMode"):FireServer() end
        if Settings.autoBarbarian and re("BarbarianMode") then re("BarbarianMode"):FireServer() end
    end
end)
