-- Lấy Player hiện tại
local player = game:GetService("Players").LocalPlayer or game:GetService("Players"):GetPlayers()[1]
if not player then
    error("Không tìm thấy Player! Đảm bảo bạn đang chạy script trong Play Mode.")
end

-- Lấy PlayerGui
local playerGui = player:FindFirstChild("PlayerGui")
if not playerGui then
    error("Không tìm thấy PlayerGui! Hãy đảm bảo bạn đang ở chế độ Play Test.")
end

-- Tạo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MessageGui"
screenGui.Parent = playerGui

-- Tạo TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Name = "MessageLabel"
textLabel.Parent = screenGui
textLabel.Size = UDim2.new(1, 0, 0.1, 0) -- Ngang toàn màn hình, cao 10% chiều cao màn hình
textLabel.Position = UDim2.new(0, 0, 0.45, 0) -- Giữa màn hình
textLabel.BackgroundTransparency = 1
textLabel.TextTransparency = 1
textLabel.Font = Enum.Font.Arcade -- Phông chữ đẹp
textLabel.TextSize = 60 -- Kích thước chữ lớn
textLabel.TextStrokeTransparency = 0 -- Viền chữ rõ
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0) -- Viền chữ màu đen
textLabel.Text = "Made by zam2109 Roblox"

-- Hiệu ứng xuất hiện (fade-in)
for i = 1, 0, -0.1 do
    textLabel.TextTransparency = i
    textLabel.TextStrokeTransparency = i
    wait(0.1)
end

-- Tạo hiệu ứng bảy sắc cầu vồng
local rainbowColors = {
    Color3.fromRGB(255, 0, 0), -- Đỏ
    Color3.fromRGB(255, 127, 0), -- Cam
    Color3.fromRGB(255, 255, 0), -- Vàng
    Color3.fromRGB(0, 255, 0), -- Lục
    Color3.fromRGB(0, 255, 255), -- Lam nhạt
    Color3.fromRGB(0, 0, 255), -- Lam
    Color3.fromRGB(139, 0, 255) -- Tím
}

-- Thay đổi màu liên tục trong 3 giây
local startTime = tick()
while tick() - startTime < 3 do
    for _, color in ipairs(rainbowColors) do
        textLabel.TextColor3 = color
        wait(0.1) -- Chuyển màu nhanh
    end
end

-- Hiệu ứng biến mất (fade-out)
for i = 0, 1, 0.1 do
    textLabel.TextTransparency = i
    textLabel.TextStrokeTransparency = i
    wait(0.1)
end

-- Xóa ScreenGui
screenGui:Destroy()
wait(0.1)
local ToDisable = {
	Textures = true,
	VisualEffects = true,
	Parts = true,
	Particles = true,
	Sky = true
}

local ToEnable = {
	FullBright = true
}

local Stuff = {}

for _, v in next, game:GetDescendants() do
	if ToDisable.Parts then
		if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then
			v.Material = Enum.Material.SmoothPlastic
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Particles then
		if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then
			v.Enabled = false
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.VisualEffects then
		if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
			v.Enabled = false
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Textures then
		if v:IsA("Decal") or v:IsA("Texture") then
			v.Texture = ""
			table.insert(Stuff, 1, v)
		end
	end
	
	if ToDisable.Sky then
		if v:IsA("Sky") then
			v.Parent = nil
			table.insert(Stuff, 1, v)
		end
	end
end

game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled "..#Stuff.." assets / effects. Settings :")

for i, v in next, ToDisable do
	print(tostring(i)..": "..tostring(v))
end

if ToEnable.FullBright then
    local Lighting = game:GetService("Lighting")
    
    Lighting.FogColor = Color3.fromRGB(255, 255, 255)
    Lighting.FogEnd = math.huge
    Lighting.FogStart = math.huge
    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    Lighting.Brightness = 5
    Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
    Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    Lighting.Outlines = true
end
