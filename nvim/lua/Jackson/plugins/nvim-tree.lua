return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			view = {
				width = 30,
				side = "left",
				signcolumn = "yes",
			},
			renderer = {
				root_folder_label = "File Explorer", -- ✔ show label at top
				highlight_git = true,
				highlight_opened_files = "all",
				indent_markers = {
					enable = true,
				},
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
				},
			},
			filters = {
				dotfiles = false,
			},
		})

		-- Custom keymap
		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
	end,
}
