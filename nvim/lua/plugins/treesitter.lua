return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        if vim.fn.has("win32") == 1 then
            require("nvim-treesitter.install").compilers = {"clang"}
        end

        require("nvim-treesitter.configs").setup {
            ensure_installed = {"lua", "python", "rust"},

            auto_install = true,

            highlight = {
                enable = true,
                use_languagetree = true
            },

            indent = {
                enable = true
            }
        }
    end
}
