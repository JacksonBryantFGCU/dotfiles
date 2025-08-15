return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")

		-- 🔧 Setup which-key behavior
		wk.setup({
			window = {
				border = "rounded",
			},
		})

		-- 🔑 Define actual keymaps
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
		map("n", "<leader>x", "<cmd>bd<CR>", opts)
		map("n", "<leader>q", "<cmd>Bdelete<CR>", opts)
		map("n", "<leader>od", ":cd ~/OneDrive/Documents<CR>", { desc = "Go to Documents" })

		-- 🧠 Register descriptions for <leader> keys
		wk.register({
			["<leader>"] = {
				e = "Toggle File Explorer",
				x = "Close Buffer",
				q = "Force Close Buffer",
			},
		})
	end,
}
