-- from https://github.com/littensy/charm-example/blob/main/src/client/composables/use-px.ts

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.packages.vide)

local cleanup = vide.cleanup
local root = vide.root
local source = vide.source

local BASE_RESOLUTION = Vector2.new(1280, 832)
local MIN_SCALE = 0.5
local DOMINANT_AXIS = 0.5

local scale = source(1)

type px = typeof(setmetatable(
	{} :: {
		even: (value: number) -> number,
		scale: (value: number) -> number,
		floor: (value: number) -> number,
		ceil: (value: number) -> number,
	},
	{} :: {
		__call: (self: px, value: number) -> number,
	}
))

local px: px = setmetatable({
	even = function(value: number)
		return math.round(value * scale() * 0.5) * 2
	end,
	scale = function(value: number)
		return value * scale()
	end,
	floor = function(value: number)
		return math.floor(value * scale())
	end,
	ceil = function(value: number)
		return math.ceil(value * scale())
	end,
}, {
	__call = function(self: px, value: number)
		return value * scale()
	end,
})

local function use_px()
	local camera = workspace.CurrentCamera

	local function update_scale()
		local width = math.log(camera.ViewportSize.X / BASE_RESOLUTION.X, 2)
		local height = math.log(camera.ViewportSize.Y / BASE_RESOLUTION.Y, 2)
		local centered = width + (height - width) * DOMINANT_AXIS

		scale(math.max(2 ^ centered, MIN_SCALE))
	end

	local connection = camera:GetPropertyChangedSignal("ViewportSize"):Connect(update_scale)
	cleanup(connection)
	update_scale()
end

root(use_px)
return px
