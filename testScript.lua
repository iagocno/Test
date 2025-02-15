if not game:IsLoaded() then game.Loaded:Wait() end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Imalwibest/Imalwibest/refs/heads/main/Fluxus%20Ui.lib"))()
local gameName = "Nome do Jogo"  -- Substitua pelo nome do seu jogo
local Window = lib:CreateWindow(gameName)

local QuitUI = Window:NewTab("Quit UI")
QuitUI:AddButton("Quit UI", "Bye bye", function() 
    sendNotification("Quit UI", "Thx for use", 10)
    lib:Destroy()  -- Fecha a UI
end)

-- Função para enviar notificações
local function sendNotification(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 3,
    })
end

-- Inicializa a UI
lib:Init()
