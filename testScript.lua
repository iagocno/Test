-- Notificação ao iniciar
local CoreGui = game:GetService("StarterGui")
CoreGui:SetCore("SendNotification", {
    Title = "🗿🍷",
    Text = "Loading Content...",
    Duration = 5,
})

print("Loading Content...")

-- Evitar kick por inatividade
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- Checkpoints
local checkpoints = {}
for i = 1, 20 do
    local checkpoint = workspace.EventPartFolder:FindFirstChild(tostring(i))
    if checkpoint then
        table.insert(checkpoints, checkpoint)
    end
end

-- Função para loop normal
local function loopNormal()
    task.spawn(function()
        while true do
            for _, checkpoint in ipairs(checkpoints) do
                game:GetService("ReplicatedStorage").RemoteMessenger.SendData:FireServer("CheckPointUpdate", checkpoint)
                task.wait()
            end
        end
    end)
end

-- Função para loop infinito
local function loopInf()
    task.spawn(function()
        while true do
            for _, checkpoint in ipairs(checkpoints) do
                game:GetService("ReplicatedStorage").RemoteMessenger.SendData:FireServer("CheckPointUpdate", checkpoint)
                task.wait(0.1) -- Pequeno delay para evitar lag
            end
        end
    end)
end

-- Criando a GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Tabs = Instance.new("Frame")
local loopNormalButton = Instance.new("TextButton")
local loopInfButton = Instance.new("TextButton")
local CreditsButton = Instance.new("TextButton")
local TeleportButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local CreditsFrame = Instance.new("Frame")
local TeleportFrame = Instance.new("Frame")

ScreenGui.Parent = game.CoreGui

MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 250, 0, 300)
MainFrame.Position = UDim2.new(0.5, -125, 0.4, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.Text = "Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

Tabs.Parent = MainFrame
Tabs.Size = UDim2.new(1, 0, 0, 30)
Tabs.Position = UDim2.new(0, 0, 0, 30)

loopNormalButton.Parent = Tabs
loopNormalButton.Size = UDim2.new(0.25, 0, 1, 0)
loopNormalButton.Position = UDim2.new(0.5, 0, 0, 0)
loopNormalButton.Text = "Loop Normal"
loopNormalButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
loopNormalButton.TextColor3 = Color3.fromRGB(255, 255, 255)
loopNormalButton.MouseButton1Click:Connect(loopNormal)

loopInfButton.Parent = Tabs
loopInfButton.Size = UDim2.new(0.25, 0, 1, 0)
loopInfButton.Position = UDim2.new(0.75, 0, 0, 0)
loopInfButton.Text = "Loop Inf"
loopInfButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
loopInfButton.TextColor3 = Color3.fromRGB(255, 255, 255)
loopInfButton.MouseButton1Click:Connect(loopInf)

CreditsButton.Parent = Tabs
CreditsButton.Size = UDim2.new(0.25, 0, 1, 0)
CreditsButton.Position = UDim2.new(0.25, 0, 0, 0)
CreditsButton.Text = "Créditos"
CreditsButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
CreditsButton.TextColor3 = Color3.fromRGB(255, 255, 255)

TeleportButton.Parent = Tabs
TeleportButton.Size = UDim2.new(0.25, 0, 1, 0)
TeleportButton.Text = "Teleportes"
TeleportButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)

CreditsFrame.Parent = MainFrame
CreditsFrame.Size = UDim2.new(1, 0, 1, -60)
CreditsFrame.Position = UDim2.new(0, 0, 0, 60)
CreditsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

TeleportFrame.Parent = MainFrame
TeleportFrame.Size = UDim2.new(1, 0, 1, -60)
TeleportFrame.Position = UDim2.new(0, 0, 0, 60)
TeleportFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TeleportFrame.Visible = false

local CreditText = Instance.new("TextLabel", CreditsFrame)
CreditText.Size = UDim2.new(1, 0, 1, -50)
CreditText.Text = "Criado por iagocno🗿🍷"
CreditText.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditText.BackgroundTransparency = 1
CreditText.TextSize = 16

CloseButton.Parent = CreditsFrame
CloseButton.Size = UDim2.new(1, 0, 0, 30)
CloseButton.Position = UDim2.new(0, 0, 1, -40)
CloseButton.Text = "Fechar UI"
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Criando botões de teleporte
for i, checkpoint in ipairs(checkpoints) do
    local TeleportOption = Instance.new("TextButton", TeleportFrame)
    TeleportOption.Size = UDim2.new(1, 0, 0, 25)
    TeleportOption.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
    TeleportOption.Text = "Teleportar para " .. i
    TeleportOption.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TeleportOption.TextColor3 = Color3.fromRGB(255, 255, 255)

    TeleportOption.MouseButton1Click:Connect(function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = checkpoint.CFrame
        end
    end)
end
