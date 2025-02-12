local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

-- Criando a Janela Principal
local Window = OrionLib:MakeWindow({
    Name = "iagocno Script - TP & Créditos", 
    HidePremium = false, 
    SaveConfig = true,
    ConfigFolder = "OrionTest"
})

-- Função para Teleporte
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

-- Adicionando uma aba para o Teleporte
local Tab = Window:MakeTab({
    Name = "Teleportar",
    Icon = "rbxassetid://4483345998", -- Ícone
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Teleportar Checkpoints",
    Callback = teleportToCheckpoints
})

-- Função para Fechar o Menu
local function closeGui()
    OrionLib:Destroy()
end

-- Adicionando uma aba para Fechar
local Tab2 = Window:MakeTab({
    Name = "Configurações",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab2:AddButton({
    Name = "Fechar GUI",
    Callback = closeGui
})

-- Permitir que o usuário mova a janela (arraste)
local dragging = false
local dragStartPos = nil
local dragStartFramePos = nil

-- Tornando a janela arrastável
Window:MakeDraggable(true)

-- Exibindo o Menu
OrionLib:Init()
