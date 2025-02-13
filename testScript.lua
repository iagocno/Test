-- Criação da GUI principal (ScreenGui)
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.Name = "MainGui"

-- Criar o Frame principal que será a "janela" do hub
local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Size = UDim2.new(0, 500, 0, 300)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true

-- Título da GUI
local title = Instance.new("TextLabel")
title.Parent = mainFrame
title.Text = "Meu Hub"
title.Size = UDim2.new(1, 0, 0, 50)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.Gotham
title.TextSize = 24
title.TextAlignment = Enum.TextAlignment.Center

-- Botão de minimizar (usado para esconder a GUI)
local minimizeButton = Instance.new("TextButton")
minimizeButton.Parent = mainFrame
minimizeButton.Text = "Minimizar"
minimizeButton.Size = UDim2.new(0, 100, 0, 40)
minimizeButton.Position = UDim2.new(1, -110, 0, 10)
minimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.Gotham
minimizeButton.TextSize = 18

-- Botão de restaurar (fica visível quando a GUI é minimizada)
local restoreButton = Instance.new("TextButton")
restoreButton.Parent = screenGui
restoreButton.Text = "Restaurar"
restoreButton.Size = UDim2.new(0, 100, 0, 40)
restoreButton.Position = UDim2.new(0.5, -50, 0.5, -100)
restoreButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
restoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
restoreButton.Font = Enum.Font.Gotham
restoreButton.TextSize = 18
restoreButton.Visible = false -- Inicialmente invisível

-- Função de minimizar a GUI
minimizeButton.MouseButton1Click:Connect(function()
    -- Esconder o Frame principal
    mainFrame.Visible = false
    -- Exibir o botão de restaurar
    restoreButton.Visible = true
end)

-- Função de restaurar a GUI
restoreButton.MouseButton1Click:Connect(function()
    -- Mostrar o Frame principal novamente
    mainFrame.Visible = true
    -- Esconder o botão de restaurar
    restoreButton.Visible = false
end)

-- Aqui você pode adicionar mais componentes à sua GUI, como botões, textos, etc.

-- Exemplo de botão dentro do hub
local exampleButton = Instance.new("TextButton")
exampleButton.Parent = mainFrame
exampleButton.Text = "Clique aqui"
exampleButton.Size = UDim2.new(0, 200, 0, 50)
exampleButton.Position = UDim2.new(0.5, -100, 0.5, -25)
exampleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
exampleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
exampleButton.Font = Enum.Font.Gotham
exampleButton.TextSize = 18

-- Adicionar ações ao botão de exemplo
exampleButton.MouseButton1Click:Connect(function()
    print("Você clicou no botão!")
end)
