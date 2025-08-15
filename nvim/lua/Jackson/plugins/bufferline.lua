return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				show_buffer_close_icons = true,
				show_close_icon = false, -- just per-tab X, no global X
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer", -- ✔ aligns with NvimTree
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})

		-- Keymaps to cycle through buffers
		vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
		vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
		vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close Buffer" })
	end,
}
