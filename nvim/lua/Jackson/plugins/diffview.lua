return {
	"sindrets/diffview.nvim",
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewFileHistory",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("diffview").setup({
			enhanced_diff_hl = true, -- better highlighting
			use_icons = true,
			view = {
				default = {
					layout = "diff2_horizontal", -- or diff2_vertical, diff3_horizontal, etc.
				},
			},
			file_panel = {
				win_config = {
					position = "left",
					width = 35,
				},
			},
		})

		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- 🔑 Keymaps
		map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Open Diff View" })
		map("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { desc = "Close Diff View" })
		map("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "File History (All)" })
		map("n", "<leader>gH", "<cmd>DiffviewFileHistory %<CR>", { desc = "File History (Current File)" })
		map("n", "<leader>gf", "<cmd>DiffviewToggleFiles<CR>", { desc = "Toggle File Panel" })
		map("n", "<leader>gf", "<cmd>DiffviewFocusFiles<CR>", { desc = "Focus File Panel" })
	end,
}
