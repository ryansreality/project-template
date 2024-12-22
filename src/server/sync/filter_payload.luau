local ReplicatedStorage = game:GetService("ReplicatedStorage")

local charm_sync = require(ReplicatedStorage.packages.charm_sync)
local types = require(ReplicatedStorage.shared.types)

type PlayerData = types.PlayerData
type SyncPayload = charm_sync.SyncPayload
type Result<T> = { ok: true, value: T } | { ok: false, err: string }

local function Ok<T>(value: T): Result<T>
	return { ok = true, value = value }
end

local function Err(err: string): Result<never>
	return { ok = false, err = err }
end

local function filter_payload(player: Player, payload: SyncPayload): Result<SyncPayload>
	local user_id = player.UserId

	local players = payload.data.players :: { PlayerData }

	if not players or not players[user_id] then
		return Err("all data irrelevant")
	end

	local new_payload = table.clone(payload)
	new_payload.data = table.clone(new_payload.data)
	if players then
		new_payload.data.players = {
			[user_id] = players[user_id],
		}
	end

	return Ok(new_payload)
end

return filter_payload
