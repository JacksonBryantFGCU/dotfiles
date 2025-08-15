return {
	"andymass/vim-matchup",
	event = "VeryLazy",
	init = function()
		-- Enable matchup for Tree-sitter-aware filetypes
		vim.g.matchup_matchparen_offscreen = { method = "popup" } -- Shows popup when match is offscreen
		vim.g.matchup_matchparen_enabled = 1
		vim.g.matchup_override_vimtex = 1
		vim.g.matchup_surround_enabled = 1
		vim.g.matchup_transmute_enabled = 1
		vim.g.matchup_delim_noskips = 1
		vim.g.matchup_delim_start_plaintext = 1
	end,
	config = function()
		-- Optional performance tweaks
		vim.cmd([[ let g:matchup_matchparen_deferred = 1 ]])
		vim.cmd([[ let g:matchup_matchparen_hi_surround_always = 1 ]])
	end,
}
