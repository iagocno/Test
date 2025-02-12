-- Carregar a biblioteca Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Criar a Janela
local Window = Fluent:CreateWindow({
    Title = "Teleport & Control",  -- Título da janela
    Size = UDim2.fromOffset(350, 250),  -- Tamanho ajustado para dispositivos móveis
    Theme = "Dark",
    Draggable = true  -- Permite que a janela seja movida
})

-- Adicionar Aba Principal
local MainTab = Window:AddTab({ Title = "Main" })

-- Função para Teleportar para Checkpoints
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
    
    -- Teleportar para cada checkpoint com intervalo de 10 segundos
    local player = game.Players.LocalPlayer
    for _, checkpoint in ipairs(checkpoints) do
        if checkpoint then
            player.Character:SetPrimaryPartCFrame(checkpoint.CFrame)
            wait(10) -- Intervalo de 10 segundos entre os teleportes
        end
    end
end

-- Adicionar o Botão de Teleporte
MainTab:AddButton({
    Title = "Teleportar Checkpoints",  -- Título do botão
    Callback = teleportToCheckpoints  -- Função chamada quando o botão for pressionado
})

-- Função para Fechar a GUI
local function closeGui()
    Window:Destroy()
end

-- Adicionar o Botão para Fechar a GUI
MainTab:AddButton({
    Title = "Fechar GUI",  -- Título do botão
    Callback = closeGui  -- Função chamada quando o botão for pressionado
})

-- Criar um controle para recolher a janela
local function toggleWindow()
    if Window.Visible then
        Window:Hide()  -- Esconde a janela
    else
        Window:Show()  -- Exibe a janela
    end
end

-- Adicionar o botão para recolher a janela
MainTab:AddButton({
    Title = "Recolher/Mostrar GUI",  -- Título do botão
    Callback = toggleWindow  -- Função chamada quando o botão for pressionado
})

-- Mostrar Notificação de Sucesso
Fluent:Notify({
    Title = "Fluent UI",
    Content = "Script carregado com sucesso!",
    Duration = 5  -- Duração da notificação
})
