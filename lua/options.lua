if vim.g.loaded_opt == nil then
	vim.g.loaded_opt = true

	vim.opt.autoread = true
	vim.opt.clipboard = "unnamedplus"
	vim.opt.colorcolumn = "100"
	vim.opt.ignorecase = true
	vim.opt.smartcase = true
	vim.opt.matchpairs = "(:),{:},[:],<:>"
	vim.opt.mouse = ""
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.shiftwidth = 4
	vim.opt.softtabstop = 4
	vim.opt.expandtab = false
	vim.opt.guicursor = "" -- block for all modes
	vim.opt.tabstop = 4
	vim.opt.wrap = false
	vim.opt.scrolloff = 4
	vim.opt.list = true
	vim.opt.listchars = {
		trail = "·",
		tab = "> ",
	}
end
