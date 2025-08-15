return {
	"mrjones2014/smart-splits.nvim",
	event = "VeryLazy",
	config = function()
		require("smart-splits").setup({
			ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
			ignored_buftypes = { "nofile" },
			default_amount = 3, -- amount to resize by default
			at_edge = "wrap", -- or "stop"
			move_cursor_same_row = false,
			resize_mode = {
				silent = true,
				hooks = {
					on_enter = nil,
					on_leave = nil,
				},
			},
		})

		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- 🔀 Moving between splits
		map("n", "<C-h>", require("smart-splits").move_cursor_left, opts)
		map("n", "<C-j>", require("smart-splits").move_cursor_down, opts)
		map("n", "<C-k>", require("smart-splits").move_cursor_up, opts)
		map("n", "<C-l>", require("smart-splits").move_cursor_right, opts)

		-- ⬌ Resizing splits
		map("n", "<A-h>", require("smart-splits").resize_left, opts)
		map("n", "<A-j>", require("smart-splits").resize_down, opts)
		map("n", "<A-k>", require("smart-splits").resize_up, opts)
		map("n", "<A-l>", require("smart-splits").resize_right, opts)

		-- 🔁 Swap buffers in direction
		map("n", "<leader>sh", require("smart-splits").swap_buf_left, { desc = "Swap buffer left" })
		map("n", "<leader>sj", require("smart-splits").swap_buf_down, { desc = "Swap buffer down" })
		map("n", "<leader>sk", require("smart-splits").swap_buf_up, { desc = "Swap buffer up" })
		map("n", "<leader>sl", require("smart-splits").swap_buf_right, { desc = "Swap buffer right" })
	end,
}
