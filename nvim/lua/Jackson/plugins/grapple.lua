return {
	"cbochs/grapple.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = { "Grapple", "GrappleToggle" },
	keys = {
		{ "<leader>ma", "<cmd>Grapple tag<CR>", desc = "Tag current file" },
		{ "<leader>mr", "<cmd>Grapple untag<CR>", desc = "Untag current file" },
		{ "<leader>ml", "<cmd>Grapple toggle_tags<CR>", desc = "List all tags" },
		{ "<leader>mn", "<cmd>Grapple cycle forward<CR>", desc = "Next tag" },
		{ "<leader>mp", "<cmd>Grapple cycle backward<CR>", desc = "Previous tag" },
		{ "<leader>ms", "<cmd>Grapple toggle_scopes<CR>", desc = "Toggle project scopes" },
	},
	config = function()
		require("grapple").setup({
			scope = "git_branch", -- separate tags by Git branch
			icons = true,
			cache_path = vim.fn.stdpath("data") .. "/grapple",
		})
	end,
}
