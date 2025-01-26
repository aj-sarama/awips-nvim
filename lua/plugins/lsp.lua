local lsp = {
	"neovim/nvim-lspconfig",
	dependencies = { 'saghen/blink.cmp' },
	lazy = false,
	config = function(...)
		-- java configured through nvim-jdtls
		local capabilities = require('blink.cmp').get_lsp_capabilities()
		require('lspconfig').lua_ls.setup({ capabilities = capabilities })

		vim.diagnostic.config({
			virtual_text = false,
		})

		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "goto definition" })
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "format" })
		vim.keymap.set("n", "<leader>cim", vim.lsp.buf.implementation, { desc = "show implementations" })
		vim.keymap.set("n", "<leader>co", vim.lsp.buf.outgoing_calls, { desc = "outgoing calls" })
		vim.keymap.set("n", "<leader>cin", vim.lsp.buf.incoming_calls, { desc = "incoming calls" })
		vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "references" })
	end,

}

local trouble = {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / references / ... (Trouble)",
		},
		{
			"<leader>xL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}

local hover = {
	"Fildo7525/pretty_hover",
	event = "LspAttach",
	config = function()
		require("pretty_hover").setup({
			border = "solid",
		})

		vim.keymap.set("n", "<leader>m", require("pretty_hover").hover, { noremap = true })
	end,
}

return { lsp, trouble, hover }
