local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by dawid",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,  -- Adicionando efeito de acrílico
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Tecla de minimizar
})

-- Criação das abas
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- Função para teleportar para os checkpoints
local function teleportToCheckpoints()
    local checkpoints = {}
    
    -- Procurar os checkpoints numerados de 1 a 8
    local eventFolder = game:GetService("Workspace"):FindFirstChild("EventPartFolder")
    if eventFolder then
        for i = 1, 8 do
            local checkpoint = eventFolder:FindFirstChild(tostring(i))  -- Checkpoints "1", "2", ..., "8"
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
            wait(10)  -- Intervalo de 10 segundos
        end
    end
end

-- Adicionando botão de Teleportar para os checkpoints
Tabs.Main:AddButton({
    Title = "Teleportar Checkpoints",  -- Título do botão
    Callback = teleportToCheckpoints  -- Função de teleporte
})

-- Função para esconder ou mostrar a janela
local function toggleWindow()
    if Window.Visible then
        Window:Hide()  -- Esconde a janela
    else
        Window:Show()  -- Mostra a janela
    end
end

-- Botão para recolher/mostrar a janela
Tabs.Main:AddButton({
    Title = "Recolher/Mostrar GUI",  -- Título do botão
    Callback = toggleWindow  -- Função de alternar a visibilidade
})

-- Notificação de carregamento
Fluent:Notify({
    Title = "Fluent",
    Content = "O script foi carregado com sucesso!",
    Duration = 5  -- Duração da notificação
})

-- Função de configurar o SaveManager e InterfaceManager
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

-- Adicionando a seção de configurações no Settings Tab
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

-- Carregar configuração salva automaticamente
SaveManager:LoadAutoloadConfig()
