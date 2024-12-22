local ReplicatedStorage = game:GetService("ReplicatedStorage")

local vide = require(ReplicatedStorage.packages.vide)
local create = vide.create

export type s<T> = T | () -> T
export type props = {
	reset_on_spawn: s<boolean>?,
	enabled: s<boolean>?,
	ignore_gui_inset: s<boolean>?,
	order: s<number>?,

	-- instances
	[number]: any,
}

local function layer(props: props)
	local enabled = if props.enabled then props.enabled else true

	return create "ScreenGui" {
		Enabled = enabled,
		IgnoreGuiInset = props.ignore_gui_inset or false,
		ResetOnSpawn = props.reset_on_spawn or false,
		DisplayOrder = props.order,
		
		table.unpack(props),
	}
end

return layer
