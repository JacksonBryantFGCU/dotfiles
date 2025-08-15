return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			direction = "horizontal", -- default direction
			start_in_insert = true,
			persist_mode = true,
			insert_mappings = true,
			close_on_exit = true,
			shell = vim.o.shell,
		})

		-- Terminal helper functions
		local Terminal = require("toggleterm.terminal").Terminal

		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		local node = Terminal:new({ cmd = "node", hidden = true, direction = "float" })
		local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })

		local map = vim.keymap.set

		-- 🔑 Terminal toggles
		map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal (Horizontal)" })
		map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle Terminal (Float)" })

		-- 🔑 Program-specific terminals
		map("n", "<leader>tl", function()
			lazygit:toggle()
		end, { desc = "Toggle LazyGit" })
		map("n", "<leader>tn", function()
			node:toggle()
		end, { desc = "Toggle Node REPL" })
		map("n", "<leader>th", function()
			htop:toggle()
		end, { desc = "Toggle htop" })

		-- Optional: escape terminal mode easily
		map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
	end,
}
