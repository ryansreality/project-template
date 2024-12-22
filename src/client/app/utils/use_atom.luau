local ReplicatedStorage = game:GetService("ReplicatedStorage")

local charm = require(ReplicatedStorage.packages.charm)
local vide = require(ReplicatedStorage.packages.vide)

local cleanup = vide.cleanup
local source = vide.source
local subscribe = charm.subscribe

--[=[
	Subscribes to the state of an atom and returns a Vide source.
	
	@param callback The atom or selector to subscribe to.
	@return The reactive source.
]=]
local function use_atom<State>(callback: () -> State): () -> State
	local state = source(callback())
	local unsubscribe = subscribe(callback, function(value)
		task.spawn(state, value)
	end)
	cleanup(unsubscribe)
	return state
end

return use_atom
