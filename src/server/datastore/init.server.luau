local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lapis = require(ReplicatedStorage.packages.lapis)
local default_data = require(script.default_data)

local collection = lapis.createCollection("player-data", {
	defaultData = default_data,
})

local function on_player_added(player: Player)

end

local function on_player_removing(player: Player)
	
end

for _, player in Players:GetPlayers() do
	task.spawn(on_player_added, player)
end
Players.PlayerAdded:Connect(on_player_added)
Players.PlayerRemoving:Connect(on_player_removing)
