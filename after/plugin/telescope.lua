local telescope = require('telescope')

telescope.setup {
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "target"
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
}

telescope.load_extension("live_grep_args")

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    telescope.extensions.live_grep_args.live_grep_args({ vimgrep_arguments = {
        "rg",
        "--hidden",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
    } })
end)
