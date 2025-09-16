-- LocalScript
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local text = "ลบการทำงานของสคริปต์สำเร็จ"

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui
screenGui.Name = "iPhoneTypingEffect"

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.6,0,0.1,0)
frame.Position = UDim2.new(0.2,0,0.45,0)
frame.BackgroundTransparency = 1
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Parent = screenGui

local function createLetter(char, index)
    local letter = Instance.new("TextLabel")
    letter.Text = char
    letter.Size = UDim2.new(0, 20, 1, 0)
    letter.Position = UDim2.new(0, index*20, 0, 20)
    letter.BackgroundTransparency = 1
    letter.TextColor3 = Color3.fromRGB(255,255,255)
    letter.Font = Enum.Font.SourceSansBold  -- เปลี่ยน Font เป็นที่รองรับไทย
    letter.TextSize = 24
    letter.Parent = frame

    local tween = TweenService:Create(letter, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, index*20, 0, 0)})
    tween:Play()
end

for i = 1,#text do
    local char = string.sub(text,i,i)
    wait(0.05)
    createLetter(char,i-1)
end

delay(3,function()
    screenGui:Destroy()
end)
