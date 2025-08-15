return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        -- local lazy_status = require("lazy.status") -- We no longer need this dependency

        -- A more minimal and unified color palette.
        -- Feel free to adjust these colors to match your overall Neovim theme.
        local colors = {
            black = "#1e222a",  -- A dark background color
            gray = "#4b5263",   -- A subtle gray for inactive text
            blue = "#82aaff",   -- A vibrant color for active components
            purple = "#c792ea", -- A secondary vibrant color for visual mode
            red = "#ff6289",    -- A color for errors or modified files
            green = "#c3e88d",  -- A color for added files
        }

        local my_lualine_theme = {
            -- A simplified theme. We'll use the same background color for all sections
            -- to make the statusline feel like one continuous bar.
            -- The 'a' section is for the active mode, and 'b' and 'c' for the rest.
            normal = {
                a = { fg = colors.black, bg = colors.blue, gui = "bold" },
                b = { fg = colors.gray, bg = colors.black },
                c = { fg = colors.blue, bg = colors.black },
            },
            inactive = {
                a = { fg = colors.gray, bg = colors.black, gui = "bold" },
                b = { fg = colors.gray, bg = colors.black },
                c = { fg = colors.gray, bg = colors.black },
            },
            insert = {
                a = { fg = colors.black, bg = colors.green, gui = "bold" },
                b = { fg = colors.gray, bg = colors.black },
                c = { fg = colors.green, bg = colors.black },
            },
            visual = {
                a = { fg = colors.black, bg = colors.purple, gui = "bold" },
                b = { fg = colors.gray, bg = colors.black },
                c = { fg = colors.purple, bg = colors.black },
            },
            replace = {
                a = { fg = colors.black, bg = colors.red, gui = "bold" },
                b = { fg = colors.gray, bg = colors.black },
                c = { fg = colors.red, bg = colors.black },
            },
        }

        local mode = { "mode" }

        local branch = { "branch" }

        -- We'll combine the diff and filename into a single component for lualine_c
        -- to clean it up even more.
        local filename_with_diff = {
            "filename",
            file_status = true,
            path = 0,
        }

        -- A simpler diff component with better colors
        local diff = {
            "diff",
            colored = true,
            symbols = { added = "+", modified = "~", removed = "-" },
            -- You can also set a different color for each diff type here
            -- color = { added = { fg = colors.green }, modified = { fg = colors.blue }, removed = { fg = colors.red } }
        }

        -- This function is a good way to show line/col information in a compact way
        local function line_column()
            local line = vim.fn.line(".")
            local col = vim.fn.col(".")
            return string.format("L:%d C:%d", line, col)
        end

        lualine.setup({
            options = {
                theme = my_lualine_theme,
                -- Use empty separators for a cleaner, unified look.
                -- This will make it look like a single continuous bar.
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                -- Section 'a' will be the mode indicator
                lualine_a = { mode },
                -- Section 'b' will be the Git branch
                lualine_b = { branch },
                -- Section 'c' will contain the filename and diff
                lualine_c = { filename_with_diff, diff },
                -- We are getting rid of lualine_x completely to remove the clutter.
                lualine_x = {},
                -- Section 'y' and 'z' can hold other information
                lualine_y = { line_column },
                lualine_z = { "progress" },
            },
            inactive_sections = {
                -- Customize the inactive sections for a consistent look
                lualine_a = {},
                lualine_b = { "filename" },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "progress" },
            },
        })
    end,
}
