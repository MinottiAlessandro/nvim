local config = function()
    local treesitter = require("nvim-treesitter.configs")
    treesitter.setup({
        indent = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
        ensure_installed = {
            "markdown",
            "json",
            "javascript",
            "typescript",
            "python",
            "rust",
            "c",
            "lua",
            "html",
            "css",
            "yaml",
            "bash",
            "angular",
            "dockerfile",
            "gitignore",
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
        },
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config
}
