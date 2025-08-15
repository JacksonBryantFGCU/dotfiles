return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	event = "VeryLazy",
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false, -- We'll use it with Comment.nvim manually
		})

		-- Patch into Comment.nvim
		local comment_ok, comment = pcall(require, "Comment")
		if comment_ok then
			comment.setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end
	end,
}
