-- Get the player's mouse
local mouse = game.Players.LocalPlayer:GetMouse()

-- Create a new tool
local tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "zam2109 Roblox HUB"

-- Function to send a notification
local function sendNotification(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 5,
        Button1 = "zam2109 Roblox HUB",
        Button1Color = BrickColor.new("Really red").Color
    })
end

-- Connect the tool's Activated event
tool.Activated:connect(function()
    -- Calculate the new position for teleportation
    local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
    pos = CFrame.new(pos.X, pos.Y, pos.Z)

    -- Teleport the player's character
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos

    -- Send a red notification after teleportation
    sendNotification("Teleport thành công", "Like và Subcribe cho zam đê")
end)

-- Parent the tool to the player's backpack
tool.Parent = game.Players.LocalPlayer.Backpack
