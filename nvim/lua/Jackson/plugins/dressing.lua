return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	config = function()
		require("dressing").setup({
			input = {
				enabled = true,
				default_prompt = "Input:",
				win_options = {
					winblend = 0,
				},
				insert_only = true,
				start_in_insert = true,
				border = "rounded",
			},
			select = {
				enabled = true,
				backend = { "telescope", "builtin" }, -- prioritize Telescope if installed
				trim_prompt = true,
			},
		})

		-- 🔑 Keymaps to demo the dressing UI
		local map = vim.keymap.set
		map("n", "<leader>di", function()
			vim.ui.input({ prompt = "Enter your name:" }, function(input)
				if input then
					vim.notify("You entered: " .. input)
				end
			end)
		end, { desc = "Dressing Input Prompt" })

		map("n", "<leader>ds", function()
			vim.ui.select({ "Option 1", "Option 2", "Option 3" }, {
				prompt = "Choose an option:",
			}, function(choice)
				if choice then
					vim.notify("You selected: " .. choice)
				end
			end)
		end, { desc = "Dressing Select Prompt" })
	end,
}
