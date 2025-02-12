local checkpoints = {
    game:GetService("Workspace").EventPartFolder["14"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["13"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["12"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["11"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["10"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["9"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["8"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["7"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["6"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["5"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["4"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["3"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["2"].Checkpoint,
    game:GetService("Workspace").EventPartFolder["1"].Checkpoint
}

-- Criando a GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Tabs = Instance.new("Frame")
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

CreditsButton.Parent = Tabs
CreditsButton.Size = UDim2.new(0.5, 0, 1, 0)
CreditsButton.Text = "Créditos"
CreditsButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
CreditsButton.TextColor3 = Color3.fromRGB(255, 255, 255)

TeleportButton.Parent = Tabs
TeleportButton.Size = UDim2.new(0.5, 0, 1, 0)
TeleportButton.Position = UDim2.new(0.5, 0, 0, 0)
TeleportButton.Text = "Teleportes"
TeleportButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)

CreditsFrame.Parent = MainFrame
CreditsFrame.Size = UDim2.new(1, 0, 1, -60)
CreditsFrame.Position = UDim2.new(0, 0, 0, 60)
CreditsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

local CreditText = Instance.new("TextLabel", CreditsFrame)
CreditText.Size = UDim2.new(1, 0, 1, -50)
CreditText.Text = "Criado por SeuNome"
CreditText.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditText.BackgroundTransparency = 1
CreditText.TextSize = 16

CloseButton.Parent = CreditsFrame
CloseButton.Size = UDim2.new(1, 0, 0, 30)
CloseButton.Position = UDim2.new(0, 0, 1, -40)
CloseButton.Text = "Fechar UI"
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

TeleportFrame.Parent = MainFrame
TeleportFrame.Size = UDim2.new(1, 0, 1, -60)
TeleportFrame.Position = UDim2.new(0, 0, 0, 60)
TeleportFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TeleportFrame.Visible = false

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
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = checkpoint.CFrame
        end
    end)
end

-- Alternar entre abas
CreditsButton.MouseButton1Click:Connect(function()
    CreditsFrame.Visible = true
    TeleportFrame.Visible = false
end)

TeleportButton.MouseButton1Click:Connect(function()
    CreditsFrame.Visible = false
    TeleportFrame.Visible = true
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)