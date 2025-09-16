-- LocalScript (StarterPlayerScripts)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local text = "ลบการทำงานของสคริปต์สำเร็จ"

-- GUI หลัก
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui
screenGui.Name = "iPhoneEffect"

-- Frame กลางจอ
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.8, 0, 0.2, 0)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundTransparency = 1
frame.Parent = screenGui

-- ฟังก์ชันสร้างตัวอักษร
local function createLetter(char, index)
    local letter = Instance.new("TextLabel")
    letter.Text = char
    letter.Size = UDim2.new(0, 40, 1, 0)
    letter.Position = UDim2.new(0, index * 28, 0, 50) -- เริ่มต่ำกว่าปกติ
    letter.BackgroundTransparency = 1
    letter.TextColor3 = Color3.fromRGB(255, 255, 255)
    letter.Font = Enum.Font.SourceSansBold -- ✅ รองรับภาษาไทย
    letter.TextTransparency = 1
    letter.TextSize = 36
    letter.Parent = frame

    -- Effect หนอน: fade in + เลื่อนขึ้น + ขยายเล็กน้อย
    local tween = TweenService:Create(letter, TweenInfo.new(
        0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
    ), {
        Position = UDim2.new(0, index * 28, 0, 0),
        TextTransparency = 0,
        TextSize = 40
    })

    tween:Play()
end

-- แสดงทีละตัว
for i = 1, #text do
    local char = string.sub(text, i, i)
    task.wait(0.08) -- หน่วงเล็กน้อย
    createLetter(char, i - 1)
end

-- ลบหลัง 3 วินาที
task.delay(3, function()
    screenGui:Destroy()
end)
