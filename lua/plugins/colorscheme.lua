return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	opts = { style = 'warmer' },
	init = function(...)
		require('onedark').load()
	end,
}
