vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.api.nvim_set_keymap('n', '<leader>o', ':vsp | enew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\'', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '"', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Git --
vim.api.nvim_set_keymap('n', '<leader>gb', ':Telescope git_branches<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gnb', ':Git branch<space>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>gg', ':Git<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', ':Telescope git_commits<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gp', ':Git push<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gr', ':Git pull<CR>', { noremap = true, silent = true })

-- tmux --
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { noremap = true, silent = true })

