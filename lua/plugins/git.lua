local diffview = {
	"sindrets/diffview.nvim",
	lazy = false,
}

local blame = {
	"f-person/git-blame.nvim",
	lazy = false,
	opts = {
		enabled = false,
	},
}

return { diffview, blame }
