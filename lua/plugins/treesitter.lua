local ensure_installed = {
	"c",
	"lua",
	"vim",
	"vimdoc",
	"query",
	"make",
	"java",
	"gitcommit",
	"gitignore",
	"git_config",
	"git_rebase",
	"bash",
	"diff",
	"markdown",
	"markdown_inline",
	"json",
	"yaml",
	"toml",
}

local parser_path = vim.fn.stdpath("config") .. "/treesitter-parsers"
vim.opt.rtp:prepend(parser_path)

return {
	"nvim-treesitter/nvim-treesitter",
	init = function(...)
		---@diagnostic disable-next-line
		require('nvim-treesitter.configs').setup({
			ensure_installed = ensure_installed,
			sync_install = true,

			parser_install_dir = parser_path,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},

			indent = {
				enable = true,
			},

			incremental_selection = {
				enable = false
			},
		})

		vim.cmd("TSUpdateSync")
	end,
}
