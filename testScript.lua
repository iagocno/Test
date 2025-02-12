local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")
TextLabel.Parent = ScreenGui
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Position = UDim2.new(0.5, -100, 0.5, -25)
TextLabel.Text = "Script funcionando!"
TextLabel.TextSize = 20
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

print("GUI carregada!")
