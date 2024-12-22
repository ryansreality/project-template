local ReplicatedStorage = game:GetService("ReplicatedStorage")

local charm_sync = require(ReplicatedStorage.packages.charm_sync)
local remo = require(ReplicatedStorage.packages.remo)
local remote = remo.remote
local namespace = remo.namespace

type SyncPayload = charm_sync.SyncPayload

type to_server<A...> = remo.ClientToServer<A...>
type to_client<A...> = remo.ServerToClient<A...>

type Remotes = remo.Remotes<{
	store: {
		sync: to_client<SyncPayload>,
		init: to_server<>,
	},
}>

local remotes: Remotes = remo.createRemotes {
	store = namespace {
		sync = remote(),
		init = remote(),
	},
}

return remotes
