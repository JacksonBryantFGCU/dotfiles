return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	config = function()
		require("marks").setup({
			default_mappings = false, -- we’ll define our own below
			refresh_interval = 250,
			sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
			excluded_filetypes = { "gitcommit" },
			bookmark_0 = {
				sign = "⚑",
				virt_text = "Bookmark",
				annotate = false,
			},
		})

		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- 🔑 Keymaps for marks management
		map("n", "m<Space>", "<cmd>MarksListBuf<CR>", { desc = "List Marks in Buffer" })
		map("n", "m/", "<cmd>MarksListAll<CR>", { desc = "List All Marks" })
		map("n", "m-", "<cmd>MarksPrev<CR>", { desc = "Jump to Previous Mark" })
		map("n", "m=", "<cmd>MarksNext<CR>", { desc = "Jump to Next Mark" })
		map("n", "md", "<cmd>Delmarks!<CR>", { desc = "Delete All Marks in Buffer" })
	end,
}
