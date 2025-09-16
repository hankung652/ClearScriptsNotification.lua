-- LocalScript (ใส่ใน StarterPlayerScripts)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ลบ ScreenGui ทั้งหมดก่อน
for _, gui in pairs(playerGui:GetChildren()) do
    if gui:IsA("ScreenGui") then
        gui:Destroy()
    end
end

-- ฟังก์ชันสร้าง Notification แบบ iPhone พรีเมียม
local function showPremiumNotification(text, duration)
    duration = duration or 3
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = playerGui

    -- Frame หลักของ Notification
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.08, 0)
    frame.Position = UDim2.new(0.25, 0, -0.1, 0) -- เริ่มอยู่นอกหน้าจอด้านบน
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.BackgroundTransparency = 0.6
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Parent = screenGui
    frame.ZIndex = 10
    frame.ClipsDescendants = true

    -- มุมโค้งมน
    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0, 16)
    uicorner.Parent = frame

    -- เงาเบา ๆ
    local uistroke = Instance.new("UIStroke")
    uistroke.Thickness = 1.5
    uistroke.Color = Color3.fromRGB(0,0,0)
    uistroke.Transparency = 0.6
    uistroke.Parent = frame

    -- Label ข้อความ
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 1, -10)
    label.Position = UDim2.new(0, 5, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.TextStrokeTransparency = 0.5
    label.Parent = frame

    -- Tween ให้เด้งลงมาแบบ Bounce
    local tweenDown = TweenService:Create(frame, TweenInfo.new(0.7, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Position = UDim2.new(0.25, 0, 0.05, 0)})
    tweenDown:Play()

    -- รอครบ duration แล้ว Tween ขึ้นหายไป
    delay(duration, function()
        local tweenUp = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.25, 0, -0.1, 0)})
        tweenUp:Play()
        tweenUp.Completed:Connect(function()
            screenGui:Destroy()
        end)
    end)
end

-- เรียก Notification
showPremiumNotification("ลบการทำงานของสคริปต์สำเร็จ", 3)
