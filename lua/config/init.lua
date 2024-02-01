local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.options")
require("config.keymaps")

local opts = {
	defaults = {
		lazy = true,
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
            "matchparen",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	install = {
		colorscheme = { "nightfox" },
	}
}

require("lazy").setup("plugins", opts)

-- Harpoon --
local harpoon = require('harpoon')
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
-- Delete buffer
vim.keymap.set("n", "<leader>d", function()
        local index = tonumber(vim.fn.input("Remove buffer no.: "))
        harpoon:list():removeAt(index) 
end)
-- Delete all buffers
vim.keymap.set("n", "<leader>r", function() harpoon:list():clear() end)

