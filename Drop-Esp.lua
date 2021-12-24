local camera = workspace.CurrentCamera

local function DrawDrop(drop)
    local DropText = Drawing.new("Text")
    DropText.Visible = false
    DropText.Center = true
    DropText.Outline = true
    DropText.Font = 2
    DropText.Size = 13
    DropText.Color = Color3.new(0.066666, 0, 1)
    DropText.Text = "Drop"

    local function updater()
        local c
        c = game:GetService("RunService").RenderStepped:Connect(function()
            if drop and workspace:FindFirstChild(drop.Name) and drop:FindFirstChild("Briefcase") then
                local dropvector, onscreen = camera:WorldToViewportPoint(drop.Briefcase.Position)
                if onscreen then
                    DropText.Position = Vector2.new(dropvector.X, dropvector.Y)
                    DropText.Visible = true
                else
                    DropText.Visible = false
                end
            else
                if game:GetService("Workspace"):FindFirstChild(drop.Name) == nil then
                    c:Disconnect()
                end
                DropText.Visible = false
            end
        end)
    end
    coroutine.wrap(updater)()
end

for i,drop in pairs(workspace:GetChildren()) do
    if drop.Name == "Drop" then
        if drop:FindFirstChild("Briefcase") then
            coroutine.wrap(DrawDrop)(drop)
        end
    end
end

workspace.ChildAdded:Connect(function(drop)
    if drop.Name == "Drop" then
        if drop:FindFirstChild("Briefcase") then
            coroutine.wrap(DrawDrop)(drop)
        end
    end
end)
