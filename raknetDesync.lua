local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local Toggled = false
local key = Enum.KeyCode.U

local function notify(title, text)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title;
            Text = text;
            Duration = 2;
        })
    end)
end

local function rakhook(packet)
    if packet.PacketId == 0x1B then
        local data = packet.AsBuffer
        buffer.writeu32(data, 1, 0xFFFFFFFF)
        packet:SetData(data)
    end
end

UIS.InputBegan:Connect(function(obj) 
    if obj.KeyCode ~= key then
        return
    end

    if Toggled then
        notify("RakNet Status", "Açık")
        raknet.remove_send_hook(rakhook)
    else
        notify("RakNet Status", "Kapalı")
        raknet.add_send_hook(rakhook)
    end

    Toggled = not Toggled
end)
