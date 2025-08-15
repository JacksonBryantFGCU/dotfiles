return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "andrew-george/telescope-themes",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function() return vim.fn.executable("make") == 1 end,
        },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        -- choose a working find command based on what exists
        local find_cmd
        if vim.fn.executable("fd") == 1 then
            find_cmd = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix", "--exclude", ".git" }
        elseif vim.fn.executable("fdfind") == 1 then
            find_cmd = { "fdfind", "--type", "f", "--hidden", "--strip-cwd-prefix", "--exclude", ".git" }
        else
            -- ripgrep fallback
            find_cmd = { "rg", "--files", "--hidden", "--glob", "!.git/*" }
        end

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                    },
                },
            },
            pickers = {
                find_files = {
                    find_command = find_cmd,
                    follow = true, -- follow symlinks
                    hidden = true, -- still ignore .git via exclude/glob above
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                themes = {
                    enable_previewer = true,
                    enable_live_previewer = true,
                    persist = {
                        enabled = true,
                        path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
                    },
                },
            },
        })

        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "themes")

        -- keymaps
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files (Telescope)" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (Telescope)" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers (Telescope)" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags (Telescope)" })
        vim.keymap.set("n", "<leader>pWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "Find Connected Words under cursor " })
        vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>",
            { noremap = true, silent = true, desc = "Theme Switcher" })
    end,
}
