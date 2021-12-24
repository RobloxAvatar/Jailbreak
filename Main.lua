local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Jailbreak", "Serpent")

local MainTab = Window:NewTab("Main")

local MainSection = MainTab:NewSection("Main")

MainSection:NewButton("Drop Esp", "gives you drop esp!", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Jailbreak/main/Drop-Esp.lua", true))()
end)

MainSection:NewToggle("Inf Nitro", "gives you infinite nitro!", function(state)
    if state then
        while true do wait()
            for i,v in next, getgc(true) do
                if type(v) == "table" and rawget(v, "Nitro") then
                    v.Nitro = math.huge
                    v.NitroLastMax = math.huge
                end
            end
        end
    else
        for i,v in next, getgc(true) do
            if type(v) == "table" and rawget(v, "Nitro") then
                v.Nitro = 0
                v.NitroLastMax = 100
            end
        end
    end
end)
