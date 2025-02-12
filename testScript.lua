-- Carregar a biblioteca Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Criar a Janela
local Window = Fluent:CreateWindow({
    Title = "Teleport Script",
    Size = UDim2.fromOffset(300, 200),
    Theme = "Dark",
    Draggable = true  -- Tornar a janela arrastável
})

-- Adicionar aba Principal
local MainTab = Window:AddTab({ Title = "Main" })

-- Função de Teleporte para Checkpoints
local function teleportToCheckpoints()
    local checkpoints = {}
    
    -- Coletar checkpoints de 1 a 8
    local eventFolder = game:GetService("Workspace"):FindFirstChild("EventPartFolder")
    if eventFolder then
        for i = 1, 8 do
            local checkpoint = eventFolder:FindFirstChild(tostring(i)) -- Checkpoint "1", "2", ..., "8"
            if checkpoint and checkpoint:FindFirstChild("Checkpoint") then
                table.insert(checkpoints, checkpoint.Checkpoint)
            end
        end
    end
    
    -- Teleportar para cada checkpoint
    local player = game.Players.LocalPlayer
    for _, checkpoint in ipairs(checkpoints) do
        if checkpoint then
            player.Character:SetPrimaryPartCFrame(checkpoint.CFrame)
            wait(10) -- Intervalo de 10 segundos entre os teleportes
        end
    end
end

-- Adicionar um botão para teleportar
MainTab:AddButton({
    Title = "Teleportar Checkpoints",
    Callback = teleportToCheckpoints
})

-- Função para fechar o GUI
local function closeGui()
    Window:Destroy()
end

-- Adicionar um botão para fechar a GUI
MainTab:AddButton({
    Title = "Fechar GUI",
    Callback = closeGui
})

-- Mostrar Notificação de Sucesso
Fluent:Notify({
    Title = "Fluent UI",
    Content = "Script carregado com sucesso!",
    Duration = 5
})
