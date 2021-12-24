local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Jailbreak", "Serpent")

local MainTab = Window:NewTab("Main")

local MainSection = MainTab:NewSection("Main")

MainSection:NewButton("Drop Esp", "gives you drop esp!", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Jailbreak/main/Drop-Esp.lua", true))()
end)

game:GetService("UserInputService").InputBegan:Connect(function(i, typing)
    if typing then return end
    if i.KeyCode == Enum.KeyCode.Q then
        for i,v in next, getgc(true) do
            if type(v) == "table" and rawget(v, "Nitro") then
                v.Nitro = math.huge
                v.NitroLastMax = math.huge
            end
        end
    end
end)
