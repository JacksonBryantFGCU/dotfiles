return {
	"nacro90/numb.nvim",
	event = "CmdlineEnter",
	config = function()
		require("numb").setup({
			show_numbers = true, -- Show line numbers with preview
			enable_cursorline = true, -- Highlight the line with the cursor
			number_only = false, -- Only preview if input is a number
			centered = true, -- Center preview in the window
		})

		-- Optional demo/test keymaps for jumping
		local map = vim.keymap.set
		map("n", "<leader>j5", ":5<CR>", { desc = "Jump to line 5 (with preview)" })
		map("n", "<leader>j50", ":50<CR>", { desc = "Jump to line 50 (with preview)" })
	end,
}
