return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,
	priority = 1000,
	init = function(...)
		vim.cmd("colorscheme rose-pine")
	end,
}
