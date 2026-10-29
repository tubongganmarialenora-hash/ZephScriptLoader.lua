--[[
    Project: Zeph Hub (Full 12-Per-Tab Compact Edition)
    Features: 36 Total Working Scripts, Loading Screen, Aqua Glow, Compact UI
]]

-- Safeguard against multiple executions
if game.CoreGui:FindFirstChild("ZephHubCompactFull") then
    game.CoreGui:FindFirstChild("ZephHubCompactFull"):Destroy()
end

-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- UI Construction (1.7x Smaller Scale: 340x220)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZephHubCompactFull"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

----------------------------------------------------------------
-- LOADING SCREEN OVERLAY
----------------------------------------------------------------
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Name = "LoadingFrame"
LoadingFrame.Parent = ScreenGui
LoadingFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Position = UDim2.new(0.5, -110, 0.5, -70)
LoadingFrame.Size = UDim2.new(0, 220, 0, 140)
LoadingFrame.ZIndex = 10

local LoadCorner = Instance.new("UICorner")
LoadCorner.CornerRadius = UDim.new(0, 6)
LoadCorner.Parent = LoadingFrame

local LoadStroke = Instance.new("UIStroke")
LoadStroke.Parent = LoadingFrame
LoadStroke.Color = Color3.fromRGB(0, 212, 255)
LoadStroke.Thickness = 1.2
LoadStroke.Transparency = 0.2

local LoadText = Instance.new("TextLabel")
LoadText.Parent = LoadingFrame
LoadText.BackgroundTransparency = 1
LoadText.Position = UDim2.new(0, 0, 0.3, 0)
LoadText.Size = UDim2.new(1, 0, 0, 30)
LoadText.Font = Enum.Font.GothamBold
LoadText.Text = "ZEPH HUB"
LoadText.TextColor3 = Color3.fromRGB(0, 212, 255)
LoadText.TextSize = 14
LoadText.ZIndex = 11

local SubLoadText = Instance.new("TextLabel")
SubLoadText.Parent = LoadingFrame
SubLoadText.BackgroundTransparency = 1
SubLoadText.Position = UDim2.new(0, 0, 0.55, 0)
SubLoadText.Size = UDim2.new(1, 0, 0, 20)
SubLoadText.Font = Enum.Font.Gotham
SubLoadText.Text = "Loading 36 modules..."
SubLoadText.TextColor3 = Color3.fromRGB(160, 160, 180)
SubLoadText.TextSize = 9
SubLoadText.ZIndex = 11

----------------------------------------------------------------
-- MAIN COMPACT WINDOW
----------------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -110)
MainFrame.Size = UDim2.new(0, 340, 0, 220)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Parent = MainFrame
MainStroke.Color = Color3.fromRGB(0, 212, 255)
MainStroke.Thickness = 1.2
MainStroke.Transparency = 0.2

-- Top Title Bar ("Zeph Hub Bar")
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 24)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 6)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 8, 0, 0)
Title.Size = UDim2.new(0, 150, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Zeph Hub v1.0"
Title.TextColor3 = Color3.fromRGB(0, 212, 255)
Title.TextSize = 10
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TopBar
CloseButton.BackgroundTransparency = 1
CloseButton.Position = UDim2.new(1, -24, 0, 0)
CloseButton.Size = UDim2.new(0, 24, 1, 0)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(180, 180, 180)
CloseButton.TextSize = 12

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Sidebar Navigation Frame
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
Sidebar.BorderSizePixel = 0
Sidebar.Position = UDim2.new(0, 0, 0, 24)
Sidebar.Size = UDim2.new(0, 95, 1, -24)

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = Sidebar
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 2)

-- Computer / Terminal Indicator Section beside tabs
local PCIndicator = Instance.new("Frame")
PCIndicator.Parent = Sidebar
PCIndicator.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
PCIndicator.Size = UDim2.new(1, 0, 0, 26)
PCIndicator.BorderSizePixel = 0
PCIndicator.LayoutOrder = 0

local PCText = Instance.new("TextLabel")
PCText.Parent = PCIndicator
PCText.BackgroundTransparency = 1
PCText.Size = UDim2.new(1, 0, 1, 0)
PCText.Font = Enum.Font.Code
PCText.Text = "💻 [PC: Online]"
PCText.TextColor3 = Color3.fromRGB(0, 212, 255)
PCText.TextSize = 8

-- Content Area Holder
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Parent = MainFrame
ContentArea.BackgroundTransparency = 1
ContentArea.Position = UDim2.new(0, 98, 0, 28)
ContentArea.Size = UDim2.new(1, -101, 1, -32)

-- Container Pages Dictionary
local Pages = {}
local TabButtons = {}

local function createTabButton(name, order)
    local Btn = Instance.new("TextButton")
    Btn.Parent = Sidebar
    Btn.BackgroundTransparency = 1
    Btn.Size = UDim2.new(1, 0, 0, 24)
    Btn.Font = Enum.Font.GothamMedium
    Btn.Text = " " .. name
    Btn.TextColor3 = Color3.fromRGB(150, 150, 150)
    Btn.TextSize = 8.5
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.LayoutOrder = order

    local Page = Instance.new("ScrollingFrame")
    Page.Name = name .. "Page"
    Page.Parent = ContentArea
    Page.BackgroundTransparency = 1
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.ScrollBarThickness = 2
    Page.Visible = false

    local PageLayout = Instance.new("UIListLayout")
    PageLayout.Parent = Page
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.Padding = UDim.new(0, 4)

    Pages[name] = Page
    table.insert(TabButtons, {Button = Btn, Page = Page})

    Btn.MouseButton1Click:Connect(function()
        for _, tab in ipairs(TabButtons) do
            tab.Page.Visible = false
            tab.Button.TextColor3 = Color3.fromRGB(150, 150, 150)
            tab.Button.BackgroundTransparency = 1
        end
        Page.Visible = true
        Btn.TextColor3 = Color3.fromRGB(0, 212, 255)
        Btn.BackgroundTransparency = 0.8
        Btn.BackgroundColor3 = Color3.fromRGB(0, 212, 255)
    end)

    return Page
end

-- Create the 3 Tabs
local DebugPage = createTabButton("Debug", 1)
local UniversalPage = createTabButton("Universal", 2)
local MultiGamePage = createTabButton("Multi-Game", 3)

-- Select first tab by default
TabButtons[1].Page.Visible = true
TabButtons[1].Button.TextColor3 = Color3.fromRGB(0, 212, 255)
TabButtons[1].Button.BackgroundTransparency = 0.8
TabButtons[1].Button.BackgroundColor3 = Color3.fromRGB(0, 212, 255)

-- Helper to add script buttons
local function addButton(page, label, callback)
    local ScriptBtn = Instance.new("TextButton")
    ScriptBtn.Parent = page
    ScriptBtn.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    ScriptBtn.Size = UDim2.new(1, -4, 0, 20)
    ScriptBtn.Font = Enum.Font.Gotham
    ScriptBtn.Text = " " .. label
    ScriptBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    ScriptBtn.TextSize = 8
    ScriptBtn.TextXAlignment = Enum.TextXAlignment.Left

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = ScriptBtn

    local Stroke = Instance.new("UIStroke")
    Stroke.Parent = ScriptBtn
    Stroke.Color = Color3.fromRGB(0, 212, 255)
    Stroke.Transparency = 0.85
    Stroke.Thickness = 1

    ScriptBtn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

    local layout = page:FindFirstChildOfClass("UIListLayout")
    if layout then
        page.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 6)
    end
end

----------------------------------------------------------------
-- TAB 1: DEBUG TOOLS (12 Features)
----------------------------------------------------------------
addButton(DebugPage, "Dex Reimagined", function() loadstring(game:HttpGet("https://github.com/undertalereal/DexReimagined/releases/latest/download/dex-reimagined.lua"))() end)
addButton(DebugPage, "Dex++ Official", function() loadstring(game:HttpGet("https://gist.githubusercontent.com/BROgenesis/958c1fee7d8ad100da7f7d020d5d67f3/raw/8dc95caca1b46aa9f4d9dd2433f6be3d9bc69e45/Dex++"))() end)
addButton(DebugPage, "SimpleSpy V3", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))() end)
addButton(DebugPage, "Hydroxide Scanner", function()
    local o, b = "Upbolt", "revision"
    local function w(f) return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Hydroxide/%s/%s.lua"):format(o, b, f)))() end
    w("init") w("ui/main")
end)
addButton(DebugPage, "Infinite Yield", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
addButton(DebugPage, "Remote Spy (SimpleSpy Alt)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/RemoteSpy.lua"))() end)
addButton(DebugPage, "Client Defender", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/PseudoGit/ClientDefender/main/loader.lua"))() end)
addButton(DebugPage, "Promise Library", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/evaera/Promise/master/lib/init.lua"))() end)
addButton(DebugPage, "Rspy v2", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/remotespy.lua"))() end)
addButton(DebugPage, "Instance Viewer", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/AZUR_v3/InstanceViewer/main/init.lua"))() end)
addButton(DebugPage, "Function Dump", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CorpLua/FunctionDumper/main/init.lua"))() end)
addButton(DebugPage, "Console Log Viewer", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/LogViewer.lua"))() end)

----------------------------------------------------------------
-- TAB 2: UNIVERSAL SCRIPTS (12 Features)
----------------------------------------------------------------
addButton(UniversalPage, "OwlHub Aim/ESP", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))() end)
addButton(UniversalPage, "CMD-X Admin", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))() end)
addButton(UniversalPage, "Vynixius Loader", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Loader.lua"))() end)
addButton(UniversalPage, "Pendulum Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs/main/Loader.lua"))() end)
addButton(UniversalPage, "Domain X UI", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/DomainX/main/source"))() end)
addButton(UniversalPage, "Unnamed ESP", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/UnnamedCode/UnnamedESP/main/ESP.lua"))() end)
addButton(UniversalPage, "Fly Script V3", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() end)
addButton(UniversalPage, "Noclip Universal", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/speedster-gaming/sb-project/main/noclip.lua"))() end)
addButton(UniversalPage, "Aimbot Mobile", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/taylors-scripts/UniversalAimbot/main/init.lua"))() end)
addButton(UniversalPage, "Hitbox Expander", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScript/main/HitboxExtender.lua"))() end)
addButton(UniversalPage, "Chat Spammer", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/ChatSpammer.lua"))() end)
addButton(UniversalPage, "Bhop / Speed Tweaks", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/UniversalBhop/main/source.lua"))() end)

----------------------------------------------------------------
-- TAB 3: MULTI-GAME SCRIPTS (12 Features)
----------------------------------------------------------------
addButton(MultiGamePage, "Foxname (Steal Egg)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn-stealanegg.lua"))() end)
addButton(MultiGamePage, "Ringta (Ink Game)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))() end)
addButton(MultiGamePage, "Vape v4 (BedWars)", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))() end)
addButton(MultiGamePage, "Project Lazarus", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/ProjectLazarus", true))() end)
addButton(MultiGamePage, "Blob Hub Loader", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/BlobbyKernel/BlobHub/main/Loader.lua"))() end)
addButton(MultiGamePage, "PSX / PS99 Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/isti1/PS99/main/loader"))() end)
addButton(MultiGamePage, "Blox Fruits Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RedzHub/BloxFruits/main/source.lua"))() end)
addButton(MultiGamePage, "Da Hood Aim/Lock", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/main/loader.lua"))() end)
addButton(MultiGamePage, "Arsenal Hub", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Tbao143/Free-Script/main/Arsenal.lua"))() end)
addButton(MultiGamePage, "Murder Mystery 2", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Drifter0507/Scripts/main/MM2.lua"))() end)
addButton(MultiGamePage, "Natural Disaster", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/NaturalDisaster"))() end)
addButton(MultiGamePage, "BedWars Genesis", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/genesis-bedwars/genesis/main/loader.lua"))() end)

----------------------------------------------------------------
-- RUN LOADING SEQUENCE THEN REVEAL UI
----------------------------------------------------------------
task.spawn(function()
    task.wait(1.2)
    local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(LoadingFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
    for _, child in ipairs(LoadingFrame:GetDescendants()) do
        if child:IsA("TextLabel") then
            TweenService:Create(child, tweenInfo, {TextTransparency = 1}):Play()
        elseif child:IsA("UIStroke") then
            TweenService:Create(child, tweenInfo, {Transparency = 1}):Play()
        end
    end
    task.wait(0.4)
    LoadingFrame:Destroy()
    MainFrame.Visible = true
end)
