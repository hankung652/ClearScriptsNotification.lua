-- LocalScript (ใส่ใน StarterPlayerScripts)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ลบ ScreenGui ทั้งหมด
for _, gui in pairs(playerGui:GetChildren()) do
    if gui:IsA("ScreenGui") then
        gui:Destroy()
    end
end

-- ฟังก์ชัน Notification แบบ iPhone สมจริง
local function showiPhoneNotification(text, duration)
    duration = duration or 3
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.5, 0, 0.08, 0)
    frame.Position = UDim2.new(0.25, 0, -0.1, 0) -- เริ่มนอกหน้าจอด้านบน
    frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    frame.BackgroundTransparency = 0.6
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Parent = screenGui
    frame.ZIndex = 10
    frame.ClipsDescendants = true

    local uicorner = Instance.new("UICorner", frame)
    uicorner.CornerRadius = UDim.new(0, 16)

    local uistroke = Instance.new("UIStroke", frame)
    uistroke.Thickness = 1.5
    uistroke.Color = Color3.fromRGB(0,0,0)
    uistroke.Transparency = 0.6

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -10, 1, -10)
    label.Position = UDim2.new(0, 5, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.TextStrokeTransparency = 0.5

    -- Animation: เด้งลงแบบ iPhone จริง
    local tweenDown1 = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.25, 0, 0.08, 0)})
    local tweenDown2 = TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Position = UDim2.new(0.25, 0, 0.05, 0)})

    tweenDown1:Play()
    tweenDown1.Completed:Connect(function()
        tweenDown2:Play()
    end)

    -- Tween ขึ้นหายไปหลังหมดเวลา
    delay(duration, function()
        local tweenUp = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(0.25, 0, -0.1, 0)})
        tweenUp:Play()
        tweenUp.Completed:Connect(function()
            screenGui:Destroy()
        end)
    end)
end

-- เรียก Notification
showiPhoneNotification("ลบการทำงานของสคริปต์สำเร็จ", 3)
