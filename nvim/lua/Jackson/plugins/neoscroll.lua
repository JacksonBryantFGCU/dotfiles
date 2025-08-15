return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	config = function()
		require("neoscroll").setup({
			hide_cursor = true,
			stop_eof = true,
			use_local_scrolloff = false,
			respect_scrolloff = false,
			cursor_scrolls_alone = true,
			easing_function = "quadratic", -- Can be "sine", "circular", "quadratic", etc.
			performance_mode = false,
		})

		-- Optional: map custom scrolling behavior (safe from deprecation)
		local map = vim.keymap.set
		local neoscroll = require("neoscroll")

		map("n", "<C-d>", function()
			neoscroll.scroll(vim.wo.scroll, true, 150)
		end, { desc = "Smooth Scroll Down" })
		map("n", "<C-u>", function()
			neoscroll.scroll(-vim.wo.scroll, true, 150)
		end, { desc = "Smooth Scroll Up" })
		map("n", "<C-f>", function()
			neoscroll.scroll(vim.api.nvim_win_get_height(0), true, 200)
		end, { desc = "Scroll Full Page Down" })
		map("n", "<C-b>", function()
			neoscroll.scroll(-vim.api.nvim_win_get_height(0), true, 200)
		end, { desc = "Scroll Full Page Up" })
		map("n", "<C-y>", function()
			neoscroll.scroll(-1, false, 100)
		end, { desc = "Scroll Up 1 Line" })
		map("n", "<C-e>", function()
			neoscroll.scroll(1, false, 100)
		end, { desc = "Scroll Down 1 Line" })
	end,
}
