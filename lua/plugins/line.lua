local progress = {
	'linrongbin16/lsp-progress.nvim',
	opts = {},
}

local line = {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim' },
	opts = {
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'filename' },
			lualine_c = {
				function()
					-- invoke `progress` here.
					return require('lsp-progress').progress()
				end,
			},
			lualine_x = {'diagnostics' },
			lualine_y = { 'branch' },
			lualine_z = { 'location' }
		},
	},
	init = function()
		vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			group = "lualine_augroup",
			pattern = "LspProgressStatusUpdated",
			callback = require("lualine").refresh,
		})
	end,
}


return { progress, line }
