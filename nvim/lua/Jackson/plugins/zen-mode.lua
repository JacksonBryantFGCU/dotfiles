return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	keys = {
		{ "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode (default)" },
		{ "<leader>zm", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode (minimal)" },
	},
	config = function()
		require("zen-mode").setup({
			window = {
				backdrop = 0.95,
				width = 80,
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
					cursorline = false,
				},
			},
			plugins = {
				options = {
					enabled = true,
					ruler = false,
					showcmd = false,
				},
				twilight = false, -- disable if you're not using it
				gitsigns = false,
				tmux = true, -- disable statusline in tmux
			},
			on_open = function()
				vim.cmd("echo '🧘 Zen Mode Activated'")
			end,
			on_close = function()
				vim.cmd("echo '👋 Zen Mode Deactivated'")
			end,
		})
	end,
}
