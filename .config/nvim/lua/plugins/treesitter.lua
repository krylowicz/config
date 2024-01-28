return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "python" },

            auto_install = false,

            highlight = {
                disable = { "rust" },
                enable = true,
                use_languagetree = true
            },

            indent = {
                enable = true
            },

            vim.api.nvim_set_hl(0, "@import.python", { fg = "#d5c4a1" }),
            vim.api.nvim_set_hl(0, "@import_module.python", { fg = "#8ec07c" }),
            vim.api.nvim_set_hl(0, "@decorator.python", { fg = "#fabd2f" }),
            vim.api.nvim_set_hl(0, "@private_constant.python", { fg = "#fb4934" }),

            vim.api.nvim_set_hl(0, "@constant.python", { fg = "#fb4934" }),
            vim.api.nvim_set_hl(0, "@variable.python", { fg = "#d5c4a1" }),
            vim.api.nvim_set_hl(0, "@variable.member.python", { fg = "#d5c4a1" }),
            vim.api.nvim_set_hl(0, "@variable.parameter.python", { fg = "#d5c4a1" }),
        }
    end
}
