local opts = {
    enusre_installed = {
        "efm",
		"bashls",
		"ts_ls",
		"solidity",
		"tailwindcss",
		"pyright",
		"lua_ls",
		"emmet_ls",
		"jsonls",
		"clangd",
        "gopls",
    },
    automatic_installation = true,
}

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim"
}
