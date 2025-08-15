-- Add this entry to your plugin list
return {
	"shahshlok/vim-coach.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("vim-coach").setup()
	end,
	keys = {
		{ "<leader>vch", "<cmd>VimCoach<CR>", desc = "Vim Coach" },
	},
}
