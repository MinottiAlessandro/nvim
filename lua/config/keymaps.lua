vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = 'Open file explorer'})
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true, desc = 'Open file explorer'})
vim.keymap.set('v', '<', '<gv', {desc = 'Indent left'})
vim.keymap.set('v', '>', '>gv', {desc = 'Indent right'})
vim.api.nvim_set_keymap('n', '<leader>o', ':vsp | enew<CR>', { noremap = true, silent = true, desc = 'Split screen w new buffer' })
--- vim.api.nvim_set_keymap('n', '\'', ':vertical resize +5<CR>', { noremap = true, silent = true, desc = 'Enlarge the current pane' })
--- vim.api.nvim_set_keymap('n', '\"', ':vertical resize -5<CR>', { noremap = true, silent = true, desc = 'Reduce the current pane' })
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {desc = 'Open UndoTree'})
vim.api.nvim_set_keymap('n', '<leader>t', [[:%s/\s\+$//e<CR>:noh<CR>]], {desc = 'Trail spaces'})
vim.keymap.set('n', '<leader>l', ':Lazy<CR>', {desc = 'Open Lazy'})
vim.keymap.set('n', '<leader>m', ':Mason<CR>', {desc = 'Open Mason'})
vim.keymap.set('n', '<leader>M', function()
  vim.cmd('delmarks! | delmarks A-Z | delmarks 0-9')
  vim.notify('All marks cleared!', vim.log.levels.INFO)
end, { noremap = true, silent = true })

-- Jump to definition
vim.api.nvim_set_keymap('n', '<leader>jd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc='Jump to definition'})
-- Jump to implementation
vim.api.nvim_set_keymap('n', '<leader>ji', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true, desc='Jump to implementation' })
-- Jump references
vim.api.nvim_set_keymap('n', '<leader>jr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true, desc='Jump to references' })
-- Jump to the latest cursor position
vim.keymap.set('n', '<leader>jl', '<C-o>', { desc = 'Jump to previous position in jumplist' })
-- Jump to the beginning of the function
vim.keymap.set('n', '<leader>ju', function()
  -- First, create a jumplist entry at current position
  -- by using the m' mark command
  vim.cmd("normal! m'")

  local ts_utils = require('nvim-treesitter.ts_utils')
  local node = ts_utils.get_node_at_cursor()

  -- List of possible function-like node types across languages
  local function_types = {
    'function_definition',
    'method_definition',
    'function_declaration',
    'function',
    'function_item',
    'method',
    'function_expression',
    'arrow_function',
    'method_declaration'
  }

  -- Traverse up the tree to find the function definition
  while node do
    local node_type = node:type()
    local is_function = false

    for _, func_type in ipairs(function_types) do
      if node_type == func_type then
        is_function = true
        break
      end
    end

    if is_function then
      break
    end

    node = node:parent()
  end

  if node then
    local start_row, start_col, _, _ = node:range()
    -- Jump to the function start
    vim.api.nvim_win_set_cursor(0, {start_row + 1, start_col})
  else
    vim.notify('No surrounding function found', vim.log.levels.INFO)
  end
end, { desc = 'Jump to beginning of current function' })
vim.api.nvim_set_keymap('n', '<leader>jb', '<C-o>', { noremap = true, desc='Jump back' }) -- Back
vim.api.nvim_set_keymap('n', '<leader>jf', '<C-i>', { noremap = true, desc='Jump forward' }) -- Forward

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

