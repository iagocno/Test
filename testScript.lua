local Notification = require(game:GetService("ReplicatedStorage").Notification)
Notification.new("<Color=Cyan>zam2109 HUB <Color=/>"):Display()
wait(0.5)
Notification.new("<Color=Yellow>zam2109 is King 👑<Color=/>"):Display()
require(game.ReplicatedStorage:WaitForChild("Notification")).new(" <Color=Red>Shop zam2109 Roblox: https://urlvn.net/zvuq63y<Color=/> "):Display()
require(game.ReplicatedStorage:WaitForChild("Notification")).new(" <Color=Green>Welcome to zam2109 Roblox Community<Color=/> "):Display()
require(game.ReplicatedStorage:WaitForChild("Notification")).new(" <Color=Yellow>https://discord.gg/3f6SUbGneC<Color=/> "):Display()

-- Phát nhạc khi mã chạy (ID nhạc khi chạy mã là 83142874256382)
local joinSound = Instance.new("Sound")
joinSound.Name = "JoinSound"
joinSound.SoundId = "rbxassetid://18315905210" -- ID nhạc khi chạy mã
joinSound.Volume = 3
joinSound.Looped = true
joinSound.Parent = workspace
joinSound:Play()

game.StarterGui:SetCore(
    "SendNotification",
    {
        Title = "YTB : zam2109 Roblox",
        Text = "Like sub đi mấy Fen",
        Duration = 100000
    })
wait(0.1)
local MaxSpeed = 200 -- Studs per second 380 no flag but kick

local LocalPlayer = game:GetService("Players").LocalPlayer
local Locations = workspace._WorldOrigin.Locations

local function getCharacter()
    if not LocalPlayer.Character then
        LocalPlayer.CharacterAdded:Wait()
    end
    LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    return LocalPlayer.Character
end

local function DistanceFromPlrSort(ObjectList: table)
    local RootPart = getCharacter().LowerTorso
    table.sort(ObjectList, function(ChestA, ChestB)
        local RootPos = RootPart.Position
        local DistanceA = (RootPos - ChestA.Position).Magnitude
        local DistanceB = (RootPos - ChestB.Position).Magnitude
        return DistanceA < DistanceB
    end)
end

local UncheckedChests = {}
local FirstRun = true

local function getChestsSorted()
    if FirstRun then
        FirstRun = false
        local Objects = game:GetDescendants()
        for i, Object in pairs(Objects) do
            if Object.Name:find("Chest") and Object.ClassName == "Part" then
                table.insert(UncheckedChests, Object)
            end
        end
    end
    local Chests = {}
    for i, Chest in pairs(UncheckedChests) do
        if Chest:FindFirstChild("TouchInterest") then
            table.insert(Chests, Chest)
        end
    end
    DistanceFromPlrSort(Chests)
    return Chests
end

local function toggleNoclip(Toggle: boolean)
    for i,v in pairs(getCharacter():GetChildren()) do
        if v.ClassName == "Part" then
            v.CanCollide = not Toggle
        end
    end
end

local function Teleport(Goal: CFrame, Speed)
    if not Speed then
        Speed = MaxSpeed
    end
    toggleNoclip(true)
    local RootPart = getCharacter().HumanoidRootPart
    local Magnitude = (RootPart.Position - Goal.Position).Magnitude

    RootPart.CFrame = RootPart.CFrame
    
    while not (Magnitude < 1) do
        local Direction = (Goal.Position - RootPart.Position).unit
        RootPart.CFrame = RootPart.CFrame + Direction * (Speed * wait())
        Magnitude = (RootPart.Position - Goal.Position).Magnitude
    end
    toggleNoclip(false)
end

local function main()
    while wait() do
        local Chests = getChestsSorted()
        if #Chests > 0 then
            Teleport(Chests[1].CFrame)
        else
            -- You can put serverhop here
        end
    end
end

wait = task.wait
main()
