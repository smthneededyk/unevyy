local chapter1 = 5777099015
local chapter2 = 9053673709
local chapter3 = 16527670555
local bossfight = nil
local mazerandom = nil

local Lighting = game:GetService("Lighting")
local player = game:GetService("Players").LocalPlayer


local getkeyschapter1 = function()
    local colors = {
        {248, 248, 248}, {255, 0, 0}, {170, 0, 170},
        {255, 255, 0}, {0, 255, 0}, {16, 42, 220},
    }
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "Handle" and (obj:IsA("Part") or obj:IsA("UnionOperation")) then
            local c = obj.Color
            local r, g, b = math.floor(c.R*255+0.5), math.floor(c.G*255+0.5), math.floor(c.B*255+0.5)
            for _, t in ipairs(colors) do
                if r == t[1] and g == t[2] and b == t[3] then
                    local cd = obj:FindFirstChildOfClass("ClickDetector")
                    if cd then pcall(fireclickdetector, cd) end
                    break
                end
            end
        end
    end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") then
            local h = obj:FindFirstChild("Handle")
            if h and (h:IsA("Part") or h:IsA("UnionOperation")) then
                local c = h.Color
                local r, g, b = math.floor(c.R*255+0.5), math.floor(c.G*255+0.5), math.floor(c.B*255+0.5)
                if r == 159 and g == 161 and b == 172 then
                    local cd = h:FindFirstChildOfClass("ClickDetector")
                    if cd then pcall(fireclickdetector, cd) end
                end
            end
        end
    end
end

local getitemschapter1 = function()
    local colors = {
        {248, 248, 248}, {255, 0, 0}, {170, 0, 170},
        {255, 255, 0}, {0, 255, 0}, {16, 42, 220},
        {205, 205, 205}, {159, 161, 172}, {196, 40, 28},
    }
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "Handle" and (obj:IsA("Part") or obj:IsA("UnionOperation")) then
            local c = obj.Color
            local r, g, b = math.floor(c.R*255+0.5), math.floor(c.G*255+0.5), math.floor(c.B*255+0.5)
            for _, t in ipairs(colors) do
                if r == t[1] and g == t[2] and b == t[3] then
                    local cd = obj:FindFirstChildOfClass("ClickDetector")
                    if cd then pcall(fireclickdetector, cd) end
                    break
                end
            end
        end
    end
end

local getkeyschapter2 = function()
    for _, obj in ipairs(workspace.WorkspaceItems:GetDescendants()) do
        if obj:IsA("ClickDetector") then
            local parent = obj.Parent
            if parent then
                local n = parent.Name
                if n == "BlueKey" or n == "GreenKey" or n == "RedKey" or n == "YellowKey" then
                    pcall(fireclickdetector, obj)
                end
            end
        end
    end
end

local getitemschapter2 = function()
    for _, obj in ipairs(workspace.WorkspaceItems:GetDescendants()) do
        if obj:IsA("ClickDetector") then
            pcall(fireclickdetector, obj)
        end
    end
end

local noFogToggle = Instance.new("BoolValue")
noFogToggle.Name = "NoFog"
noFogToggle.Parent = Lighting

local toggle = Instance.new("BoolValue")
toggle.Name = "Fullbright"
toggle.Parent = Lighting

local originalFogEnd = Lighting.FogEnd
local originalFogStart = Lighting.FogStart

noFogToggle.Changed:Connect(function(on)
    Lighting.FogEnd = on and 100000 or originalFogEnd
    Lighting.FogStart = on and 0 or originalFogStart
end)

toggle.Changed:Connect(function(on)
    Lighting.Brightness = on and 2 or 1
    Lighting.Ambient = on and Color3.new(1,1,1) or Color3.new(0,0,0)
    Lighting.OutdoorAmbient = on and Color3.new(1,1,1) or Color3.new(0,0,0)
    Lighting.GlobalShadows = not on
end)

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()

local Toggles = Library.Toggles
local Options = Library.Options

local Window = Library:CreateWindow({
    Title = "unevyy Hub",
    Footer = "v0.1",
    NotifySide = "Right",
    ShowCustomCursor = false,
    AutoShow = true,
    Center = true,
    CornerRadius = 2,
    ToggleKeybind = Enum.KeyCode.RightShift
})

local Info = Window:AddTab("Info", "user")
local Main = Window:AddTab("Main", "house")
local Exploits = Window:AddTab("Exploits", "shield")
local Visuals = Window:AddTab("Visuals", "eye")
local Chapters = Window:AddTab("Chapters", "earth")
local Settings = Window:AddTab("Settings", "settings")

local InfoLeft = Info:AddLeftGroupbox("Information")
local MainLeft = Main:AddLeftGroupbox("Character")
local MainRight = Main:AddRightGroupbox("Misc")
local ExploitsLeft = Exploits:AddLeftGroupbox("Anti")
local ExploitsRight = Exploits:AddRightGroupbox("Exploits")
local ChaptersLeft = Chapters:AddLeftGroupbox("Exploits")
local SettingsLeft = Settings:AddLeftGroupbox("Menu")

local VisualsLeftTB = Visuals:AddLeftTabbox("Camera / Effects")
local VisualsCamera = VisualsLeftTB:AddTab("Camera")
local VisualsEffects = VisualsLeftTB:AddTab("Effects")
local VisualsRightTB = Visuals:AddRightTabbox("ESP / Settings")
local VisualsESP = VisualsRightTB:AddTab("ESP")
local VisualsSettings = VisualsRightTB:AddTab("Settings")

local speedValue = 21
local jumpValue = 30

local speedSlider = MainLeft:AddSlider("SpeedBoost", {
    Text = "Speed Boost", Min = 0, Max = 100, Default = 21, Rounding = 0, Compact = true
})

local enablews = MainLeft:AddToggle("EnableWS", {
    Text = "Enable Speed Boost", Default = false, Tooltip = "Enables Speed Boost."
})

enablews:AddKeyPicker("EnableWSKey", {
    Default = "B",
    Mode = "Toggle",
    SyncToggleState = true,
    Text = "Speed Boost",
    NoUI = false
})

local jumpSlider = MainLeft:AddSlider("JumpBoost", {
    Text = "Jump Boost", Min = 0, Max = 300, Default = 30, Rounding = 0, Compact = true
})

local enablejp = MainLeft:AddToggle("EnableJP", {
    Text = "Enable Jump Boost", Default = false, Tooltip = "Enables Jump Boost."
})

local function update()
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    hum.WalkSpeed = enablews.Value and speedValue or 20
    hum.UseJumpPower = true
    hum.JumpPower = enablejp.Value and jumpValue or 37
end

speedSlider:OnChanged(function(v) speedValue = v; update() end)
jumpSlider:OnChanged(function(v) jumpValue = v; update() end)
enablews:OnChanged(update)
enablejp:OnChanged(update)

player.CharacterAdded:Connect(function()
    task.wait(0.5)
    update()
end)

MainRight:AddButton("GetAllItems", {
    Text = "Get All Items",
    Tooltip = "Gets you every item in the game (including keys).",
    Func = function()
        if game.PlaceId == chapter1 then
            getitemschapter1()
        elseif game.PlaceId == chapter2 then
            getitemschapter2()
        end
    end
})

MainRight:AddButton("GetAllKeys", {
    Text = "Get All Keys",
    Tooltip = "Gets you every key in the game.",
    Func = function()
        if game.PlaceId == chapter1 then
            getkeyschapter1()
        elseif game.PlaceId == chapter2 then
            getkeyschapter2()
        end
    end
})

MainRight:AddDivider()

local KeyDoors = {}
local Barriers = {}

if game.PlaceId == chapter1 then
    KeyDoors = {
        workspace.DoorKey,
        workspace.DoorKey2,
        workspace.DoorKey3,
        workspace.DoorKey6,
        workspace.DoorKey7,
        workspace.DoorKey9,
        workspace.DoorKey10,
    }

    Barriers = {
        workspace.DoorPoint2,
        workspace.DoorAtSpawn.Door,
        workspace.NewDoor1.Door,
        workspace.Door,
        workspace.WinnerDoor,
        workspace.WinnerDoor2,
    }
elseif game.PlaceId == chapter2 then
    KeyDoors = {
        workspace.Doors.DoorKey1,
        workspace.Doors.DoorKey2,
        workspace.Doors.DoorKey3,
        workspace.Doors.DoorKey4,
    }

    Barriers = {
        workspace.DoorPoint,
        workspace.DoorPoint2,
        workspace.DoorPoint11,
        workspace.DoorPoint22,
    }
end

if workspace:FindFirstChild("Door") then
    table.insert(Barriers, workspace.Door)
end
if workspace:FindFirstChild("Door22") then
    table.insert(Barriers, workspace.Door22)
end

local function clean(t)
    local out = {}
    for _, v in ipairs(t) do
        if v then table.insert(out, v) else warn("[unevyy] nil entry in table") end
    end
    return out
end

KeyDoors = clean(KeyDoors)
Barriers = clean(Barriers)

local Locks = {}
local KeyDoorParts = {}

for _, door in ipairs(KeyDoors) do
    if door:IsA("BasePart") then
        table.insert(KeyDoorParts, door)
        for _, child in ipairs(door:GetChildren()) do
            if child:IsA("BasePart") and child.Name == "Lock" then
                table.insert(Locks, child)
            end
        end
    else
        for _, d in ipairs(door:GetDescendants()) do
            if d:IsA("BasePart") then
                if d.Name == "Lock" then
                    table.insert(Locks, d)
                end
                table.insert(KeyDoorParts, d)
            end
        end
    end
end

local BarrierParts = {}
local seen = {}
local function addUnique(list, p)
    if p and not seen[p] then
        seen[p] = true
        table.insert(list, p)
    end
end

for _, b in ipairs(Barriers) do addUnique(BarrierParts, b) end
for _, d in ipairs(KeyDoorParts) do addUnique(BarrierParts, d) end
for _, l in ipairs(Locks) do addUnique(BarrierParts, l) end

-- warn(("[unevyy] place=%d KeyDoors=%d KeyDoorParts=%d Locks=%d Barriers=%d BarrierParts=%d"):format(game.PlaceId, #KeyDoors, #KeyDoorParts, #Locks, #Barriers, #BarrierParts))

local enforceNoCollide = false
local enforceTransparency = false
local enforceLocksInvisible = false
local transparencyValue = 0

for _, part in ipairs(BarrierParts) do
    if part:IsA("BasePart") then
        part:GetPropertyChangedSignal("CanCollide"):Connect(function()
            if enforceNoCollide and part.CanCollide then
                part.CanCollide = false
            end
        end)
    end
end

for _, part in ipairs(KeyDoorParts) do
    if part:IsA("BasePart") then
        part:GetPropertyChangedSignal("Transparency"):Connect(function()
            if enforceTransparency and part.Transparency ~= transparencyValue then
                part.Transparency = transparencyValue
            end
        end)
    end
end

for _, lock in ipairs(Locks) do
    if lock:IsA("BasePart") then
        lock:GetPropertyChangedSignal("Transparency"):Connect(function()
            if enforceLocksInvisible and lock.Transparency ~= 1 then
                lock.Transparency = 1
            end
        end)
    end
end

local nobarriers = MainRight:AddToggle("NoBarriers", {
    Text = "No Barriers",
    Default = false,
    Tooltip = "Sets CanCollide = false on barriers, key doors, and locks."
})

nobarriers:AddKeyPicker("NoBarriersKey", {
    Default = "R",
    Mode = "Toggle",
    SyncToggleState = true,
    Text = "No Barriers",
    NoUI = false
})

nobarriers:OnChanged(function(Value)
    enforceNoCollide = Value
    for _, part in ipairs(BarrierParts) do
        if part:IsA("BasePart") then
            part.CanCollide = not Value
        end
    end
end)

local transparencySlider = MainRight:AddSlider("LockedDoorTransparency", {
    Text = "Locked Door Transparency",
    Min = 0,
    Max = 1,
    Default = 0,
    Rounding = 1,
    Compact = true
})

transparencySlider:OnChanged(function(Value)
    transparencyValue = Value
    if enforceTransparency then
        for _, part in ipairs(KeyDoorParts) do
            if part:IsA("BasePart") then
                part.Transparency = Value
            end
        end
    end
end)

local transparentlockeddoors = MainRight:AddToggle("TransparentLockedDoors", {
    Text = "Transparent Locked Doors",
    Default = false,
    Tooltip = "Makes every locked door (key door) transparent (customizable)."
})

transparentlockeddoors:OnChanged(function(Value)
    enforceTransparency = Value
    for _, part in ipairs(KeyDoorParts) do
        if part:IsA("BasePart") then
            part.Transparency = Value and transparencyValue or 0
        end
    end
end)

local invisiblelocks = MainRight:AddToggle("InvisibleLocks", {
    Text = "Invisible Locks",
    Default = false,
    Tooltip = "Forces every 'Lock' inside key doors to full transparency."
})

invisiblelocks:OnChanged(function(Value)
    enforceLocksInvisible = Value
    for _, lock in ipairs(Locks) do
        if lock:IsA("BasePart") then
            lock.Transparency = Value and 1 or 0
        end
    end
end)

ExploitsLeft:AddButton({
    Text = "Anti Rat",
    DoubleClick = false,
    Func = function()
        local ev = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
        if ev then
            local dmg = ev:FindFirstChild("DamagePlayer")
            if dmg then dmg:Destroy() end
        end
    end
})

ExploitsRight:AddButton({
    Text = "Get All Cheese [FE]",
    DoubleClick = false,
    Risky = false,
    Func = function()
        local ls = game:GetService("Players").LocalPlayer:FindFirstChild("leaderstats")
        local cheeseVal = ls and ls:FindFirstChild("Cheese")
        local cheese = cheeseVal and cheeseVal.Value or 0
        local needed
        if game.PlaceId == chapter1 then
            needed = 9 - cheese
        elseif game.PlaceId == chapter2 then
            needed = 12 - cheese
        elseif game.PlaceId == chapter3 then
            needed = 15 - cheese
        end
        if needed > 0 then
            local find = workspace:FindFirstChild("FindCheese")
            if find then find:Destroy() end
            local rs = game:GetService("ReplicatedStorage")
            local add = rs:FindFirstChild("AddCheese")
            if add then
                for _ = 1, needed do add:FireServer() end
            end
        else
            Library:Notify("You already have " .. cheese .. " cheese.", 5)
        end
    end
})

ExploitsRight:AddButton({
    Text = "Get Escape Badge",
    DoubleClick = false,
    Risky = false,
    Func = function()
        if not game:GetService("BadgeService"):UserHasBadgeAsync(player.UserId, 2124910071) then
            local ev = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
            local give = ev and ev:FindFirstChild("GiveBadge")
            if give then give:FireServer(2124910071) end
        else
            Library:Notify("You already have the badge.", 5)
        end
    end
})

local badges = {
    2124910071, 2124910945, 2124940134, 2124940136,
    2126421424, 4294830669625079, 3199152428705017,
}

ExploitsRight:AddButton({
    Text = "Get All Badges",
    DoubleClick = true,
    Risky = true,
    Tooltip = "Grants you every achievement of your wisdom in the game...",
    Func = function()
        local BadgeService = game:GetService("BadgeService")
        local hasAll = true
        for _, id in ipairs(badges) do
            if not BadgeService:UserHasBadgeAsync(player.UserId, id) then
                hasAll = false
                break
            end
        end
        if hasAll then
            Library:Notify("You already have all the badges.", 5)
        else
            local ev = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
            local give = ev and ev:FindFirstChild("GiveBadge")
            if give then
                for _, id in ipairs(badges) do give:FireServer(id) end
                Library:Notify("You got every badge in the game...", 5)
            end
        end
    end
})

local model = workspace:FindFirstChild("Mouse")
local highlight, billboard, textLabel

if model then
    highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
    highlight.Enabled = false
    highlight.Parent = model

    billboard = Instance.new("BillboardGui")
    billboard.Name = "NameTag"
    billboard.Size = UDim2.new(0, 100, 0, 25)
    billboard.StudsOffset = Vector3.new(0, 10, 0)
    billboard.AlwaysOnTop = true
    billboard.Enabled = false
    billboard.Parent = model

    textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "Rat"
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextScaled = true
    textLabel.Parent = billboard
end

local removecamshake = VisualsCamera:AddToggle("RemoveCameraShake", {
    Text = "Remove Camera Shake",
    Default = false,
    Tooltip = "Prevents the camera from shaking."
})

local cameraShakeConn
removecamshake:OnChanged(function(Value)
    if cameraShakeConn then cameraShakeConn:Disconnect() end
    if Value then
        cameraShakeConn = game:GetService("RunService").RenderStepped:Connect(function()
            local cam = workspace.CurrentCamera
            if cam and cam.CFrame ~= cam.CFrame * CFrame.new() then
                cam.CFrame = CFrame.new(cam.CFrame.Position, cam.CFrame.Position + cam.CFrame.LookVector)
            end
        end)
    end
end)

local espmouse = VisualsESP:AddToggle("MouseESP", {
    Text = "Highlight Rat",
    Default = false,
    Callback = function(state)
        if highlight then highlight.Enabled = state end
        if billboard then billboard.Enabled = state end
    end
})

if espmouse and highlight then
    espmouse:AddColorPicker("MouseColor", {
        Default = Color3.fromRGB(255, 0, 0),
        Callback = function(color)
            highlight.FillColor = color
            highlight.OutlineColor = color
            if textLabel then textLabel.TextColor3 = color end
        end
    })
end

local fullbright = VisualsEffects:AddToggle("Fullbright", {
    Text = "Fullbright",
    Default = false,
    Tooltip = "Makes everything be bright."
})

local nofog = VisualsEffects:AddToggle("NoFog", {
    Text = "No Fog",
    Default = false,
    Tooltip = "Removes Fog."
})

fullbright:OnChanged(function(Value)
    toggle.Value = Value
end)

nofog:OnChanged(function(Value)
    noFogToggle.Value = Value
end)

Chapters:UpdateWarningBox({
    Visible = true,
    Title = "WARNING",
    Text = "Features marked red wont work in this chapter.",
    IsNormal = false
})

if game.PlaceId == chapter1 then
local function dupeditems(r, g, b, requireWorkspaceParent)
    for _, obj in ipairs(workspace:GetChildren()) do
        if obj.Name == "Handle" and (obj:IsA("Part") or obj:IsA("UnionOperation")) then
            local c = obj.Color
            if math.floor(c.R*255+0.5) == r and math.floor(c.G*255+0.5) == g and math.floor(c.B*255+0.5) == b then
                if requireWorkspaceParent and obj.Parent ~= workspace then continue end
                local cd = obj:FindFirstChildOfClass("ClickDetector")
                if cd then pcall(fireclickdetector, cd) end
                return
            end
        end
    end
end

ChaptersLeft:AddDropdown("SelectDupeItem", {
    Text = "Select Dupe Item",
    Values = {"Wood Plank", "Bloxy Cola", "Red Cheese"},
    Default = "Red Cheese"
})

ChaptersLeft:AddButton({
    Text = "Get Item For The Dupe",
    DoubleClick = false,
    Risky = false,
    Func = function()
        local duping = Options.SelectDupeItem.Value
        if duping == "Red Cheese" then
            dupeditems(196, 40, 28)
        elseif duping == "Bloxy Cola" then
            dupeditems(205, 205, 205)
        elseif duping == "Wood Plank" then
            dupeditems(159, 161, 172, true)
        end
    end
})

ChaptersLeft:AddButton({
    Text = "Dupe Item [FE]",
    DoubleClick = false,
    Risky = false,
    Func = function()
        local char = game:GetService("Players").LocalPlayer.Character
        local bp = game:GetService("Players").LocalPlayer.Backpack
        if not char or not bp then return end
        local duping = Options.SelectDupeItem.Value
        for _, y in ipairs(char:GetChildren()) do
            if y:IsA("Tool") and (y.Name == "Board" or y.Name == "RedCheese" or y.Name == "BloxyCola") then
                local target = char:FindFirstChild(y.Name)
                if target then
                    if duping == "Red Cheese" then
                        pcall(function()
                            dupeditems(196, 40, 28)
                            bp.RedCheese.Parent = char
                        end)
                    elseif duping == "Bloxy Cola" then
                        pcall(function()
                            dupeditems(205, 205, 205)
                            bp.BloxyCola.Parent = char
                        end)
                    elseif duping == "Wood Plank" then
                        pcall(function()
                            dupeditems(159, 161, 172, true)
                            bp.Plank.Parent = char
                        end)
                    end
                end
            end
        end
    end
})
else
ChaptersLeft:AddDropdown("SelectDupeItem", {
    Text = "Select Dupe Item",
    Values = {"Wood Plank", "Bloxy Cola", "Red Cheese"},
    Default = "Red Cheese",
    Risky = true
})

ChaptersLeft:AddButton({
    Text = "Get Item For The Dupe",
    DoubleClick = false,
    Risky = true
})

ChaptersLeft:AddButton({
    Text = "Dupe Item [FE]",
    DoubleClick = false,
    Risky = true
})
end

local keybindmenu = SettingsLeft:AddToggle("ShowKeybindsToggle", {
    Text = "Show Keybinds Menu",
    Default = false
})

keybindmenu:OnChanged(function(Value)
    Library.KeybindFrame.Visible = Value
end)

SettingsLeft:AddButton({
    Text = "Unload UI",
    DoubleClick = true,
    Func = function()
        Library:Unload()
    end
})
