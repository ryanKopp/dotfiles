require("ryan")

-- nix attempted lsp parser dir fix
require("nvim-treesitter.configs").setup({
    parser_install_dir = vim.fn.stdpath("data") .. "/treesitter/parsers",
    highlight = { enable = true },
    indent = { enable = true },
    -- Add other treesitter modules as needed
})

-- Ensure the parser directory is in Neovim's runtimepath
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/treesitter/parsers")
