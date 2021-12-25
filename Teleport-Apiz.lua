function teleport(cframe)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Parent = nil
    for i,v in pairs(getnilinstances()) do
        if v.Name == "HumanoidRootPart" then
            v.CFrame = CFrame.new(cframe)
            v.Parent = game.Players.LocalPlayer.Character
        end
    end
end
