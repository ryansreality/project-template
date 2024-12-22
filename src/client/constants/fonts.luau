type FontData = {
	regular: Font,
	medium: Font,
	bold: Font,
}

local function font(id: number): FontData
	return {
		regular = Font.fromId(id, Enum.FontWeight.Regular),
		medium = Font.fromId(id, Enum.FontWeight.Medium),
		bold = Font.fromId(id, Enum.FontWeight.Bold),
	}
end

local fonts = {
	inter = font(12187365364),
}

return fonts
