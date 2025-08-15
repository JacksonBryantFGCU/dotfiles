return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile"},
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")

        todo_comments.setup({
            keywords = {
                FIX = {
                    icon = "🐛", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = "🗸", color = "info" },
				HACK = { icon = "🔥", color = "warning", alt = { "DON SKIP" } },
				WARN = { icon = "⚠️", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = "🕓", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = "🕕", color = "hint", alt = { "INFO", "READ", "COLORS" } },
				TEST = { icon = "🕒", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            }
        })
        -- keymaps
        vim.keymap.set("n", "]t", function()
            todo_comments.jump_next()
        end, {desc = "Next todo comment" })
        
        vim.keymap.set("n", "[t", function()
            todo_comments.jump_prev()
        end, { desc = "Previous todo comment" })
    end
}
