local telescope = require('telescope')

telescope.setup {
    defaults = { file_ignore_patterns = {
        "node_modules",
        "target"
    } }
}

telescope.load_extension("live_grep_args")

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

