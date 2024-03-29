local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Remotes: Folder = ReplicatedStorage.Remotes
local PlayerData = require(ServerScriptService.Server.PlayerData.Manager)

local Cooldown = {}

local CLICK_COOLDOWN = 0.5

local function Click(player: Player)
  if table.find(Cooldown, player) then return end

  table.insert(Cooldown, player)
  task.delay(CLICK_COOLDOWN, function()
    local foundPlayer = table.find(Cooldown, player)

    if foundPlayer then
      table.remove(Cooldown, foundPlayer)
    end
  end)

  PlayerData.AdjustClicks(player, 1)
end

Remotes.Click.OnServerEvent:Connect(Click)