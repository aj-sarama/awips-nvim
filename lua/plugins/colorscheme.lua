local onedark = {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	opts = { style = 'warmer' },
	init = function(...)
		require('onedark').load()
	end,
}

local kanagawa = {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	init = function()
		vim.cmd("colorscheme kanagawa")
	end,
}

local gruvbox = {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		vim.opt.background = "dark"
		vim.cmd("colorscheme gruvbox")
	end,
}

return { gruvbox }
