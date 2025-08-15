return {
	"ggandor/leap.nvim",
	event = "VeryLazy",
	config = function()
		local leap = require("leap")
		leap.set_default_keymaps() -- includes s/S in normal/visual/operator-pending modes

		-- Optional: also map across all open windows
		require("leap.user").set_repeat_keys(";", ",")

		local map = vim.keymap.set

		-- 🔑 Custom direct keymaps (you can skip this if you're fine with just `s`)
		map("n", "<leader>l", function()
			require("leap").leap({ target_windows = { vim.api.nvim_get_current_win() } })
		end, { desc = "Leap in Current Window" })

		map("n", "<leader>L", function()
			require("leap").leap({ target_windows = require("leap.util").get_enterable_windows() })
		end, { desc = "Leap in All Windows" })
	end,
}
