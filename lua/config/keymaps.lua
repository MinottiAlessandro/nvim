vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<Space>ts', [[:%s/\s\+$//e<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>o', ':vsp | enew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\'', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '"', ':vertical resize -5<CR>', { noremap = true, silent = true })

