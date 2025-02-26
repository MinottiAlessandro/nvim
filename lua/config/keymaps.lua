vim.keymap.set('n', '<leader>e', vim.cmd.Ex, {desc = 'Open file explorer'})
vim.keymap.set('v', '<', '<gv', {desc = 'Indent left'})
vim.keymap.set('v', '>', '>gv', {desc = 'Indent right'})
vim.api.nvim_set_keymap('n', '<leader>o', ':vsp | enew<CR>', { noremap = true, silent = true, desc = 'Split screen w new buffer' })
vim.api.nvim_set_keymap('n', '\'', ':vertical resize +5<CR>', { noremap = true, silent = true, desc = 'Enlarge the current pane' })
vim.api.nvim_set_keymap('n', '\"', ':vertical resize -5<CR>', { noremap = true, silent = true, desc = 'Reduce the current pane' })
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {desc = 'Open UndoTree'})
vim.api.nvim_set_keymap('n', '<leader>t', [[:%s/\s\+$//e<CR>:noh<CR>]], {desc = 'Trail spaces'})
vim.keymap.set('n', '<leader>l', ':Lazy<CR>', {desc = 'Open Lazy'})
vim.keymap.set('n', '<leader>m', ':Mason<CR>', {desc = 'Open Mason'})

-- tmux --
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { noremap = true, silent = true, desc = 'Navigate left' })
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { noremap = true, silent = true, desc = 'Navigate Right' })
vim.api.nvim_set_keymap('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { noremap = true, silent = true, desc = 'Navigate Down' })
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { noremap = true, silent = true, desc = 'Navigate Up' })

-- Harpoon --
local harpoon = require('harpoon')
harpoon:setup({})

vim.keymap.set('n', '<leader>a', function()
    harpoon:list():add()
end, {desc = 'Add buffer to Harpoon'})

vim.keymap.set('n', '<leader>1', function()
    harpoon:list():select(1)
end, {desc = 'Harpoon 1st buffer'})

vim.keymap.set('n', '<leader>2', function()
    harpoon:list():select(2)
end, {desc = 'Harpoon 2nd buffer'})

vim.keymap.set('n', '<leader>3', function()
    harpoon:list():select(3)
end, {desc = 'Harpoon 3rd buffer'})

vim.keymap.set('n', '<leader>4', function()
    harpoon:list():select(4)
end, {desc = 'Harpoon 4th buffer'})

vim.keymap.set('n', '<leader>d', function()
    local buffer_number = tonumber(vim.fn.input('Remove buffer n: '))
    harpoon:list():remove_at(buffer_number)
end, {desc = 'Harpoon remove {i} buffer'})

vim.keymap.set('n', '<leader>r', function()
    harpoon:list():clear()
end, {desc = 'Remove all from Harpoon'})

-- basic telescope configuration
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require('telescope.pickers').new({}, {
        prompt_title = 'Harpoon',
        finder = require('telescope.finders').new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set('n', '<C-e>', function()
    toggle_telescope(harpoon:list())
end,{ desc = 'Open harpoon window' })

