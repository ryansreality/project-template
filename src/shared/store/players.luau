local ReplicatedStorage = game:GetService("ReplicatedStorage")

local charm = require(ReplicatedStorage.packages.charm)
local types = require(ReplicatedStorage.shared.types)

type PlayerData = types.PlayerData
local atom = charm.atom

local players = atom({} :: { PlayerData })

local function get_player_data(user_id: number): PlayerData
	return players()[user_id]
end

local function set_player_data(user_id: number, data: PlayerData)
	local new_players = table.clone(players())
	new_players[user_id] = data
	players(new_players)
end

local function delete_player_data(user_id: number)
	local new_players = table.clone(players())
	new_players[user_id] = nil
	players(new_players)
end

return {
	atom = players,

	get_player_data = get_player_data,
	set_player_data = set_player_data,
	delete_player_data = delete_player_data,
}
