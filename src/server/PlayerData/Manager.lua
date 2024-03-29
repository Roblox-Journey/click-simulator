local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Remotes: Folder = ReplicatedStorage.Remotes

local Manager = {}

Manager.Profiles = {}

function Manager.AdjustClicks(player: Player, amount: number)
  local profile = Manager.Profiles[player]

  if not profile then return end

  profile.Data.Clicks += amount
  player.leaderstats.Clicks.Value = profile.Data.Clicks

  Remotes.UpdateClicks:FireClient(player, profile.Data.Clicks)
end

return Manager