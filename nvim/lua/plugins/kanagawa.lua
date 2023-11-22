return {
    "rebelot/kanagawa.nvim",
    config = function ()
        require("kanagawa").setup({
            keywordStyle = { italic = false },
        })
        vim.cmd[[colorscheme kanagawa-dragon]]

    end
}
