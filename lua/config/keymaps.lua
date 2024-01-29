vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.api.nvim_set_keymap('n', '<leader>ts', [[:%s/\s\+$//e<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', ':vsp | enew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\'', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '"', ':vertical resize -5<CR>', { noremap = true, silent = true })

