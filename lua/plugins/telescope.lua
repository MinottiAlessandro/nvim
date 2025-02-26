local config = function()
    local telescope = require("telescope")
    telescope.setup({
        pickers = {
            find_files = {
            },
            live_grep = {
                theme = "dropdown",
                previewer = false,
            },
            buffers = {
                theme = "dropdown",
                previewer = false,
            },
        }
    })
end

return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {"nvim-lua/plenary.nvim"},
    config = config,
    keys = {
        vim.keymap.set("n", "<leader><leader>", ":Telescope live_grep<CR>", {desc = "Search text globally"}),
        vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", {desc = "Find file"}),
        vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", {desc = "Find buffer"}),
        vim.keymap.set('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Search Keymaps' }),
    },
}
