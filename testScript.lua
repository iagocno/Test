-- Carregar a biblioteca Fluent UI
local FluentLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/FluentUI/FluentUI/main/Source'))()

-- Criando a Janela Principal
local Window = FluentLib:CreateWindow({
    Title = "iagocno Script - TP & Créditos",
    Size = UDim2.new(0, 300, 0, 200),
    Draggable = true -- Tornando a janela arrastável
})

-- Função para Teleportar
local function teleportToCheckpoints()
    local checkpoints = {}
    
    -- Coletando todos os checkpoints na pasta EventPartFolder (Agora de 1 a 8)
    local eventFolder = game:GetService("Workspace"):FindFirstChild("EventPartFolder")
    if eventFolder then
        for i = 1, 8 do
            local checkpoint = eventFolder:FindFirstChild(tostring(i)) -- Checkpoint "1", "2", "3", ..., "8"
            if checkpoint and checkpoint:FindFirstChild("Checkpoint") then
                table.insert(checkpoints, checkpoint.Checkpoint)
            end
        end
    end
    
    -- Teleportando o jogador para cada checkpoint
    local player = game.Players.LocalPlayer
    for _, checkpoint in ipairs(checkpoints) do
        if checkpoint then
            player.Character:SetPrimaryPartCFrame(checkpoint.CFrame)
            wait(10) -- Intervalo de 10 segundos entre os teleportes
        end
    end
end

-- Adicionando um Botão para Teleporte
local TeleportButton = FluentLib:CreateButton({
    Parent = Window,
    Text = "Teleportar Checkpoints",
    Position = UDim2.new(0.1, 0, 0.3, 0),
    Size = UDim2.new(0.8, 0, 0.2, 0),
    Callback = teleportToCheckpoints
})

-- Função para Fechar o Menu
local function closeGui()
    Window:Destroy()
end

-- Adicionando um Botão de Fechar
local CloseButton = FluentLib:CreateButton({
    Parent = Window,
    Text = "Fechar GUI",
    Position = UDim2.new(0.1, 0, 0.6, 0),
    Size = UDim2.new(0.8, 0, 0.2, 0),
    Callback = closeGui
})

-- Inicializando a Biblioteca
FluentLib:Init()
