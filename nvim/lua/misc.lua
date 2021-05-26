require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
    indent = {
        enable = false
    }
}

require"toggleterm".setup{
    size = 16,
    open_mapping = [[<C-t>]],
    shade_filetypes = {},
    shade_terminals = true,
    persist_size = true,
    direction = 'horizontal'
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    ["h"] = tree_cb("edit"),
    ["l"] = tree_cb("edit"),
    ["<CR>"] = tree_cb("cd")
}

require'nvim-treesitter.configs'.setup {
    rainbow = {
        enable = true
    }
}

-- init.lua
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false, -- experimental
    position = 'right',
    keymaps = {
        close = "<Esc>",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
}
