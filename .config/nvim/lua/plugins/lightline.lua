return {
    'itchyny/lightline.vim',
    lazy = false, 
    config = function()
        vim.o.showmode = false
        vim.g.lightline = {
            active = {
                left = {
                    { 'mode', 'paste' },
                    { 'readonly', 'filename', 'modified' }
                },
                right = {
                    { 'lineinfo' },
                    { 'percent' },
                    { 'fileencoding', 'filetype' }
                },
            },
            component_function = {
                filename = 'LightlineFilename'
            },
        }
        function LightlineFilenameInLua(opts)
            if vim.fn.expand('%:t') == '' then
                return '[No Name]'
            else
                return vim.fn.getreg('%')
            end
        end
        -- https://github.com/itchyny/lightline.vim/issues/657
        vim.api.nvim_exec(
            [[
            function! g:LightlineFilename()
                return v:lua.LightlineFilenameInLua()
            endfunction
            ]],
            true
        )
    end
}