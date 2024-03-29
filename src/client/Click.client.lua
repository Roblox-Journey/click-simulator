local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes: Folder = ReplicatedStorage.Remotes


UserInputService.InputBegan:Connect(function(input, processed)
  if processed then return end
  if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch
    or input.KeyCode == Enum.KeyCode.ButtonR2 then
      Remotes.Click:FireServer()
  end
end)