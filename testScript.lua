-- Criar a tela principal
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.Name = "MyHub"

-- Criar o Frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 500, 0, 300)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Parent = screenGui

-- Criar o título
local title = Instance.new("TextLabel")
title.Parent = mainFrame
title.Text = "Meu Hub"
title.Size = UDim2.new(1, 0, 0, 50)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Gotham
title.TextSize = 24
title.TextAlignment = Enum.TextAlignment.Center

-- Criar o botão de minimização
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 100, 0, 40)
minimizeButton.Position = UDim2.new(1, -110, 0, 10)
minimizeButton.Text = "Minimizar"
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.Gotham
minimizeButton.TextSize = 18
minimizeButton.Parent = mainFrame

-- Criar o botão de restauração (inicialmente invisível)
local restoreButton = Instance.new("TextButton")
restoreButton.Size = UDim2.new(0, 100, 0, 40)
restoreButton.Position = UDim2.new(0.5, -50, 0.5, -100)
restoreButton.Text = "Restaurar"
restoreButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
restoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
restoreButton.Font = Enum.Font.Gotham
restoreButton.TextSize = 18
restoreButton.Visible = false
restoreButton.Parent = screenGui

-- Função para minimizar a GUI
minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    restoreButton.Visible = true
end)

-- Função para restaurar a GUI
restoreButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    restoreButton.Visible = false
end)
