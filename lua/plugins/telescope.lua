return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {"nvim-lua/plenary.nvim"},
    keys = {
        vim.keymap.set("n", "<leader><leader>", ":Telescope live_grep<CR>"),
        vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>"),
        vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>"),
    },
}
