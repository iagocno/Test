-- Supondo que você já tenha a biblioteca NubHud instalada e configurada

local NubHud = require(game.ServerStorage.NubHud) -- Ajuste o caminho conforme necessário

-- Criar a GUI principal
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Criar o botão de minimizar
local minimizeButton = NubHud.new("MinimizeButton")
minimizeButton:SetLabel("Minimizar")
minimizeButton:SetPosition(UDim2.new(0, 10, 0, 10))
minimizeButton:SetSize(UDim2.new(0, 100, 0, 50))
minimizeButton:BindToFunction("TouchTap", function()
    -- Ocultar a GUI principal
    screenGui.Enabled = false
    -- Exibir o ícone de restauração
    restoreButton.Visible = true
end)

-- Criar o ícone de restauração
local restoreButton = NubHud.new("RestoreButton")
restoreButton:SetLabel("Restaurar")
restoreButton:SetPosition(UDim2.new(0, 10, 0, 10))
restoreButton:SetSize(UDim2.new(0, 100, 0, 50))
restoreButton.Visible = false
restoreButton:BindToFunction("TouchTap", function()
    -- Restaurar a GUI principal
    screenGui.Enabled = true
    -- Ocultar o ícone de restauração
    restoreButton.Visible = false
end)
