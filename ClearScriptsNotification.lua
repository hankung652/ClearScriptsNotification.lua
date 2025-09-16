-- LocalScript (ใส่ใน StarterPlayerScripts)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- สร้าง ScreenGui ของตัวเอง
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui
screenGui.Name = "iPhoneStartupNotification"

-- สร้าง Frame สำหรับข้อความ
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.6, 0, 0.1, 0)
frame.Position = UDim2.new(0.2, 0, 0.45, 0) -- กลางหน้าจอ
frame.BackgroundTransparency = 1 -- ไม่มี background
frame.AnchorPoint = Vector2.new(0,0)
frame.Parent = screenGui

-- สร้าง Label สำหรับข้อความ
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1,0,1,0)
label.Position = UDim2.new(0,0,0,0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255,255,255)
label.Font = Enum.Font.GothamBold
label.TextScaled = true
label.TextStrokeTransparency = 0.5
label.Text = ""
label.TextXAlignment = Enum.TextXAlignment.Center
label.Parent = frame

-- ข้อความภาษาไทย
local text = "ลบการทำงานของสคริปต์สำเร็จ"

-- ฟังก์ชันพิมพ์ทีละตัวอักษร
spawn(function()
    local displayed = ""
    for i = 1, #text do
        displayed = string.sub(text,1,i)
        label.Text = displayed
        wait(0.05) -- ปรับความเร็วตัวอักษรได้
    end
end)
