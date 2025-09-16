-- LocalScript (ใส่ใน StarterPlayerScripts)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ข้อความที่ต้องการแสดง
local text = "ลบการทำงานของสคริปต์สำเร็จ"

-- สร้าง ScreenGui ของตัวเอง
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui
screenGui.Name = "iPhoneTypingEffect"

-- สร้าง Frame กลางหน้าจอ
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.6, 0, 0.1, 0)
frame.Position = UDim2.new(0.2, 0, 0.45, 0)
frame.BackgroundTransparency = 1
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Parent = screenGui

-- ฟังก์ชันสร้างตัวอักษรทีละตัว
local function createLetter(char, index)
    local letter = Instance.new("TextLabel")
    letter.Text = char
    letter.Size = UDim2.new(0, 20, 1, 0)
    letter.Position = UDim2.new(0, index * 20, 0, 20) -- เริ่มจากต่ำกว่าปกติ 20 px
    letter.BackgroundTransparency = 1
    letter.TextColor3 = Color3.fromRGB(255, 255, 255)
    letter.Font = Enum.Font.GothamBold
    letter.TextScaled = true
    letter.TextStrokeTransparency = 0.5
    letter.Parent = frame

    -- Tween เลื่อนขึ้นและขยาย
    local tween = TweenService:Create(letter, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, index * 20, 0, 0), TextSize = 30})
    tween:Play()
end

-- สร้างตัวอักษรทีละตัว
for i = 1, #text do
    local char = string.sub(text, i, i)
    wait(0.05) -- เวลาระหว่างตัวอักษร
    createLetter(char, i - 1)
end

-- หายไปหลัง 3 วินาที
delay(3, function()
    screenGui:Destroy()
end)
