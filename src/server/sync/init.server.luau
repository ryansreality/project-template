local ReplicatedStorage = game:GetService("ReplicatedStorage")

local filter_payload = require(script.filter_payload)
local charm_sync = require(ReplicatedStorage.packages.charm_sync)
local remotes = require(ReplicatedStorage.shared.remotes)
local atoms = require(ReplicatedStorage.shared.store.atoms)

type SyncPayload = charm_sync.SyncPayload
local server = charm_sync.server({
	atoms = atoms,
})

server:connect(function(player: Player, payload: SyncPayload)
	-- filter payload to provide the client with only relevant data
	local result = filter_payload(player, payload)
	if result.ok then
		remotes.store.sync(player, result.value)
	end
end)

remotes.store.init:connect(function(player: Player)
	server:hydrate(player)
end)
