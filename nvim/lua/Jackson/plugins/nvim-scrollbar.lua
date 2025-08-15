return {
	"petertriho/nvim-scrollbar",
	event = "VeryLazy",
	config = function()
		require("scrollbar").setup({
			show = true,
			set_highlights = true,
			handle = {
				text = " ",
				color = nil,
				hide_if_all_visible = true,
			},
			marks = {
				Cursor = { text = "⎺" },
				Search = { text = { "" } }, -- Requires nerd fonts
				Error = { text = { "" }, color = "#db4b4b" },
				Warn = { text = { "" }, color = "#e0af68" },
				Info = { text = { "" }, color = "#0db9d7" },
				Hint = { text = { "" }, color = "#10B981" },
				Misc = { text = { "" } },
			},
			excluded_buftypes = { "terminal" },
			handlers = {
				diagnostic = true,
				search = true,
				gitsigns = true, -- If you use gitsigns
				handle = true,
				cursor = true,
			},
		})

		-- Optional keymaps to toggle and refresh
		local map = vim.keymap.set
		map("n", "<leader>sb", "<cmd>ScrollbarToggle<CR>", { desc = "Toggle Scrollbar" })
		map("n", "<leader>sr", "<cmd>ScrollbarRefresh<CR>", { desc = "Refresh Scrollbar" })
	end,
}
