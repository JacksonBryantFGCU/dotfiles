return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"whoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		"folke/neodev.nvim",
	},
	config = function()
		require("neodev").setup()

		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilties = cmp_nvim_lsp.default_capabilities()

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "🡪 ",
					package_uninstalled = "x",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"html",
				"cssls",
				"tailwindcss",
				"gopls",
				"emmet_ls",
				"emmet_language_server",
				"marksman",
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"pylint",
				"clangd",
				"denols",
				{ "eslint_d", version = "13.1.2" },
			},
		})

		local servers = {
			lua_ls = function()
				lspconfig.lua_ls.setup({
					capabilities = capabilties,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				})
			end,
			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup({
					capabilties = capabilties,
					filetypes = {
						"html",
						"typescriptreact",
						"javascruptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilties = capabilties,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
							workspace = {
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				})
			end,
			["emmet_language_server"] = function()
				lspconfig.emmet_language_server.setup({
					filetypes = {
						"css",
						"eruby",
						"html",
						"javascript",
						"javascruptreact",
						"less",
						"sass",
						"scss",
						"pug",
						"typescriptreact",
					},

					init_options = {
						includeLanguages = {},
						excludeLanguages = {},
						extensionPath = {},
						preferneces = {},
						showAbbreviationSuggestions = true,
						showExpandedAbbreviation = "always",
						showSuggestionsAsSnippets = false,
						syntaxProfiles = {},
						variables = {},
					},
				})
			end,
			["denols"] = function()
				lspconfig.denols.setup({
					capabilties = capabilties,
					root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
				})
			end,
			["ts_ls"] = function()
				lspconfig.ts_ls.setup({
					capabilties = capabilties,
					root_dir = function(fname)
						local util = lspconfig.util
						return not util.root_pattern("deno.json", "deno.jsonc")(fname)
							and util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git")(fname)
					end,
					single_file_support = false,
					init_options = {
						preferences = {
							includeCompletionsWithSnippetText = true,
							includeCompletionsForImportStatements = true,
						},
					},
				})
			end,
		}
	end,
}
