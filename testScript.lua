-- Criando a GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TeleportButton = Instance.new("TextButton")
local DestroyButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")

-- Configurando a Janela
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 250, 0, 150)
Frame.Position = UDim2.new(0.5, -125, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 2

-- Título
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.Text = "Meu Script - TP & Créditos"
Title.TextSize = 15
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Botão de Teleporte
TeleportButton.Parent = Frame
TeleportButton.Size = UDim2.new(0.8, 0, 0.3, 0)
TeleportButton.Position = UDim2.new(0.1, 0, 0.3, 0)
TeleportButton.Text = "Teleportar Checkpoints"
TeleportButton.TextSize = 14
TeleportButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Botão para Fechar
DestroyButton.Parent = Frame
DestroyButton.Size = UDim2.new(0.8, 0, 0.3, 0)
DestroyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
DestroyButton.Text = "Fechar Script"
DestroyButton.TextSize = 14
DestroyButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
DestroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Função para teleportar
TeleportButton.MouseButton1Click:Connect(function()
    local checkpoints = {
        game:GetService("Workspace").EventPartFolder:FindFirstChild("1").Checkpoint,
        game:GetService("Workspace").EventPartFolder:FindFirstChild("2").Checkpoint,
        game:GetService("Workspace").EventPartFolder:FindFirstChild("3").Checkpoint,
        game:GetService("Workspace").EventPartFolder:FindFirstChild("4").Checkpoint,
        game:GetService("Workspace").EventPartFolder:FindFirstChild("5").Checkpoint
    }
    
    local player = game.Players.LocalPlayer
    for _, checkpoint in ipairs(checkpoints) do
        if checkpoint then
            player.Character:SetPrimaryPartCFrame(checkpoint.CFrame)
            wait(1) -- Pequeno delay entre teleportes
        end
    end
end)

-- Função para fechar a GUI
DestroyButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

print("GUI carregada com sucesso!")
