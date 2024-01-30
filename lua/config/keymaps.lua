vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.api.nvim_set_keymap('n', '<leader>ts', [[:%s/\s\+$//e<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>o', ':vsp | enew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\'', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '"', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Pane and Window Navigation
-- vim.keymap.set("<C-h>", "<C-w>h", "n") -- Navigate Left
-- vim.keymap.set("<C-j>", "<C-w>j", "n") -- Navigate Down
-- vim.keymap.set("<C-k>", "<C-w>k", "n") -- Navigate Up
-- vim.keymap.set("<C-l>", "<C-w>l", "n") -- Navigate Right
-- vim.keymap.set("<C-h>", "wincmd h", "t") -- Navigate Left
-- vim.keymap.set("<C-j>", "wincmd j", "t") -- Navigate Down
-- vim.keymap.set("<C-k>", "wincmd k", "t") -- Navigate Up
-- vim.keymap.set("<C-l>", "wincmd l", "t") -- Navigate Right
-- vim.keymap.set("<C-h>", "TmuxNavigateLeft", "n") -- Navigate Left
-- vim.keymap.set("<C-j>", "TmuxNavigateDown", "n") -- Navigate Down
-- vim.keymap.set("<C-k>", "TmuxNavigateUp", "n") -- Navigate Up
-- vim.keymap.set("<C-l>", "TmuxNavigateRight", "n") -- Navigate Right
