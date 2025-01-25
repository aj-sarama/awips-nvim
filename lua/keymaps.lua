vim.g.mapleader = " "

-- Clipboard utilities
-- TODO: settings for these keymaps?
vim.api.nvim_set_keymap("v", "<leader>y", "\"+y", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>p", "\"+p", { noremap = true })

-- Split utilities
---Map <leader>key to :wincmd <key>
---@param key string Key to map
local function create_split_movement_map(key)
	vim.api.nvim_set_keymap("n", "<leader>" .. key, "", {
		desc = "Custom split motion",
		callback = function()
			vim.cmd("wincmd " .. key)
		end,
		noremap = true,
	})
end
create_split_movement_map("h")
create_split_movement_map("j")
create_split_movement_map("k")
create_split_movement_map("l")

-- Jumplist utilities
vim.api.nvim_set_keymap("n", "<leader>o", "<C-o>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>i", "<C-i>", { noremap = true })

-- Screen centering
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
