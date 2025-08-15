return {
    "mikavilpas/yazi.nvim",
    dependencies = {
        "akinsho/toggleterm.nvim",
        config = true,
    },
    config = function()
        require("yazi").setup({
            float = {
                border = "rounded",
                width = 0.9,
                height = 0.9,
                row = 0.05,
                col = 0.05,
            },
        })
    end,
    keys = {
        { "<leader>ya", "<cmd>Yazi<CR>", desc = "Open Yazi" },
    },
    cmd = { "Yazi" }, -- 🔥 ensures lazy loads on :Yazi
}
