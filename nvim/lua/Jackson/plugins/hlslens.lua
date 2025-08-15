return {
	"kevinhwang91/nvim-hlslens",
	event = "VeryLazy",
	config = function()
		require("hlslens").setup()
		local kopts = { noremap = true, silent = true }

		vim.keymap.set("n", "n", function()
			local ok, lens = pcall(require, "hlslens")
			if ok then
				vim.cmd("normal! n")
				lens.start()
			end
		end, kopts)

		vim.keymap.set("n", "N", function()
			local ok, lens = pcall(require, "hlslens")
			if ok then
				vim.cmd("normal! N")
				lens.start()
			end
		end, kopts)
	end,
}
