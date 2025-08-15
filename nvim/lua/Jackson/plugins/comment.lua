return {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
	config = function()
		require("Comment").setup({
			padding = true,
			sticky = true,
			ignore = nil, -- ignore empty lines
			toggler = {
				line = "gcc", -- Line comment
				block = "gbc", -- Block comment
			},
			opleader = {
				line = "gc", -- gc + motion (e.g. gc$, gc3j)
				block = "gb", -- gb + motion
			},
			extra = {
				above = "gcO", -- Add comment on line above
				below = "gco", -- Add comment on line below
				eol = "gcA", -- Add comment at end of line
			},
			mappings = {
				basic = true,
				extra = true,
				extended = false,
			},
			pre_hook = nil,
			post_hook = nil,
		})

		-- Optional keymaps using vim.keymap.set for clarity
		local map = vim.keymap.set
		map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle Line Comment" })
		map("v", "<leader>/", "gc", { remap = true, desc = "Toggle Block Comment" })
	end,
}
