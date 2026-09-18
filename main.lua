-- =========================================================================
-- ЧАСТЬ 1: ПОДКЛЮЧЕНИЕ СЕРВИСОВ И БАЗОВАЯ НАСТРОЙКА GUI
-- =========================================================================
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local Hub = {}
Hub.Pages = {}
Hub.TabButtons = {}
Hub.Toggles = {}

Hub.ScreenGui = Instance.new("ScreenGui")
Hub.ScreenGui.Name = "LuminoHubKeySystem"
Hub.ScreenGui.ResetOnSpawn = false
pcall(function()
    Hub.ScreenGui.Parent = (syn and syn.protect_gui and syn.protect_gui(Hub.ScreenGui)) or CoreGui or PlayerGui
end)

Hub.MainFrame = Instance.new("Frame")
Hub.MainFrame.Name = "MainFrame"
Hub.MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 27)
Hub.MainFrame.BorderSizePixel = 0
Hub.MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
Hub.MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
Hub.MainFrame.ClipsDescendants = true
Hub.MainFrame.Visible = true
Hub.MainFrame.Parent = Hub.ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Hub.MainFrame
-- =========================================================================
-- ЧАСТЬ 2: СОЗДАНИЕ ВЕРХНЕЙ ПЛАШКИ WATERMARK
-- =========================================================================
Hub.Watermark = Instance.new("Frame")
Hub.Watermark.Name = "Watermark"
Hub.Watermark.Size = UDim2.new(0, 480, 0, 32)
Hub.Watermark.Position = UDim2.new(0.5, 0, 0, 15)
Hub.Watermark.AnchorPoint = Vector2.new(0.5, 0)
Hub.Watermark.BackgroundColor3 = Color3.fromRGB(34, 23, 61)
Hub.Watermark.BorderSizePixel = 0
Hub.Watermark.Visible = false
Hub.Watermark.Parent = Hub.ScreenGui

local WMCorner = Instance.new("UICorner")
WMCorner.CornerRadius = UDim.new(1, 0)
WMCorner.Parent = Hub.Watermark

local WMList = Instance.new("UIListLayout")
WMList.FillDirection = Enum.FillDirection.Horizontal
WMList.HorizontalAlignment = Enum.HorizontalAlignment.Center
WMList.VerticalAlignment = Enum.VerticalAlignment.Center
WMList.Padding = UDim.new(0, 8)
WMList.Parent = Hub.Watermark

local WMLogo = Instance.new("TextLabel")
WMLogo.Text = " ⚡"
WMLogo.Font = Enum.Font.GothamBold
WMLogo.TextSize = 14
WMLogo.TextColor3 = Color3.fromRGB(245, 158, 11)
WMLogo.BackgroundTransparency = 1
WMLogo.Size = UDim2.new(0, 20, 1, 0)
WMLogo.Parent = Hub.Watermark

local WMTitle = Instance.new("TextLabel")
WMTitle.Text = "Lumino Hub"
WMTitle.Font = Enum.Font.GothamBold
WMTitle.TextSize = 13
WMTitle.TextColor3 = Color3.fromRGB(168, 85, 247)
WMTitle.BackgroundTransparency = 1
WMTitle.Size = UDim2.new(0, 75, 1, 0)
WMTitle.Parent = Hub.Watermark

local WMVersion = Instance.new("TextLabel")
WMVersion.Text = "v1.0"
WMVersion.Font = Enum.Font.GothamMedium
WMVersion.TextSize = 12
WMVersion.TextColor3 = Color3.fromRGB(161, 161, 170)
WMVersion.BackgroundTransparency = 1
WMVersion.Size = UDim2.new(0, 30, 1, 0)
WMVersion.Parent = Hub.Watermark

local Dot1 = Instance.new("TextLabel")
Dot1.Text = "•"
Dot1.Font = Enum.Font.GothamBold
Dot1.TextSize = 12
Dot1.TextColor3 = Color3.fromRGB(82, 82, 91)
Dot1.BackgroundTransparency = 1
Dot1.Size = UDim2.new(0, 5, 1, 0)
Dot1.Parent = Hub.Watermark

local WMTelegram = Instance.new("TextLabel")
WMTelegram.Text = "telegram:the_silent52"
WMTelegram.Font = Enum.Font.GothamSemibold
WMTelegram.TextSize = 12
WMTelegram.TextColor3 = Color3.fromRGB(192, 132, 252)
WMTelegram.BackgroundTransparency = 1
WMTelegram.Size = UDim2.new(0, 130, 1, 0)
WMTelegram.Parent = Hub.Watermark

local Dot2 = Instance.new("TextLabel")
Dot2.Text = "•"
Dot2.Font = Enum.Font.GothamBold
Dot2.TextSize = 12
Dot2.TextColor3 = Color3.fromRGB(82, 82, 91)
Dot2.BackgroundTransparency = 1
Dot2.Size = UDim2.new(0, 5, 1, 0)
Dot2.Parent = Hub.Watermark

Hub.WMFps = Instance.new("TextLabel")
Hub.WMFps.Text = "0 fps"
Hub.WMFps.Font = Enum.Font.GothamBold
Hub.WMFps.TextSize = 12
Hub.WMFps.TextColor3 = Color3.fromRGB(34, 211, 238)
Hub.WMFps.BackgroundTransparency = 1
Hub.WMFps.Size = UDim2.new(0, 45, 1, 0)
Hub.WMFps.Parent = Hub.Watermark

local Dot3 = Instance.new("TextLabel")
Dot3.Text = "•"
Dot3.Font = Enum.Font.GothamBold
Dot3.TextSize = 12
Dot3.TextColor3 = Color3.fromRGB(82, 82, 91)
Dot3.BackgroundTransparency = 1
Dot3.Size = UDim2.new(0, 5, 1, 0)
Dot3.Parent = Hub.Watermark

Hub.WMPing = Instance.new("TextLabel")
Hub.WMPing.Text = "0 ms "
Hub.WMPing.Font = Enum.Font.GothamBold
Hub.WMPing.TextSize = 12
Hub.WMPing.TextColor3 = Color3.fromRGB(161, 161, 170)
Hub.WMPing.BackgroundTransparency = 1
Hub.WMPing.Size = UDim2.new(0, 50, 1, 0)
Hub.WMPing.Parent = Hub.Watermark
-- =========================================================================
-- ЧАСТЬ 3: ТЕКСТЫ, КНОПКИ И ПОЛЯ ОКНА АВТОРЗАЦИИ КЛЮЧА
-- =========================================================================
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Text = "Lumino Hub"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 45, 0, 15)
Title.Size = UDim2.new(0.6, 0, 0, 30)
Title.Parent = Hub.MainFrame

local Icon = Instance.new("TextLabel")
Icon.Name = "Icon"
Icon.Text = "⚡"
Icon.Font = Enum.Font.GothamBold
Icon.TextSize = 18
Icon.TextColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1
Icon.Position = UDim2.new(0, 15, 0, 15)
Icon.Size = UDim2.new(0, 22, 0, 30)
Icon.Parent = Hub.MainFrame

Hub.CloseButton = Instance.new("TextButton")
Hub.CloseButton.Name = "CloseButton"
Hub.CloseButton.Text = "✕"
Hub.CloseButton.Font = Enum.Font.GothamBold
Hub.CloseButton.TextSize = 16
Hub.CloseButton.TextColor3 = Color3.fromRGB(150, 150, 150)
Hub.CloseButton.BackgroundTransparency = 1
Hub.CloseButton.BorderSizePixel = 0
Hub.CloseButton.Position = UDim2.new(1, -35, 0, 15)
Hub.CloseButton.Size = UDim2.new(0, 20, 0, 30)
Hub.CloseButton.Parent = Hub.MainFrame

local InfoText = Instance.new("TextLabel")
InfoText.Name = "InfoText"
InfoText.Text = "Having trouble getting a key or checking your key?\nJoin my Telegram server for assistance"
InfoText.Font = Enum.Font.Gotham
InfoText.TextSize = 12
InfoText.TextColor3 = Color3.fromRGB(161, 161, 170)
InfoText.TextWrapped = true
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.TextYAlignment = Enum.TextYAlignment.Top
InfoText.BackgroundTransparency = 1
InfoText.Position = UDim2.new(0, 15, 0, 55)
InfoText.Size = UDim2.new(1, -30, 0, 35)
InfoText.Parent = Hub.MainFrame

Hub.KeyInput = Instance.new("TextBox")
Hub.KeyInput.Name = "KeyInput"
Hub.KeyInput.PlaceholderText = "Enter your key here..."
Hub.KeyInput.Text = ""
Hub.KeyInput.Font = Enum.Font.Gotham
Hub.KeyInput.TextSize = 14
Hub.KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
Hub.KeyInput.PlaceholderColor3 = Color3.fromRGB(82, 82, 91)
Hub.KeyInput.BackgroundColor3 = Color3.fromRGB(34, 34, 38)
Hub.KeyInput.BorderSizePixel = 0
Hub.KeyInput.Position = UDim2.new(0, 15, 0, 100)
Hub.KeyInput.Size = UDim2.new(1, -30, 0, 45)
Hub.KeyInput.Parent = Hub.MainFrame

local KeyInputCorner = Instance.new("UICorner")
KeyInputCorner.CornerRadius = UDim.new(0, 8)
KeyInputCorner.Parent = Hub.KeyInput

Hub.CheckBtn = Instance.new("TextButton")
Hub.CheckBtn.Name = "CheckBtn"
Hub.CheckBtn.Text = "Check Key"
Hub.CheckBtn.Font = Enum.Font.GothamBold
Hub.CheckBtn.TextSize = 14
Hub.CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Hub.CheckBtn.BackgroundColor3 = Color3.fromRGB(54, 32, 94)
Hub.CheckBtn.BorderSizePixel = 0
Hub.CheckBtn.Position = UDim2.new(0, 15, 0, 155)
Hub.CheckBtn.Size = UDim2.new(1, -30, 0, 45)
Hub.CheckBtn.Parent = Hub.MainFrame
local CheckCorner = Instance.new("UICorner")
CheckCorner.CornerRadius = UDim.new(0, 8)
CheckCorner.Parent = Hub.CheckBtn

Hub.SupportBtn = Instance.new("TextButton")
Hub.SupportBtn.Name = "SupportBtn"
Hub.SupportBtn.Text = "Support"
Hub.SupportBtn.Font = Enum.Font.GothamBold
Hub.SupportBtn.TextSize = 14
Hub.SupportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Hub.SupportBtn.BackgroundColor3 = Color3.fromRGB(44, 44, 50)
Hub.SupportBtn.BorderSizePixel = 0
Hub.SupportBtn.Position = UDim2.new(0, 15, 0, 210)
Hub.SupportBtn.Size = UDim2.new(0.5, -20, 0, 45)
Hub.SupportBtn.Parent = Hub.MainFrame
local SupportCorner = Instance.new("UICorner")
SupportCorner.CornerRadius = UDim.new(0, 8)
SupportCorner.Parent = Hub.SupportBtn

Hub.GetKeyBtn = Instance.new("TextButton")
Hub.GetKeyBtn.Name = "GetKeyBtn"
Hub.GetKeyBtn.Text = "Get Key"
Hub.GetKeyBtn.Font = Enum.Font.GothamBold
Hub.GetKeyBtn.TextSize = 14
Hub.GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Hub.GetKeyBtn.BackgroundColor3 = Color3.fromRGB(44, 44, 50)
Hub.GetKeyBtn.BorderSizePixel = 0
Hub.GetKeyBtn.Position = UDim2.new(0.5, 5, 0, 210)
Hub.GetKeyBtn.Size = UDim2.new(0.5, -20, 0, 45)
Hub.GetKeyBtn.Parent = Hub.MainFrame
local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = Hub.GetKeyBtn
-- =========================================================================
-- ЧАСТЬ 4: ГЕНЕРАЦИЯ ОСНОВНОГО МЕНЮ И СТРУКТУРЫ САЙДБАРА
-- =========================================================================
Hub.MainMenuFrame = Instance.new("Frame")
Hub.MainMenuFrame.Name = "MainMenuFrame"
Hub.MainMenuFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 27)
Hub.MainMenuFrame.BorderSizePixel = 0
Hub.MainMenuFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
Hub.MainMenuFrame.AnchorPoint = Vector2.new(0.5, 0.5)
Hub.MainMenuFrame.Size = UDim2.new(0, 0, 0, 0)
Hub.MainMenuFrame.ClipsDescendants = true
Hub.MainMenuFrame.Visible = false
Hub.MainMenuFrame.Parent = Hub.ScreenGui
local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 12)
MenuCorner.Parent = Hub.MainMenuFrame

local HeaderFrame = Instance.new("Frame")
HeaderFrame.Size = UDim2.new(1, 0, 0, 50)
HeaderFrame.BackgroundTransparency = 1
HeaderFrame.Parent = Hub.MainMenuFrame

local MenuIcon = Instance.new("TextLabel")
MenuIcon.Text = "⚡"
MenuIcon.Font = Enum.Font.GothamBold
MenuIcon.TextSize = 18
MenuIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
MenuIcon.BackgroundTransparency = 1
MenuIcon.Position = UDim2.new(0, 15, 0, 10)
MenuIcon.Size = UDim2.new(0, 22, 0, 30)
MenuIcon.Parent = HeaderFrame

local MenuTitle = Instance.new("TextLabel")
MenuTitle.Text = "Lumino Hub"
MenuTitle.Font = Enum.Font.GothamBold
MenuTitle.TextSize = 22
MenuTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MenuTitle.BackgroundTransparency = 1
MenuTitle.Position = UDim2.new(0, 45, 0, 10)
MenuTitle.Size = UDim2.new(0.5, 0, 0, 30)
MenuTitle.TextXAlignment = Enum.TextXAlignment.Left
MenuTitle.Parent = HeaderFrame

Hub.MenuCloseButton = Instance.new("TextButton")
Hub.MenuCloseButton.Name = "MenuCloseButton"
Hub.MenuCloseButton.Text = "✕"
Hub.MenuCloseButton.Font = Enum.Font.GothamBold
Hub.MenuCloseButton.TextSize = 16
Hub.MenuCloseButton.TextColor3 = Color3.fromRGB(150, 150, 150)
Hub.MenuCloseButton.BackgroundTransparency = 1
Hub.MenuCloseButton.BorderSizePixel = 0
Hub.MenuCloseButton.Position = UDim2.new(1, -35, 0, 10)
Hub.MenuCloseButton.Size = UDim2.new(0, 20, 0, 30)
Hub.MenuCloseButton.Parent = HeaderFrame

Hub.MenuMinimizeButton = Instance.new("TextButton")
Hub.MenuMinimizeButton.Name = "MenuMinimizeButton"
Hub.MenuMinimizeButton.Text = "—"
Hub.MenuMinimizeButton.Font = Enum.Font.GothamBold
Hub.MenuMinimizeButton.TextSize = 14
Hub.MenuMinimizeButton.TextColor3 = Color3.fromRGB(150, 150, 150)
Hub.MenuMinimizeButton.BackgroundTransparency = 1
Hub.MenuMinimizeButton.BorderSizePixel = 0
Hub.MenuMinimizeButton.Position = UDim2.new(1, -60, 0, 10)
Hub.MenuMinimizeButton.Size = UDim2.new(0, 20, 0, 30)
Hub.MenuMinimizeButton.Parent = HeaderFrame

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Position = UDim2.new(0, 10, 0, 55)
Sidebar.Size = UDim2.new(0, 140, 1, -65)
Sidebar.BackgroundColor3 = Color3.fromRGB(30, 30, 33)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Hub.MainMenuFrame
local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 8)
SidebarCorner.Parent = Sidebar

local SidebarList = Instance.new("UIListLayout")
SidebarList.Padding = UDim.new(0, 4)
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Parent = Sidebar

local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Position = UDim2.new(0, 160, 0, 55)
ContentContainer.Size = UDim2.new(1, -170, 1, -65)
ContentContainer.BackgroundTransparency = 1
ContentContainer.Parent = Hub.MainMenuFrame
-- =========================================================================
-- ЧАСТЬ 5: НАПОЛНЕНИЕ СТРАНИЦ И СОРТИРОВКА ВКЛАДОК ПО КАТЕГОРИЯМ
-- =========================================================================
local function createPage(name)
    local Frame = Instance.new("Frame")
    Frame.Name = name
    Frame.Size = UDim2.new(1, 0, 1, 0)
    Frame.BackgroundTransparency = 1
    Frame.Visible = false
    Frame.Parent = ContentContainer
    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Parent = Frame
    Hub.Pages[name] = Frame
    return Frame
end

createPage("Home")
createPage("RiftPage")
createPage("BossPage")
createPage("IndexPage")
createPage("PlotPage")
createPage("AutoStealPage")
createPage("Visuals")
createPage("Server")
createPage("Account")

local function addPageTitle(pageFrame, text)
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = text
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 14
    TitleLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, 0, 0, 25)
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.LayoutOrder = 0
    TitleLabel.Parent = pageFrame
end

addPageTitle(Hub.Pages.Home, "Главная страница")
addPageTitle(Hub.Pages.RiftPage, "Функции Разлома (Rift)")
addPageTitle(Hub.Pages.BossPage, "Функции Босса (Boss)")
addPageTitle(Hub.Pages.IndexPage, "Функции Индекса")
addPageTitle(Hub.Pages.PlotPage, "Функции Плота")
addPageTitle(Hub.Pages.AutoStealPage, "Автоматическая кража (Auto Steal)")
addPageTitle(Hub.Pages.Visuals, "Настройки ESP (Скелеты/BOX)")
addPageTitle(Hub.Pages.Server, "Информация о сервере")
addPageTitle(Hub.Pages.Account, "Профиль пользователя")

Hub.Pages.Home.Visible = true

Hub.Pages.Settings = Instance.new("Frame")
Hub.Pages.Settings.Size = UDim2.new(1, 0, 1, 0)
Hub.Pages.Settings.BackgroundTransparency = 1
Hub.Pages.Settings.Visible = false
Hub.Pages.Settings.Parent = ContentContainer
local SettingsText = Instance.new("TextLabel")
SettingsText.Text = "Настройки интерфейса:\n\nНажмите на кнопку ниже, чтобы переназначить клавишу скрытия меню."
SettingsText.Font = Enum.Font.Gotham
SettingsText.TextSize = 13
SettingsText.TextColor3 = Color3.fromRGB(161, 161, 170)
SettingsText.BackgroundTransparency = 1
SettingsText.Size = UDim2.new(1, 0, 0, 45)
SettingsText.TextXAlignment = Enum.TextXAlignment.Left
SettingsText.Parent = Hub.Pages.Settings

Hub.BindBtn = Instance.new("TextButton")
Hub.BindBtn.Name = "BindBtn"
Hub.BindBtn.Text = "Клавиша скрытия: LeftControl"
Hub.BindBtn.Font = Enum.Font.GothamBold
Hub.BindBtn.TextSize = 12
Hub.BindBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Hub.BindBtn.BackgroundColor3 = Color3.fromRGB(39, 39, 42)
Hub.BindBtn.Position = UDim2.new(0, 0, 0, 55)
Hub.BindBtn.Size = UDim2.new(0, 220, 0, 35)
Hub.BindBtn.Parent = Hub.Pages.Settings
local BindCorner = Instance.new("UICorner")
BindCorner.CornerRadius = UDim.new(0, 6)
BindCorner.Parent = Hub.BindBtn

local function createCategoryHeader(titleText, order)
    local Header = Instance.new("TextLabel")
    Header.Text = "  " .. titleText:upper()
    Header.Font = Enum.Font.GothamBold
    Header.TextSize = 10
    Header.TextColor3 = Color3.fromRGB(110, 68, 255)
    Header.BackgroundTransparency = 1
    Header.Size = UDim2.new(1, 0, 0, 20)
    Header.TextXAlignment = Enum.TextXAlignment.Left
    Header.LayoutOrder = order
    Header.Parent = Sidebar
end

local function createTabButton(name, order, internalName)
    local actualName = internalName or name
    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = actualName .. "Tab"
    TabBtn.Text = "   " .. name
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 12
    TabBtn.TextColor3 = Color3.fromRGB(160, 160, 165)
    TabBtn.BackgroundColor3 = Color3.fromRGB(39, 39, 42)
    TabBtn.BackgroundTransparency = 1
    TabBtn.BorderSizePixel = 0
    TabBtn.Size = UDim2.new(1, 0, 0, 26)
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.LayoutOrder = order
    TabBtn.Parent = Sidebar
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 5)
    BtnCorner.Parent = TabBtn
    Hub.TabButtons[actualName] = TabBtn
end

createCategoryHeader("Ивент", 1)
createTabButton("Разлом", 2, "RiftPage")
createTabButton("Босс", 3, "BossPage")
createCategoryHeader("Главное", 4)
createTabButton("Home", 5)
createCategoryHeader("Функции", 6)
createCategoryHeader("Фарм", 7)
createTabButton("Индекс", 8, "IndexPage")
createTabButton("Плот", 9, "PlotPage")
createTabButton("Авто кража", 10, "AutoStealPage")
createCategoryHeader("Хаб", 11)
createTabButton("Настройки", 12, "Settings")
createTabButton("Скелеты (BOX)", 13, "Visuals")
createTabButton("Сервер", 14, "Server")
createCategoryHeader("Аккаунт", 15)
createTabButton("Account", 16)
-- =========================================================================
-- ЧАСТЬ 6: СИСТЕМА КОНСТРУКТОРА ТУМБЛЕРОВ TOGGLE
-- =========================================================================
function Hub.createToggle(pageFrame, text, layoutOrder, callback)
    local callbackFunc = callback or function() end
    local enabled = false
    
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, 0, 0, 36)
    ToggleFrame.BackgroundTransparency = 1
    ToggleFrame.LayoutOrder = layoutOrder
    ToggleFrame.Parent = pageFrame
    
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 42, 0, 22)
    ToggleBtn.Position = UDim2.new(0, 0, 0.5, 0)
    ToggleBtn.AnchorPoint = Vector2.new(0, 0.5)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(39, 39, 42)
    ToggleBtn.Text = ""
    ToggleBtn.BorderSizePixel = 0
    ToggleBtn.Parent = ToggleFrame
    
    local TCorner = Instance.new("UICorner")
    TCorner.CornerRadius = UDim.new(1, 0)
    TCorner.Parent = ToggleBtn
    
    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 16, 0, 16)
    Circle.Position = UDim2.new(0, 3, 0.5, 0)
    Circle.AnchorPoint = Vector2.new(0, 0.5)
    Circle.BackgroundColor3 = Color3.fromRGB(161, 161, 170)
    Circle.BorderSizePixel = 0
    Circle.Parent = ToggleBtn
    
    local CCorner = Instance.new("UICorner")
    CCorner.CornerRadius = UDim.new(1, 0)
    CCorner.Parent = Circle
    
    local Label = Instance.new("TextLabel")
    Label.Text = text
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 13
    Label.TextColor3 = Color3.fromRGB(200, 200, 205)
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0, 55, 0, 0)
    Label.Size = UDim2.new(1, -60, 1, 0)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = ToggleFrame
    
    ToggleBtn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(110, 68, 255)}):Play()
            TweenService:Create(Circle, TweenInfo.new(0.2), {Position = UDim2.new(1, -19, 0.5, 0), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        else
            TweenService:Create(ToggleBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(39, 39, 42)}):Play()
            TweenService:Create(Circle, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, 0), BackgroundColor3 = Color3.fromRGB(161, 161, 170)}):Play()
        end
        task.spawn(callbackFunc, enabled)
    end)
end

Hub.createToggle(Hub.Pages.AutoStealPage, "Включить автоматический сбор ресурсов", 1, function(state) print("Авто-кража предметов:", state) end)
Hub.createToggle(Hub.Pages.Visuals, "Включить Скелеты / Box ESP", 1, function(state) print("ESP подсветка игроков:", state) end)
Hub.createToggle(Hub.Pages.RiftPage, "Автоматическое закрытие разломов", 1, function(state) print("Авто-разломы:", state) end)
Hub.createToggle(Hub.Pages.BossPage, "Автоматический фарм боссов", 1, function(state) print("Авто-босс:", state) end)
-- =========================================================================
-- ЧАСТЬ 7: СВОРЯЧИВАНИЕ ОКНА, КЛИКИ, ДВИЖОК ДРАГА И ПОЛНОЕ ЗАКРЫТИЕ ФАЙЛА
-- =========================================================================
task.spawn(function()
    local frameCount = 0 local lastUpdate = os.clock()
    RunService.RenderStepped:Connect(function()
        frameCount = frameCount + 1 local now = os.clock()
        if now - lastUpdate >= 1 then
            Hub.WMFps.Text = tostring(math.floor(frameCount / (now - lastUpdate))) .. " fps"
            local ping = math.floor(Stats.Network.ServerTickRate:GetValue() or 0)
            if ping == 0 then ping = math.floor(Stats.PerformanceStats.Ping:GetValue() or 25) end
            Hub.WMPing.Text = tostring(ping) .. " ms "
            frameCount = 0 lastUpdate = now
        end
    end)
end)

local function createNotification(text, width)
    local frameWidth = width or 240
    local NotifFrame = Instance.new("Frame")
    NotifFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 38)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Position = UDim2.new(1, 50, 0.85, 0)
    NotifFrame.Size = UDim2.new(0, frameWidth, 0, 50)
    NotifFrame.Parent = Hub.ScreenGui
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 8)
    NotifCorner.Parent = NotifFrame
    local LeftBar = Instance.new("Frame")
    LeftBar.BackgroundColor3 = Color3.fromRGB(110, 68, 255)
    LeftBar.BorderSizePixel = 0
    LeftBar.Size = UDim2.new(0, 5, 1, 0)
    LeftBar.Parent = NotifFrame
    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(0, 8)
    BarCorner.Parent = LeftBar
    local NotifText = Instance.new("TextLabel")
    NotifText.BackgroundTransparency = 1
    NotifText.Position = UDim2.new(0, 15, 0, 0)
    NotifText.Size = UDim2.new(1, -20, 1, 0)
    NotifText.Font = Enum.Font.GothamMedium
    NotifText.Text = text
    NotifText.TextColor3 = Color3.fromRGB(240, 240, 240)
    NotifText.TextSize = 12
    NotifText.TextWrapped = true
    NotifText.TextXAlignment = Enum.TextXAlignment.Left
    NotifText.Parent = NotifFrame
    TweenService:Create(NotifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(1, -(frameWidth + 20), 0.85, 0)}):Play()
    task.delay(3.5, function()
        local slideOut = TweenService:Create(NotifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, 50, 0.85, 0)})
        slideOut:Play() slideOut.Completed:Connect(function() NotifFrame:Destroy() end)
    end)
end

local function copyTelegram()
    local telegramTag = "the_silent52"
    if setclipboard then setclipboard(telegramTag) elseif toclipboard then toclipboard(telegramTag) end
end

Hub.SupportBtn.MouseButton1Click:Connect(function() copyTelegram() createNotification("📋 Telegram скопирован!", 240) end)
Hub.GetKeyBtn.MouseButton1Click:Connect(function() copyTelegram() createNotification("📱 Вы скопировали мой юзер, напишите мне", 310) end)

local toggleKey = Enum.KeyCode.LeftControl
local isBinding = false local menuVisible = true local isMenuTweening = false
local finalMenuSize = UDim2.new(0, 500, 0, 320)

local function switchTab(tabName)
    for pageName, pageFrame in pairs(Hub.Pages) do pageFrame.Visible = false end
    for btnName, btnEl in pairs(Hub.TabButtons) do
        TweenService:Create(btnEl, TweenInfo.new(0.2), {BackgroundTransparency = 1, TextColor3 = Color3.fromRGB(160, 160, 165)}):Play()
    end
    if Hub.Pages[tabName] then Hub.Pages[tabName].Visible = true end
    if Hub.TabButtons[tabName] then
        TweenService:Create(Hub.TabButtons[tabName], TweenInfo.new(0.2), {BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(54, 32, 94), TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end
end

Hub.TabButtons.Home.MouseButton1Click:Connect(function() switchTab("Home") end)
Hub.TabButtons.RiftPage.MouseButton1Click:Connect(function() switchTab("RiftPage") end)
Hub.TabButtons.BossPage.MouseButton1Click:Connect(function() switchTab("BossPage") end)
Hub.TabButtons.IndexPage.MouseButton1Click:Connect(function() switchTab("IndexPage") end)
Hub.TabButtons.PlotPage.MouseButton1Click:Connect(function() switchTab("PlotPage") end)
Hub.TabButtons.AutoStealPage.MouseButton1Click:Connect(function() switchTab("AutoStealPage") end)
Hub.TabButtons.Settings.MouseButton1Click:Connect(function() switchTab("Settings") end)
Hub.TabButtons.Visuals.MouseButton1Click:Connect(function() switchTab("Visuals") end)
Hub.TabButtons.Server.MouseButton1Click:Connect(function() switchTab("Server") end)
Hub.TabButtons.Account.MouseButton1Click:Connect(function() switchTab("Account") end)

local function toggleMenu()
    if isMenuTweening then return end isMenuTweening = true
    if menuVisible then
        local closeTween = TweenService:Create(Hub.MainMenuFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1})
        closeTween:Play() closeTween.Completed:Connect(function() Hub.MainMenuFrame.Visible = false menuVisible = false isMenuTweening = false end)
    else
        Hub.MainMenuFrame.Visible = true
        local openTween = TweenService:Create(Hub.MainMenuFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = finalMenuSize, BackgroundTransparency = 0})
        openTween:Play() openTween.Completed:Connect(function() menuVisible = true isMenuTweening = false end)
    end
end

Hub.MenuMinimizeButton.MouseButton1Click:Connect(toggleMenu)
Hub.BindBtn.MouseButton1Click:Connect(function() if not isBinding then isBinding = true Hub.BindBtn.Text = "Нажмите любую клавишу..." Hub.BindBtn.BackgroundColor3 = Color3.fromRGB(54, 32, 94) end end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if isBinding and input.UserInputType == Enum.UserInputType.Keyboard then
        toggleKey = input.KeyCode Hub.BindBtn.Text = "Клавиша скрытия: " .. tostring(toggleKey.Name) Hub.BindBtn.BackgroundColor3 = Color3.fromRGB(39, 39, 42) isBinding = false
    elseif not gameProcessed and input.KeyCode == toggleKey then
        if Hub.MainMenuFrame.Size.X.Offset > 0 or menuVisible == false then toggleMenu() end
    end
end)

local function openMainMenu()
    Hub.MainMenuFrame.Visible = true TweenService:Create(Hub.MainMenuFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = finalMenuSize}):Play() switchTab("Home")
    local mDragging, mDragInput, mDragStart, mStartPos
    local function mUpdate(input)
        local delta = input.Position - mDragStart
        TweenService:Create(Hub.MainMenuFrame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(mStartPos.X.Scale, mStartPos.X.Offset + delta.X, mStartPos.Y.Scale, mStartPos.Y.Offset + delta.Y)}):Play()
    end
    Hub.MainMenuFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            mDragging = true mDragStart = input.Position mStartPos = Hub.MainMenuFrame.Position
            local connection connection = input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then mDragging = false connection:Disconnect() end end)
        end
    end)
    Hub.MainMenuFrame.InputChanged:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement then mDragInput = input end end)
    UserInputService.InputChanged:Connect(function(input) if input == mDragInput and mDragging then mUpdate(input) end end)
end

local isChecking = false
Hub.CheckBtn.MouseButton1Click:Connect(function()
    if isChecking then return end local enteredKey = Hub.KeyInput.Text
    if enteredKey == "" or enteredKey:match("^%s*$") then
        isChecking = true Hub.CheckBtn.Text = "напиши хоть что-то" Hub.CheckBtn.BackgroundColor3 = Color3.fromRGB(239, 68, 68) task.wait(1.5)
        Hub.CheckBtn.Text = "Check Key" Hub.CheckBtn.BackgroundColor3 = Color3.fromRGB(54, 32, 94) isChecking = false
    elseif enteredKey == "Lumin" then
        isChecking = true Hub.CheckBtn.Text = "спасибо что с нами" Hub.CheckBtn.TextColor3 = Color3.fromRGB(34, 197, 94) Hub.CheckBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 23) task.wait(1.2)
        local closeTween = TweenService:Create(Hub.MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1})
        closeTween:Play() closeTween.Completed:Connect(function()
            Hub.MainFrame:Destroy() Hub.Watermark.Visible = true Hub.Watermark.BackgroundTransparency = 1
            TweenService:Create(Hub.Watermark, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
            openMainMenu()
        end)
    else
        isChecking = true Hub.CheckBtn.Text = "вы ввели не тот ключ" Hub.CheckBtn.BackgroundColor3 = Color3.fromRGB(239, 68, 68) task.wait(1.5)
        Hub.CheckBtn.Text = "Check Key" Hub.CheckBtn.BackgroundColor3 = Color3.fromRGB(54, 32, 94) isChecking = false
    end
end)

local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    TweenService:Create(Hub.MainFrame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play()
end
Hub.MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true dragStart = input.Position startPos = Hub.MainFrame.Position
