local button = script.Parent -- O botão que o jogador clicará
local hubScreen = nil -- A tela do hub que será criada posteriormente

button.MouseButton1Click:Connect(function()
    -- Verificar se o Hub já está aberto
    if hubScreen == nil then
        -- Criar a tela do hub
        hubScreen = Instance.new("ScreenGui")
        hubScreen.Name = "ScriptHub"
        hubScreen.Parent = game.Players.LocalPlayer.PlayerGui
        
        -- Adicionar um fundo simples para o hub
        local background = Instance.new("Frame")
        background.Size = UDim2.new(0.5, 0, 0.5, 0)
        background.Position = UDim2.new(0.25, 0, 0.25, 0)
        background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        background.BackgroundTransparency = 0.5
        background.Parent = hubScreen
        
        -- Adicionar um título ao Hub
        local title = Instance.new("TextLabel")
        title.Text = "Script Hub"
        title.Size = UDim2.new(1, 0, 0.1, 0)
        title.Position = UDim2.new(0, 0, 0, 0)
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1
        title.Parent = background
        
        -- Adicionar um botão para um script, por exemplo
        local scriptButton = Instance.new("TextButton")
        scriptButton.Text = "Executar Script 1"
        scriptButton.Size = UDim2.new(0.8, 0, 0.1, 0)
        scriptButton.Position = UDim2.new(0.1, 0, 0.2, 0)
        scriptButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        scriptButton.Parent = background
        
        scriptButton.MouseButton1Click:Connect(function()
            -- Adicione o script que você deseja executar aqui
            print("Script 1 executado!")
            -- Coloque o código do script que você quer rodar aqui
        end)
        
        -- Adicionar mais botões de scripts, conforme necessário
    else
        -- Fechar o hub se ele já estiver aberto
        hubScreen:Destroy()
        hubScreen = nil
    end
end)
