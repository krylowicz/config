return {
    "eddyekofo94/gruvbox-flat.nvim",
    config = function()
        vim.o.background = "dark"
        vim.g.gruvbox_flat_style = "dark"
        vim.g.gruvbox_italic_keywords = false
        vim.cmd[[colorscheme gruvbox-flat]]
    end
}

