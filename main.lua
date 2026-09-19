-- ==========================================================
-- FLOW MASTER — ЧАСТЬ 1 ИЗ 8 (SCREEN CARCASS)
-- ==========================================================
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

if CoreGui:FindFirstChild("FlowLoaderGUI") then 
    CoreGui.FlowLoaderGUI:Destroy() 
end

_G.ScreenGui = Instance.new("ScreenGui")
_G.ScreenGui.Name = "FlowLoaderGUI"
_G.ScreenGui.ResetOnSpawn = false
_G.ScreenGui.Parent = CoreGui

_G.MainFrame = Instance.new("Frame", _G.ScreenGui)
_G.MainFrame.Name = "MainFrame"
_G.MainFrame.Size = UDim2.new(0, 550, 0, 420)
_G.MainFrame.Position = UDim2.new(0.5, -275, 0.5, -210)
_G.MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
_G.MainFrame.BorderSizePixel = 0
_G.MainFrame.Active = true
_G.MainFrame.ZIndex = 1
Instance.new("UICorner", _G.MainFrame).CornerRadius = UDim.new(0, 8)

_G.Header = Instance.new("Frame", _G.MainFrame)
_G.Header.Size = UDim2.new(1, 0, 0, 50)
_G.Header.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
_G.Header.ZIndex = 2
Instance.new("UICorner", _G.Header).CornerRadius = UDim.new(0, 8)

local dragging, dragInput, dragStart, startPos
_G.Header.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true dragStart = i.Position startPos = _G.MainFrame.Position
        i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
_G.Header.InputChanged:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then dragInput = i end end)
UserInputService.InputChanged:Connect(function(i) if i == dragInput and dragging then
    local d = i.Position - dragStart
    TweenService:Create(_G.MainFrame, TweenInfo.new(0.1), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)}):Play()
end end)
print("[FLOW]: Часть 1 успешно инжектирована.")
-- ==========================================================
-- FLOW MASTER — ЧАСТЬ 2 ИЗ 8 (HEADER & CONTAINERS)
-- ==========================================================
if not _G.MainFrame or not _G.Header then return end

_G.CloseBtn = Instance.new("TextButton", _G.Header)
_G.CloseBtn.Size = UDim2.new(0, 32, 0, 32)
_G.CloseBtn.Position = UDim2.new(1, -45, 0, 9)
_G.CloseBtn.Text = "×"
_G.CloseBtn.TextColor3 = Color3.fromRGB(160, 160, 165)
_G.CloseBtn.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
_G.CloseBtn.Font = Enum.Font.GothamBold
_G.CloseBtn.TextSize = 20
_G.CloseBtn.ZIndex = 3
Instance.new("UICorner", _G.CloseBtn).CornerRadius = UDim.new(0, 5)
_G.CloseBtn.MouseButton1Click:Connect(function() _G.ScreenGui:Destroy() end)

local HubTitle = Instance.new("TextLabel", _G.Header)
HubTitle.Size = UDim2.new(0, 200, 0, 20)
HubTitle.Position = UDim2.new(0, 20, 0, 15)
HubTitle.Text = "<font color='rgb(140,90,255)'>FLOW Hub</font> • Key System"
HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextSize = 14
HubTitle.RichText = true
HubTitle.TextXAlignment = Enum.TextXAlignment.Left
HubTitle.BackgroundTransparency = 1
HubTitle.ZIndex = 3

_G.Menu1 = Instance.new("Frame", _G.MainFrame)
_G.Menu1.Size = UDim2.new(1, 0, 1, -50)
_G.Menu1.Position = UDim2.new(0, 0, 0, 50)
_G.Menu1.BackgroundTransparency = 1
_G.Menu1.ZIndex = 2

_G.Menu2 = Instance.new("Frame", _G.MainFrame)
_G.Menu2.Size = UDim2.new(1, 0, 1, -50)
_G.Menu2.Position = UDim2.new(0, 0, 0, 50)
_G.Menu2.BackgroundTransparency = 1
_G.Menu2.Visible = false
_G.Menu2.ZIndex = 2
print("[FLOW]: Часть 2 успешно инжектирована.")
-- ==========================================================
-- FLOW MASTER — ЧАСТЬ 3 ИЗ 8 (KEY TEXTBOX & PREMIUM)
-- ==========================================================
if not _G.Menu1 then return end

_G.KeySection = Instance.new("Frame", _G.Menu1)
_G.KeySection.Size = UDim2.new(1, -30, 0, 320)
_G.KeySection.Position = UDim2.new(0, 15, 0, 15)
_G.KeySection.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
_G.KeySection.ZIndex = 2
Instance.new("UICorner", _G.KeySection).CornerRadius = UDim.new(0, 6)

_G.KeyInput = Instance.new("TextBox", _G.KeySection)
_G.KeyInput.Size = UDim2.new(1, -30, 0, 42)
_G.KeyInput.Position = UDim2.new(0, 15, 0, 75)
_G.KeyInput.BackgroundColor3 = Color3.fromRGB(14, 14, 16)
_G.KeyInput.Text = ""
_G.KeyInput.PlaceholderText = "Enter your key here..."
_G.KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
_G.KeyInput.Font = Enum.Font.Gotham
_G.KeyInput.TextSize = 13
_G.KeyInput.ZIndex = 3
Instance.new("UICorner", _G.KeyInput).CornerRadius = UDim.new(0, 5)

local PremiumFrame = Instance.new("Frame", _G.KeySection)
PremiumFrame.Size = UDim2.new(1, -30, 0, 110)
PremiumFrame.Position = UDim2.new(0, 15, 0, 200)
PremiumFrame.BackgroundColor3 = Color3.fromRGB(14, 14, 16)
PremiumFrame.ZIndex = 3
Instance.new("UICorner", PremiumFrame).CornerRadius = UDim.new(0, 6)
local PremStroke = Instance.new("UIStroke", PremiumFrame)
PremStroke.Color = Color3.fromRGB(45, 30, 80)

local BuyBtn = Instance.new("TextButton", PremiumFrame)
BuyBtn.Size = UDim2.new(1, -30, 0, 32)
BuyBtn.Position = UDim2.new(0, 15, 1, -40)
BuyBtn.BackgroundColor3 = Color3.fromRGB(18, 14, 25)
BuyBtn.Text = "Buy Permanent Key"
BuyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
BuyBtn.Font = Enum.Font.GothamBold
BuyBtn.TextSize = 11
BuyBtn.ZIndex = 4
Instance.new("UICorner", BuyBtn).CornerRadius = UDim.new(0, 5)
Instance.new("UIStroke", BuyBtn).Color = Color3.fromRGB(115, 60, 255)
BuyBtn.MouseButton1Click:Connect(function() if setclipboard then setclipboard("the_silent52") end end)
print("[FLOW]: Часть 3 успешно инжектирована.")
-- ==========================================================
-- FLOW MASTER — ЧАСТЬ 4 ИЗ 8 (BUTTONS & SIDEBAR)
-- ==========================================================
if not _G.KeySection or not _G.Menu2 then return end

_G.RealLoadBtn = Instance.new("TextButton")
_G.RealLoadBtn.Name = "RealLoadBtn"
_G.RealLoadBtn.Size = UDim2.new(0, 240, 0, 38)
_G.RealLoadBtn.Position = UDim2.new(0, 15, 0, 130)
_G.RealLoadBtn.BackgroundColor3 = Color3.fromRGB(115, 60, 255)
_G.RealLoadBtn.Text = "Check Key"
_G.RealLoadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
_G.RealLoadBtn.Font = Enum.Font.GothamBold
_G.RealLoadBtn.TextSize = 13
_G.RealLoadBtn.ZIndex = 4
_G.RealLoadBtn.Parent = _G.KeySection

local LoadBtnCorner = Instance.new("UICorner")
LoadBtnCorner.CornerRadius = UDim.new(0, 5)
LoadBtnCorner.Parent = _G.RealLoadBtn

_G.RealGetKeyBtn = Instance.new("TextButton")
_G.RealGetKeyBtn.Name = "RealGetKeyBtn"
_G.RealGetKeyBtn.Size = UDim2.new(0, 240, 0, 38)
_G.RealGetKeyBtn.Position = UDim2.new(1, -255, 0, 130)
_G.RealGetKeyBtn.BackgroundColor3 = Color3.fromRGB(14, 14, 16)
_G.RealGetKeyBtn.Text = "Get Key"
_G.RealGetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
_G.RealGetKeyBtn.Font = Enum.Font.GothamBold
_G.RealGetKeyBtn.TextSize = 13
_G.RealGetKeyBtn.ZIndex = 4
_G.RealGetKeyBtn.Parent = _G.KeySection

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 5)
GetKeyCorner.Parent = _G.RealGetKeyBtn

local GetKeyStroke = Instance.new("UIStroke")
GetKeyStroke.Color = Color3.fromRGB(45, 45, 50)
GetKeyStroke.Parent = _G.RealGetKeyBtn

_G.Sidebar = Instance.new("Frame")
_G.Sidebar.Name = "Sidebar"
_G.Sidebar.Size = UDim2.new(0, 145, 1, 0)
_G.Sidebar.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
_G.Sidebar.BorderSizePixel = 0
_G.Sidebar.ZIndex = 3
_G.Sidebar.Parent = _G.Menu2

_G.ContentFrame = Instance.new("Frame")
_G.ContentFrame.Name = "ContentFrame"
_G.ContentFrame.Size = UDim2.new(1, -145, 1, 0)
_G.ContentFrame.Position = UDim2.new(0, 145, 0, 0)
_G.ContentFrame.BackgroundTransparency = 1 -- Защита от серого бага слоев!
_G.ContentFrame.ZIndex = 3
_G.ContentFrame.Parent = _G.Menu2

_G.RealGetKeyBtn.MouseButton1Click:Connect(function() 
    if setclipboard then 
        setclipboard("the_silent52") 
        _G.showNotification("Юзернейм скопирован!")
    end 
end)

print("[FLOW]: Часть 4 успешно инжектирована.")
-- ==========================================================
-- FLOW MASTER — ЧАСТЬ 5 ИЗ 8 (PAGES & NEON TABS)
-- ==========================================================
if not _G.ContentFrame or not _G.Sidebar then return end
local TweenService = game:GetService("TweenService")

_G.CheatsState = { 
    AutoEggs = false, 
    AntiMonsterInv = false, 
    MonsterFreeze = false, 
    ServerHopper = false 
}

_G.EspState = { 
    Eggs = false, 
    Distance = false, 
    Players = false, 
    Nicknames = false, 
    Bases = false 
}

_G.createTabPage = function()
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Visible = false
    frame.ZIndex = 4
    frame.Parent = _G.ContentFrame
    return frame
end

_G.createScrollContainer = function(parent)
    local sc = Instance.new("ScrollingFrame")
    sc.Size = UDim2.new(1, 0, 1, -20)
    sc.Position = UDim2.new(0, 0, 0, 20)
    sc.BackgroundTransparency = 1
    sc.BorderSizePixel = 0
    sc.ScrollBarThickness = 3
    sc.ScrollBarImageColor3 = Color3.fromRGB(115, 60, 255)
    sc.CanvasSize = UDim2.new(0, 0, 0, 450)
    sc.ZIndex = 5
    sc.Parent = parent
    return sc
end

_G.PageFarm = _G.createTabPage() 
_G.PageEspEggs = _G.createTabPage() 
_G.PageEspPlayers = _G.createTabPage() 
_G.PageEspBases = _G.createTabPage() 
_G.PageAccount = _G.createTabPage() 
_G.PageSupport = _G.createTabPage()

_G.ScrollFarm = _G.createScrollContainer(_G.PageFarm) 
_G.ScrollEggs = _G.createScrollContainer(_G.PageEspEggs) 
_G.ScrollPlayers = _G.createScrollContainer(_G.PageEspPlayers) 
_G.ScrollBases = _G.createScrollContainer(_G.PageEspBases) 
_G.ScrollAccount = _G.createScrollContainer(_G.PageAccount) 
_G.ScrollSupport = _G.createScrollContainer(_G.PageSupport)

_G.PageFarm.Visible = true 
local activePage = _G.PageFarm

local function switchPage(targetPage) 
    if activePage == targetPage then return end 
    activePage.Visible = false 
    targetPage.Visible = true 
    activePage = targetPage 
end

local tabButtons = {}

_G.createTabButton = function(name, yPos, targetPage)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 26) 
    btn.Position = UDim2.new(0, 10, 0, yPos) 
    btn.BackgroundColor3 = Color3.fromRGB(26, 26, 33)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(150, 120, 220) 
    btn.Font = Enum.Font.GothamBold 
    btn.TextSize = 10 
    btn.ZIndex = 5 
    btn.Parent = _G.Sidebar
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 5)
    TabCorner.Parent = btn
    
    table.insert(tabButtons, {Button = btn, Page = targetPage})
    
    btn.MouseButton1Click:Connect(function() 
        switchPage(targetPage)
        for _, tab in pairs(tabButtons) do 
            local backColor = (tab.Page == targetPage) and Color3.fromRGB(115, 60, 255) or Color3.fromRGB(26, 26, 33)
            local txtColor = (tab.Page == targetPage) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 120, 220)
            TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = backColor, TextColor3 = txtColor}):Play() 
        end 
    end)
end

_G.createTabButton("Авто яйца", 20, _G.PageFarm) 
_G.createTabButton("Яйца", 60, _G.PageEspEggs) 
_G.createTabButton("Игроки", 100, _G.PageEspPlayers) 
_G.createTabButton("Базы", 140, _G.PageEspBases) 
_G.createTabButton("Аккаунт", 180, _G.PageAccount) 
_G.createTabButton("Поддержка", 220, _G.PageSupport)

print("[FLOW]: Часть 5 успешно инжектирована.")
-- ==========================================================
-- ЧАСТЬ 6: КОНСТРУКТОР ТУМБЛЕРОВ И ВЫСОКИЙ СТАТУС БАР
-- ==========================================================
if not _G.Menu1 or not _G.ScrollFarm then return end

local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.new(1, -30, 0, 30)
StatusFrame.Position = UDim2.new(0, 15, 1, -45) -- [ИСПРАВЛЕНО]: Поднимаем над краем экрана
StatusFrame.BackgroundTransparency = 1
StatusFrame.ZIndex = 3
StatusFrame.Parent = _G.Menu1

_G.StatusDot = Instance.new("Frame")
_G.StatusDot.Size = UDim2.new(0, 6, 0, 6) 
_G.StatusDot.Position = UDim2.new(0, 5, 0.5, -3) 
_G.StatusDot.BackgroundColor3 = Color3.fromRGB(115, 60, 255) 
_G.StatusDot.ZIndex = 4 
_G.StatusDot.Parent = StatusFrame
Instance.new("UICorner", _G.StatusDot).CornerRadius = UDim.new(1, 0)

_G.StatusText = Instance.new("TextLabel")
_G.StatusText.Size = UDim2.new(1, 0, 1, 0) 
_G.StatusText.Position = UDim2.new(0, 18, 0, 0) 
_G.StatusText.Text = "Waiting for key..." 
_G.StatusText.TextColor3 = Color3.fromRGB(110, 110, 115) 
_G.StatusText.Font = Enum.Font.GothamMedium 
_G.StatusText.TextSize = 11 
_G.StatusText.TextXAlignment = Enum.TextXAlignment.Left 
_G.StatusText.BackgroundTransparency = 1
_G.StatusText.Parent = StatusFrame

_G.createFunctionalBlock = function(name, description, yPos, parent, callback)
    local frame = Instance.new("Frame") 
    frame.Size = UDim2.new(1, -40, 0, 54) 
    frame.Position = UDim2.new(0, 20, 0, yPos) 
    frame.BackgroundColor3 = Color3.fromRGB(24, 24, 30) 
    frame.ZIndex = 5 
    frame.Parent = parent
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    
    local label = Instance.new("TextLabel") 
    label.Size = UDim2.new(1, -120, 0, 22) 
    label.Position = UDim2.new(0, 15, 0, 6) 
    label.Text = name
    label.TextColor3 = Color3.fromRGB(235, 235, 240) 
    label.Font = Enum.Font.GothamBold 
    label.TextSize = 13 
    label.TextXAlignment = Enum.TextXAlignment.Left 
    label.BackgroundTransparency = 1 
    label.ZIndex = 6
    label.Parent = frame
    
    local desc = Instance.new("TextLabel") 
    desc.Size = UDim2.new(1, -120, 0, 22) 
    desc.Position = UDim2.new(0, 15, 0, 26) 
    desc.Text = description
    desc.TextColor3 = Color3.fromRGB(130, 130, 135) 
    desc.Font = Enum.Font.GothamMedium 
    desc.TextSize = 10 
    desc.TextXAlignment = Enum.TextXAlignment.Left 
    desc.BackgroundTransparency = 1 
    desc.ZIndex = 6
    desc.Parent = frame
    
    local btn = Instance.new("TextButton") 
    btn.Size = UDim2.new(0, 40, 0, 22) 
    btn.Position = UDim2.new(1, -55, 0.5, -11) 
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 50) 
    btn.Text = "" 
    btn.ZIndex = 6 
    btn.Parent = frame
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
    
    local circle = Instance.new("Frame") 
    circle.Size = UDim2.new(0, 16, 0, 16) 
    circle.Position = UDim2.new(0, 3, 0.5, -8) 
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
    circle.ZIndex = 7 
    circle.Parent = btn
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)
    
    local enabled = false 
    btn.MouseButton1Click:Connect(function() 
        enabled = not enabled 
        local btnColor = enabled and Color3.fromRGB(115, 60, 255) or Color3.fromRGB(40, 40, 50)
        local circlePos = enabled and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = btnColor}):Play() 
        game:GetService("TweenService"):Create(circle, TweenInfo.new(0.2), {Position = circlePos}):Play() 
        if callback then callback(enabled) end 
    end)
end

_G.createFunctionalBlock("Авто яйца", "Автоматический сбор редких яиц (Eternal/Secret) на 1 локе", 10, _G.ScrollFarm, function(s) _G.CheatsState.AutoEggs = s end)
_G.createFunctionalBlock("Monster Invisible", "Монстры вас полностью игнорируют", 70, _G.ScrollFarm, function(s) _G.CheatsState.AntiMonsterInv = s end)
_G.createFunctionalBlock("Monster Freeze", "Жесткая блокировка и перенос монстров под карту", 130, _G.ScrollFarm, function(s) _G.CheatsState.MonsterFreeze = s end)

print("[FLOW]: Часть 6 успешно инжектирована.")
-- ==========================================================
-- ЧАСТЬ 7: ТУМБЛЕРЫ НАСТРОЕК И ОПТИМИЗИРОВАННЫЙ ЕСП ДВИЖОК
-- ==========================================================
if not _G.ScrollEggs or not _G.ScrollPlayers then return end
local CoreGui = game:GetService("CoreGui") 
local Players = game.Players 
local LocalPlayer = Players.LocalPlayer

_G.createFunctionalBlock("ESP Eggs", "Фиолетовая обводка редких яиц сквозь стены", 10, _G.ScrollEggs, function(s) _G.EspState.Eggs = s end)
_G.createFunctionalBlock("Show Distance", "Отображает точное расстояние в метрах до яиц", 70, _G.ScrollEggs, function(s) _G.EspState.Distance = s end)
_G.createFunctionalBlock("Player ESP", "Включает неоновую обводку игроков сквозь стены", 10, _G.ScrollPlayers, function(s) _G.EspState.Players = s end)
_G.createFunctionalBlock("Show Nicknames", "Выводит реальный никнейм и ХП над головой", 70, _G.ScrollPlayers, function(s) _G.EspState.Nicknames = s end)
_G.createFunctionalBlock("Base ESP", "Включает оранжевую подсветку зон разгрузки", 10, _G.ScrollBases, function(s) _G.EspState.Bases = s end)
_G.createFunctionalBlock("Server Hopper", "Авто-поиск и прыжок на пустой сервер к 1 человеку", 10, _G.ScrollSupport, function(s) _G.CheatsState.ServerHopper = s end)

local EspFolder = CoreGui:FindFirstChild("FlowEspFolder") or Instance.new("Folder", CoreGui) 
EspFolder.Name = "FlowEspFolder"

game:GetService("RunService").Heartbeat:Connect(function() 
    EspFolder:ClearAllChildren()
    if _G.EspState.Eggs then
        for _, o in pairs(workspace:GetDescendants()) do 
            if o:IsA("Model") and (string.find(string.lower(o.Name), "egg") or o:FindFirstChild("Egg")) then
                if string.find(string.lower(o.Name), "eternal") or string.find(string.lower(o.Name), "secret") or string.find(string.lower(o.Name), "divine") then
                    local hl = Instance.new("Highlight", EspFolder) 
                    hl.Adornee = o 
                    hl.FillColor = Color3.fromRGB(140, 90, 255) 
                    hl.FillTransparency = 0.4
                    
                    if _G.EspState.Distance and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local p = o:FindFirstChildOfClass("Part") or o:FindFirstChildOfClass("MeshPart")
                        if p then 
                            local dist = math.floor((p.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
                            local bg = Instance.new("BillboardGui", EspFolder) 
                            bg.Adornee = p 
                            bg.Size = UDim2.new(0,100,0,30) 
                            bg.AlwaysOnTop = true
                            
                            local lbl = Instance.new("TextLabel", bg) 
                            lbl.Size = UDim2.new(1,0,1,0) 
                            lbl.Text = dist.."м" 
                            lbl.TextColor3 = Color3.fromRGB(255,255,255) 
                            lbl.Font = Enum.Font.GothamBold 
                            lbl.TextSize = 11 
                            lbl.BackgroundTransparency = 1
                        end 
                    end
                end 
            end 
        end
    end
    if _G.EspState.Players then
        for _, p in pairs(game.Players:GetPlayers()) do 
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local hl = Instance.new("Highlight", EspFolder) 
                hl.Adornee = p.Character 
                hl.FillColor = Color3.fromRGB(0, 255, 120) 
                hl.FillTransparency = 0.5
                
                if _G.EspState.Nicknames and p.Character:FindFirstChild("Head") then
                    local bg = Instance.new("BillboardGui", EspFolder) 
                    bg.Adornee = p.Character.Head 
                    bg.Size = UDim2.new(0,120,0,35) 
                    bg.StudsOffset = Vector3.new(0,2.5,0) 
                    bg.AlwaysOnTop = true
                    
                    local lbl = Instance.new("TextLabel", bg) 
                    lbl.Size = UDim2.new(1,0,1,0) 
                    lbl.Text = p.Name .. " [" .. math.floor(p.Character:FindFirstChildOfClass("Humanoid").Health) .. "HP]" 
                    lbl.TextColor3 = Color3.fromRGB(255,255,255) 
                    lbl.Font = Enum.Font.GothamBold 
                    lbl.TextSize = 10 
                    lbl.BackgroundTransparency = 1
                end 
            end 
        end
    end
    if _G.EspState.Bases then 
        local b = workspace:FindFirstChild("Bases") or workspace:FindFirstChild("Teams") 
        if b then 
            local hl = Instance.new("Highlight", EspFolder) 
            hl.Adornee = b 
            hl.FillColor = Color3.fromRGB(255, 185, 0) 
            hl.FillTransparency = 0.6 
        end 
    end
end)

print("[FLOW]: Часть 7 успешно инжектирована.")
-- ==========================================================
-- ЧАСТЬ 8: ЛОГИКА ФАРМА, RO-PROXY SERVER HOPPER И КЛИК
-- ==========================================================
if not _G.MainFrame or not _G.RealLoadBtn or not _G.KeyInput then return end
local TweenService = game:GetService("TweenService") 
local RunService = game:GetService("RunService") 
local HttpService = game:GetService("HttpService") 
local TeleportService = game:GetService("TeleportService") 
local LocalPlayer = game.Players.LocalPlayer

local EggDatabase = { 
    ["eternal"] = 6, 
    ["secret"] = 5, 
    ["divine"] = 5, 
    ["void"] = 4, 
    ["shadow"] = 4 
}

local function getBestEggFromDatabase()
    local r = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") 
    if not r then return nil end
    local best = nil
    local highP = -1
    local shortD = math.huge
    for _, o in pairs(workspace:GetDescendants()) do 
        if o:IsA("Model") and (string.find(string.lower(o.Name), "egg") or o:FindFirstChild("Egg")) then
            local p = o:FindFirstChildOfClass("Part") or o:FindFirstChildOfClass("MeshPart") 
            if p and p:IsA("BasePart") then
                local cP = 1
                for k, v in pairs(EggDatabase) do 
                    if string.find(string.lower(o.Name), k) then 
                        cP = v 
                        break 
                    end 
                end
                if cP > highP then 
                    highP = cP
                    shortD = (p.Position - r.Position).Magnitude
                    best = p
                elseif cP == highP then 
                    local d = (p.Position - r.Position).Magnitude 
                    if d < shortD then 
                        shortD = d
                        best = p 
                    end 
                end
            end 
        end 
    end 
    return best
end

task.spawn(function()
    while task.wait(0.1) do 
        if _G.CheatsState.AutoEggs and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local r = LocalPlayer.Character.HumanoidRootPart 
            local h = LocalPlayer.Character:FindFirstChild("Humanoid")
            if h then 
                h.WalkSpeed = 150 
                local t = getBestEggFromDatabase() 
                if t then 
                    r.CanCollide = false
                    h:MoveTo(t.Position)
                    if (t.Position - r.Position).Magnitude < 10 then 
                        if firetouchinterest then 
                            firetouchinterest(r, t, 0) 
                            task.wait(0.02) 
                            firetouchinterest(r, t, 1) 
                        end
                        local sz = workspace:FindFirstChild("SaveZone") or workspace:FindFirstChild("SafeZone") 
                        local sp = sz and sz:FindFirstChildOfClass("BasePart") 
                        if sp then 
                            h:MoveTo(sp.Position) 
                            task.wait(0.1) 
                        end
                        local b = workspace:FindFirstChild("Bases") or workspace:FindFirstChild("Teams") 
                        local mb = b and (b:FindFirstChild(LocalPlayer.TeamColor.Name) or b:FindFirstChild(LocalPlayer.Name)) 
                        local dp = mb and mb:FindFirstChildOfClass("BasePart")
                        if dp and firetouchinterest then 
                            firetouchinterest(r, dp, 0) 
                            task.wait(0.02) 
                            firetouchinterest(r, dp, 1) 
                        end
                    end 
                end 
            end
        else 
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
                LocalPlayer.Character.Humanoid.WalkSpeed = 16 
            end 
        end 
    end
end)

task.spawn(function()
    while task.wait(0.5) do 
        if _G.CheatsState.ServerHopper then
            local proxy = "https://roproxy.com" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            local s, res = pcall(function() return game:HttpGet(proxy) end) 
            if s and res then
                local d = HttpService:JSONDecode(res) 
                if d and d.data then 
                    for _, sv in pairs(d.data) do 
                        if sv.playing and sv.playing == 1 and sv.id ~= game.JobId then 
                            TeleportService:TeleportToPlaceInstance(game.PlaceId, sv.id, LocalPlayer) 
                            break 
                        end 
                    end 
                end
            end 
            _G.CheatsState.ServerHopper = false
        end 
    end
end)

RunService.Stepped:Connect(function()
    if _G.CheatsState.AntiMonsterInv then 
        for _, m in pairs(workspace:GetDescendants()) do 
            if m:IsA("Model") and (string.find(string.lower(m.Name), "monster") or string.find(string.lower(m.Name), "bot")) then 
                for _, pt in pairs(m:GetChildren()) do 
                    if pt:IsA("BasePart") then pt.CanTouch = false end 
                end 
                local tg = m:FindFirstChild("Target") or m:FindFirstChild("Player") 
                if tg then tg.Value = nil end 
            end 
        end 
    end
    if _G.CheatsState.MonsterFreeze then 
        for _, m in pairs(workspace:GetDescendants()) do 
            if m:IsA("Model") and (string.find(string.lower(m.Name), "monster") or string.find(string.lower(m.Name), "bot")) then 
                local rt = m:FindFirstChild("HumanoidRootPart") or m:FindFirstChildOfClass("Part") 
                if rt and rt:IsA("BasePart") then 
                    rt.Anchored = true 
                    rt.CFrame = CFrame.new(rt.Position.X, -120, rt.Position.Z) 
                end 
            end 
        end 
    end
end)

_G.RealLoadBtn.MouseButton1Click:Connect(function()
    if _G.KeyInput.Text == "Flow" then 
        _G.RealLoadBtn.Text = "SUCCESS" 
        _G.RealLoadBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113) 
        _G.StatusText.Text = "Key authorized!" 
        _G.StatusDot.BackgroundColor3 = Color3.fromRGB(46, 204, 113) 
        _G.showNotification("Запуск FLOW Hub...") 
        task.wait(0.5)
        _G.MainFrame.ClipsDescendants = true 
        local hide = TweenService:Create(_G.MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 550, 0, 50)}) 
        hide:Play()
        hide.Completed:Connect(function() 
            _G.Menu1.Visible = false 
            _G.Menu2.Visible = true 
            _G.Menu2.Size = UDim2.new(1, 0, 1, 0) 
            TweenService:Create(_G.MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = _G.originalSize}):Play() 
        end)
    else 
        _G.RealLoadBtn.Text = "WRONG KEY" 
        _G.RealLoadBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60) 
        _G.StatusText.Text = "Invalid key." 
        task.wait(1.5) 
        _G.RealLoadBtn.Text = "Check Key" 
        _G.RealLoadBtn.BackgroundColor3 = Color3.fromRGB(115, 60, 255) 
        _G.StatusText.Text = "Waiting for key..." 
    end
end)

_G.MainFrame.Size = UDim2.new(0, 550, 0, 0) 
_G.MainFrame.ClipsDescendants = true 
TweenService:Create(_G.MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back), {Size = _G.originalSize}):Play()

print("[FLOW Master]: Скрипт полностью скомпилирован во все части!");
