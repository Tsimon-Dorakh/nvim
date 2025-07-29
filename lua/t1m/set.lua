-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"
vim.opt.autowriteall = true

vim.opt.modeline = true

vim.opt.list = true
vim.opt.listchars = {
    space = '.',
    tab = '>~',
    -- eol = '$'
}

-- https://vi.stackexchange.com/a/42391
vim.opt.foldmethod = "expr"
vim.opt.foldlevel = 20
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- from https://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/#set-up-rust-with-neovimhttps://rsdlt.github.io/posts/rust-nvim-ide-guide-walkthrough-development-debug/#set-up-rust-with-neovim
-- vim.wo.fodmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

