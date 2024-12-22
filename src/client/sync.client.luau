local ReplicatedStorage = game:GetService("ReplicatedStorage")

local charm_sync = require(ReplicatedStorage.packages.charm_sync)
local remotes = require(ReplicatedStorage.shared.remotes)
local atoms = require(ReplicatedStorage.shared.store.atoms)

local client = charm_sync.client({
	atoms = atoms,
})

remotes.store.sync:connect(function(payload)
	client:sync(payload)
end)

remotes.store.init()
