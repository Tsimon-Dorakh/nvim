vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move selected up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- duplicate selected
vim.keymap.set({ "v" }, "<C-d>", "y'>p")

vim.keymap.set("n", "<C-n>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>bprev<CR>")
vim.keymap.set("n", "<C-q>", "<cmd>bd<CR>")

vim.keymap.set('n', '<leader>gr', function()
    require('telescope.builtin').lsp_references()
end, { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>d', ':lua require("telescope.builtin").diagnostics()<CR>', { noremap = true, silent = true })

-- vim.keymap.set({"n"}, "<C-f5>", "<cmd>!cargo run <CR>")
vim.keymap.set({ "n" }, "<C-f5>", function()
    if vim.bo.filetype == "c" then
        vim.cmd("!gcc % && ./a.out")
    elseif vim.bo.filetype == "python" then
        vim.cmd("!python3 %")
    elseif vim.bo.filetype == "java" then
        vim.cmd("!java %")
    else
        vim.cmd("!cargo run")
    end
end, { noremap = true, silent = true })

vim.keymap.set({ "n" }, "<C-f6>", function()
    vim.cmd("!cargo test")
end, { noremap = true, silent = true })
