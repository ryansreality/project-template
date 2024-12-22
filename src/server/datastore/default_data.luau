local ReplicatedStorage = game:GetService("ReplicatedStorage")

local types = require(ReplicatedStorage.shared.types)
type PlayerData = types.PlayerData

local default_data: PlayerData = {
	coins = 0,
}

return default_data
