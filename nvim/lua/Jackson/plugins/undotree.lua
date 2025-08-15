return {
    "mbbill/undotree",
    config = function()
        vim.g.undotree_Diffcommand = ''
        vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle)
    end,
}
