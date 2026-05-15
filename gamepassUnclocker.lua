local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")
local marketplaceService = game:GetService("MarketplaceService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")

local player = players.LocalPlayer
local targetGui = coreGui

if targetGui:FindFirstChild("roosyHub") then
    targetGui.roosyHub:Destroy()
end

local effectedStroke = Instance.new("UIStroke")
effectedStroke.Color = Color3.fromRGB(255, 255, 255)
effectedStroke.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize

local effectStrokeGradient = Instance.new("UIGradient")
effectStrokeGradient.Parent = effectedStroke
effectStrokeGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,0,0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(121, 121, 121))
}

local frameTemplate = Instance.new("Frame")

local textLabelTemplate = Instance.new("TextLabel")
textLabelTemplate.BackgroundTransparency = 1
textLabelTemplate.TextScaled = true

local imageLabelTemplate = Instance.new("ImageLabel")
imageLabelTemplate.BackgroundTransparency = 1

local textButtonTemplate = Instance.new("TextButton")
textButtonTemplate.Text = ""

local uiCornerTemplate = Instance.new("UICorner")

local effectedGradientTemplate = Instance.new("UIGradient")
effectedGradientTemplate.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(39,39,39)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,0,0))
}

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.CanvasSize = UDim2.new(0, 0, 1000, 0)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 0

local effectedTextButton = textButtonTemplate:Clone()
effectedGradientTemplate:Clone().Parent = effectedTextButton
local btnStroke = effectedStroke:Clone()
btnStroke.Parent = effectedTextButton
btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local roosyHub = Instance.new("ScreenGui")
roosyHub.Name = "roosyHub"
roosyHub.Parent = targetGui
roosyHub.ResetOnSpawn = false
roosyHub.IgnoreGuiInset = true
roosyHub.ZIndexBehavior = Enum.ZIndexBehavior.Global
roosyHub.Enabled = false

local container = frameTemplate:Clone()
container.Name = "container"
container.Parent = roosyHub
container.Size = UDim2.new(0.2, 0, 0.3, 0)
container.Position = UDim2.new(0.5, 0, 1.5, 0)
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.BackgroundTransparency = 0.3
container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
container.BorderSizePixel = 0
container.ZIndex = 1
container.ClipsDescendants = true

local containerCorner = uiCornerTemplate:Clone()
containerCorner.Parent = container
containerCorner.Name = "containerCorner"
containerCorner.CornerRadius = UDim.new(0.02, 0)

local containerStroke = effectedStroke:Clone()
containerStroke.Parent = container
containerStroke.Name = "containerStroke"
containerStroke.Thickness = 0.005

local containerShadow = imageLabelTemplate:Clone()
containerShadow.Name = "containerShadow"
containerShadow.Parent = container
containerShadow.Size = UDim2.new(1.1, 0, 1.1, 0)
containerShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
containerShadow.AnchorPoint = Vector2.new(0.5, 0.5)
containerShadow.Image = "rbxassetid://1316045217"
containerShadow.ImageColor3 = Color3.fromRGB(35, 41, 47)
containerShadow.ImageTransparency = 0.4
containerShadow.ZIndex = 0

local title = textLabelTemplate:Clone()
title.Name = "title"
title.Parent = container
title.Font = Enum.Font.MontserratBold
title.Text = "Dc: roosydev"
title.Size = UDim2.new(0.999, 0, 0.069, 0)
title.Position = UDim2.new(0, 0, 0.016, 0)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.ZIndex = 2

local close = textButtonTemplate:Clone()
close.Name = "close"
close.Parent = container
close.Size = UDim2.new(0.084, 0, 0.069, 0)
close.Position = UDim2.new(0.944, 0, 0.051, 0)
close.AnchorPoint = Vector2.new(0.5, 0.5)
close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close.ZIndex = 3

local closeText = textLabelTemplate:Clone()
closeText.Name = "closeText"
closeText.Parent = close
closeText.Font = Enum.Font.MontserratBold
closeText.Text = "X"
closeText.Size = UDim2.new(0.8, 0, 0.8, 0)
closeText.Position = UDim2.new(0.5, 0, 0.5, 0)
closeText.AnchorPoint = Vector2.new(0.5, 0.5)
closeText.TextColor3 = Color3.fromRGB(255, 255, 255)
closeText.ZIndex = 4

local closeCorner = uiCornerTemplate:Clone()
closeCorner.Parent = close
closeCorner.Name = "closeCorner"
closeCorner.CornerRadius = UDim.new(0.222, 0)

local closeGradient = effectedGradientTemplate:Clone()
closeGradient.Parent = close
closeGradient.Rotation = 90

local closeStroke = effectedStroke:Clone()
closeStroke.Parent = close
closeStroke.Thickness = 0.05
closeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local clear = close:Clone()
clear.Name = "clear"
clear.Parent = container
clear.Position = UDim2.new(0.5, 0, 0.924, 0)
clear.Size = UDim2.new(0.959, 0, 0.096, 0)
clear.closeText.Text = "Clear History"
clear.closeText.Size = UDim2.new(0.5, 0, 0.7, 0)
clear.closeText.Position = UDim2.new(0.5, 0, 0.5, 0)
clear.closeText.AnchorPoint = Vector2.new(0.5, 0.5)

local list = scrollingFrame:Clone()
list.Name = "list"
list.Parent = container
list.Size = UDim2.new(0.959, 0, 0.576, 0)
list.Position = UDim2.new(0.02, 0, 0.273, 0)
list.AutomaticCanvasSize = Enum.AutomaticSize.Y

local listeningLabel = textLabelTemplate:Clone()
listeningLabel.Name = "listeningLabel"
listeningLabel.Parent = list
listeningLabel.Size = UDim2.new(1, 0, 0.12, 0)
listeningLabel.Font = Enum.Font.MontserratBold
listeningLabel.Text = "Listening for event..."
listeningLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
listeningLabel.LayoutOrder = 0

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = list
listLayout.Padding = UDim.new(0, 8)
listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

local padding = Instance.new("UIPadding")
padding.Parent = list
padding.PaddingTop = UDim.new(0, 2)

local template = textButtonTemplate:Clone()
template.Name = "template"
template.Parent = list
template.Size = UDim2.new(0.958, 0, 0.239, 0)
template.BackgroundTransparency = 0.3
template.BackgroundColor3 = Color3.fromRGB(0,0,0)
template.AutoButtonColor = false
template.Active = false
template.Visible = false

local aspectRatio = Instance.new("UIAspectRatioConstraint")
aspectRatio.Parent = template
aspectRatio.AspectRatio = 7.857

local templateCorner = uiCornerTemplate:Clone()
templateCorner.Parent = template
templateCorner.Name = "templateCorner"
templateCorner.CornerRadius = UDim.new(0, 8)

local templateStroke = effectedStroke:Clone()
templateStroke.Parent = template
templateStroke.Name = "templateStroke"
templateStroke.Thickness = 0.02
templateStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local productIdText = textLabelTemplate:Clone()
productIdText.Name = "productIdText"
productIdText.Parent = template
productIdText.Font = Enum.Font.MontserratBold
productIdText.Size = UDim2.new(0.756, 0, 0.3, 0)
productIdText.Position = UDim2.new(0.122, 0, 0.216, 0)
productIdText.TextColor3 = Color3.fromRGB(255, 255, 255)
productIdText.TextXAlignment = Enum.TextXAlignment.Left

local productNameText = productIdText:Clone()
productNameText.Name = "productNameText"
productNameText.Parent = template
productNameText.Position = UDim2.new(0.122, 0, 0.53, 0)
productNameText.Size = UDim2.new(0.756, 0, 0.229, 0)
productNameText.Font = Enum.Font.Montserrat

local productIcon = imageLabelTemplate:Clone()
productIcon.Name = "productIcon"
productIcon.Parent = template
productIcon.Size = UDim2.new(0.109, 0, 0.857, 0)
productIcon.Position = UDim2.new(0.011, 0, 0.057, 0)
productIcon.Image = "rbxassetid://158293316"
productIcon.ScaleType = Enum.ScaleType.Fit

local runButton = effectedTextButton:Clone()
runButton.Name = "runButton"
runButton.Parent = template
runButton.UIStroke.Thickness = 0.03
runButton.Size = UDim2.new(0.135, 0, 0.514, 0)
runButton.Position = UDim2.new(0.915, 0, 0.492, 0)
runButton.ZIndex = 4
runButton.AnchorPoint = Vector2.new(0.5, 0.5)

local runButtonCorner = uiCornerTemplate:Clone()
runButtonCorner.Parent = runButton
runButtonCorner.CornerRadius = UDim.new(0, 8)

local runText = productIdText:Clone()
runText.Name = "runText"
runText.Parent = runButton
runText.AnchorPoint = Vector2.new(0.5, 0.5)
runText.Position = UDim2.new(0.5, 0, 0.5, 0)
runText.Size = UDim2.new(1, 0, 0.5, 0)
runText.Text = "Run"
runText.Font = Enum.Font.MontserratBold
runText.TextXAlignment = Enum.TextXAlignment.Center
runText.ZIndex = 5

local autoButton = runButton:Clone()
autoButton.Name = "autoButton"
autoButton.Parent = template
autoButton.Position = UDim2.new(0.765, 0, 0.492, 0)
autoButton.runText.Text = "Auto"

local copyButton = runButton:Clone()
copyButton.Name = "copyButton"
copyButton.Parent = template
copyButton.Position = UDim2.new(0.615, 0, 0.492, 0)
copyButton.runText.Text = "Copy"

local function createRipple(target, x, y)
    local ripple = Instance.new("Frame")
    ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ripple.BackgroundTransparency = 0.5
    ripple.BorderSizePixel = 0
    ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    ripple.ZIndex = 10
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = ripple
    
    local absolutePos = target.AbsolutePosition
    ripple.Position = UDim2.new(0, x - absolutePos.X, 0, y - absolutePos.Y)
    ripple.Parent = target
    
    local targetSize = math.max(target.AbsoluteSize.X, target.AbsoluteSize.Y) * 0.7
    ripple.Size = UDim2.new(0, 0, 0, 0)
    
    local tween = tweenService:Create(ripple, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, targetSize, 0, targetSize),
        BackgroundTransparency = 1
    })
    
    tween:Play()
    tween.Completed:Connect(function()
        ripple:Destroy()
    end)
end

local dragging = false
local dragStart, startPos

container.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        createRipple(container, input.Position.X, input.Position.Y)
        dragging = true
        dragStart = input.Position
        startPos = container.Position
    end
end)

userInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        container.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

runService.RenderStepped:Connect(function()
    local rotation = (tick() * 100) % 360
    for _, desc in pairs(roosyHub:GetDescendants()) do
        if desc:IsA("UIGradient") and desc.Parent:IsA("UIStroke") then
            desc.Rotation = rotation
        end
    end
end)

local isUIOpen = false
local isAnimating = false

local function toggleUI()
    if isAnimating then return end
    isAnimating = true

    if isUIOpen then
        local tween = tweenService:Create(container, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = UDim2.new(0.5, 0, 1.5, 0)})
        tween:Play()
        tween.Completed:Wait()
        roosyHub.Enabled = false
        isUIOpen = false
    else
        roosyHub.Enabled = true
        local tween = tweenService:Create(container, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.5, 0)})
        tween:Play()
        tween.Completed:Wait()
        isUIOpen = true
    end

    isAnimating = false
end

close.MouseButton1Click:Connect(function()
    if isUIOpen then toggleUI() end
end)

userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.RightShift then
        toggleUI()
    end
end)

local eventCount = 0
local suppressCounter = 0
local autoSpeed = 100
local activeAutoButtons = {}
local activeSpamButtons = {}
local entries = {}

local function stopAllAutoAndSpam()
    for btn, data in pairs(activeAutoButtons) do
        data.active = false
        if data.loop then task.cancel(data.loop) end
    end
    table.clear(activeAutoButtons)
    
    for btn, data in pairs(activeSpamButtons) do
        data.active = false
        if data.loop then task.cancel(data.loop) end
    end
    table.clear(activeSpamButtons)
end

clear.MouseButton1Click:Connect(function()
    stopAllAutoAndSpam()
    
    local tempEntries = entries
    entries = {}
    
    for _, e in ipairs(tempEntries) do
        e:Destroy()
    end
    
    eventCount = 0
    if listeningLabel then
        listeningLabel.Visible = true
    end
end)

local function fireFakeSignal(signalType, id)
    suppressCounter = suppressCounter + 1
    if signalType == "Product" then
        marketplaceService:SignalPromptProductPurchaseFinished(player.UserId, id, true)
    elseif signalType == "Gamepass" then
        marketplaceService:SignalPromptGamePassPurchaseFinished(player, id, true)
    elseif signalType == "Bulk" then
        marketplaceService:SignalPromptBulkPurchaseFinished(player.UserId, id, true)
    elseif signalType == "Purchase" then
        marketplaceService:SignalPromptPurchaseFinished(player.UserId, id, true)
    end
    suppressCounter = suppressCounter - 1
end

local function addLog(label, id, signalType)
    if suppressCounter > 0 then return end
    
    if list:FindFirstChild("Entry_" .. id) then 
        return
    end
    
    if listeningLabel then
        listeningLabel.Visible = false
    end

    eventCount = eventCount + 1
    local entry = template:Clone()
    entry.Name = "Entry_" .. id
    entry.productIdText.Text = "Product ID: " .. tostring(id)
    entry.productNameText.Text = "Name: Yükleniyor..."
    entry.LayoutOrder = -eventCount
    entry.Visible = true
    entry.Parent = list

    table.insert(entries, entry)

    task.spawn(function()
        local infoType = Enum.InfoType.Asset
        if signalType == "Product" then
            infoType = Enum.InfoType.Product
        elseif signalType == "Gamepass" then
            infoType = Enum.InfoType.GamePass
        end

        local success, productInfo = pcall(function()
            return marketplaceService:GetProductInfo(id, infoType)
        end)

        if success and productInfo then
            entry.productNameText.Text = "Name: " .. (productInfo.Name or "Bilinmiyor")
            if productInfo.IconImageAssetId and productInfo.IconImageAssetId > 0 then
                entry.productIcon.Image = "rbxassetid://" .. productInfo.IconImageAssetId
            else
                entry.productIcon.Image = "rbxassetid://158293316"
            end
        else
            entry.productNameText.Text = "Name: Bulunamadı (" .. label .. ")"
            entry.productIcon.Image = "rbxassetid://158293316"
        end
    end)

    local runBtn = entry.runButton
    local autoBtn = entry.autoButton
    local copyBtn = entry.copyButton

    copyBtn.MouseButton1Click:Connect(function()
        setclipboard(tostring(id))
        copyBtn.runText.Text = "Copied!"
        task.wait(1.5)
        if copyBtn and copyBtn.Parent then
            copyBtn.runText.Text = "Copy"
        end
    end)

    local autoActive = false
    local autoLoop
    autoBtn.MouseButton1Click:Connect(function()
        if autoActive then
            autoActive = false
            if autoLoop then task.cancel(autoLoop) end
            activeAutoButtons[autoBtn] = nil
            autoBtn.runText.Text = "Auto"
        else
            autoActive = true
            autoBtn.runText.Text = "Stop"
            autoLoop = task.spawn(function()
                local delay = autoSpeed > 0 and (1 / autoSpeed) or 0.01
                while autoActive and autoBtn.Parent do
                    fireFakeSignal(signalType, id)
                    task.wait(delay)
                end
            end)
            activeAutoButtons[autoBtn] = {active = true, loop = autoLoop}
        end
    end)

    local holdStart = nil
    local holdConnection = nil
    local spamLoop = nil
    local isSpamming = false

    local function startSpam()
        if isSpamming then return end
        isSpamming = true
        runBtn.runText.Text = "Spam..."
        spamLoop = task.spawn(function()
            while isSpamming and runBtn.Parent do
                fireFakeSignal(signalType, id)
                task.wait(0.1)
            end
        end)
        activeSpamButtons[runBtn] = {active = true, loop = spamLoop}
    end

    local function stopSpam()
        isSpamming = false
        if spamLoop then task.cancel(spamLoop) end
        activeSpamButtons[runBtn] = nil
        if runBtn and runBtn.Parent then
            runBtn.runText.Text = "Run"
        end
    end

    runBtn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            if isSpamming then return end
            holdStart = tick()
            holdConnection = task.spawn(function()
                while holdStart and (tick() - holdStart) < 3 do
                    task.wait(0.1)
                end
                if holdStart and not isSpamming then
                    startSpam()
                end
            end)
        end
    end)

    runBtn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            local heldDuration = holdStart and (tick() - holdStart) or 0
            holdStart = nil
            if holdConnection then task.cancel(holdConnection) end
            if isSpamming then
                stopSpam()
            elseif heldDuration < 3 then
                fireFakeSignal(signalType, id)
                runBtn.runText.Text = "Sent!"
                task.wait(1.5)
                if runBtn and runBtn.Parent then
                    runBtn.runText.Text = "Run"
                end
            end
        end
    end)

    entry.AncestryChanged:Connect(function()
        if not entry.Parent then
            autoActive = false
            isSpamming = false
            if autoLoop then task.cancel(autoLoop) end
            if spamLoop then task.cancel(spamLoop) end
            if holdConnection then task.cancel(holdConnection) end
            
            local index = table.find(entries, entry)
            if index then
                table.remove(entries, index)
            end
        end
    end)
end

marketplaceService.PromptProductPurchaseFinished:Connect(function(plr, id, bought)
    if suppressCounter == 0 then addLog("Product", id, "Product") end
end)
marketplaceService.PromptGamePassPurchaseFinished:Connect(function(plr, id, bought)
    if suppressCounter == 0 then addLog("Gamepass", id, "Gamepass") end
end)
marketplaceService.PromptBulkPurchaseFinished:Connect(function(userId, id, bought)
    if suppressCounter == 0 then addLog("Bulk", id, "Bulk") end
end)
marketplaceService.PromptPurchaseFinished:Connect(function(userId, id, bought)
    if suppressCounter == 0 then addLog("Purchase", id, "Purchase") end
end)

task.spawn(function()
    toggleUI()
end)
